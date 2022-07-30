import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/helpers/local_storage/local_storage.dart';
import 'package:untitled/models/post_model.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/view/home_view/home_screen.dart';
import 'package:untitled/view/profile_view/profile_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    ProfileScreen(),
  ];

  void changeNavBarIndex(int index) {
    currentIndex = index;

    emit(LayoutChangeTapBarState());
  }

  //get user from firebase firestore
  UserModel? user;

  void getUser() {
    emit(LayoutGetUserLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(LocalStorage.getData(key: 'uId'))
        .get()
        .then((value) {
      if (value.exists) {
        user = UserModel.fromJson(value.data()!);
        emit(LayoutGetUserSuccessState());
      } else {
        emit(LayoutGetUserErrorState('user not found'));
      }
    }).catchError((error) {
      emit(LayoutGetUserErrorState(error.toString()));
    });
  }
  // pick profile image from gallery and save it to firebase storage and update user profile image url
  void pickProfileImage() async {
    emit(LayoutPickProfileImageLoadingState());
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final storageRef = FirebaseStorage.instance.ref().child('profile_images');
      final uploadTask = storageRef.child(LocalStorage.getData(key: 'uId')).putFile(File(image.path));
      final url = await (await uploadTask.whenComplete(() => true)).ref.getDownloadURL();
      user!.profileImageUrl = url;
      FirebaseFirestore.instance
          .collection('users')
          .doc(LocalStorage.getData(key: 'uId'))
          .update({'profileImageUrl': url});
      emit(LayoutPickProfileImageSuccessState());
    } else {
      emit(LayoutPickProfileImageErrorState('image not found'));
    }
  }
  // pick cover image from gallery and save it to firebase storage and update user cover image url
  void pickCoverImage() async {
    emit(LayoutPickCoverImageLoadingState());
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final storageRef = FirebaseStorage.instance.ref().child('cover_images');
      final uploadTask = storageRef.child(LocalStorage.getData(key: 'uId')).putFile(File(image.path));
      final url = await (await uploadTask.whenComplete(() => true)).ref.getDownloadURL();
      user!.coverImageUrl = url;
      FirebaseFirestore.instance
          .collection('users')
          .doc(LocalStorage.getData(key: 'uId'))
          .update({'coverImageUrl': url});
      emit(LayoutPickCoverImageSuccessState());
    } else {
      emit(LayoutPickCoverImageErrorState('image not found'));
    }
  }
  // change user email in auth firebase
  void changeEmail(String email) {
    emit(LayoutChangeEmailLoadingState());
    FirebaseAuth.instance.currentUser!.updateEmail(email).then((value) {
      emit(LayoutChangeEmailSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutChangeEmailErrorState(error.toString()));
    });
  }

  // edit user  info in firebase firestore
  void editUser({required String firstName, required String lastName, required String email}) {
    emit(LayoutEditUserLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(LocalStorage.getData(key: 'uId'))
        .update({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    })
        .then((value) {
          if(email != user!.email){
            changeEmail(email);
          }
      emit(LayoutEditUserSuccessState());
    }).catchError((error) {
      emit(LayoutEditUserErrorState(error.toString()));
    });
  }


  // pick post image from gallery
  File? postImage;
  var picker = ImagePicker();

  Future<void> pickPostImageGallery(context) async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      postImage = File(image.path);
      emit(LayoutPickPostImageSuccessState());
    } else {
      emit(LayoutPickPostImageErrorState());
    }
  }

  // upload post image to firebase storage and create post in firebase firestore
  void uploadPostImage({required String content}) async {
    if (postImage == null) {
      createPost(content: content);
    } else {
      emit(LayoutUploadPostImageLoadingState());
      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('post_images/${DateTime.now().millisecondsSinceEpoch}');
      final UploadTask uploadTask = storageReference.putFile(postImage!);
      await uploadTask.then((value) {
        storageReference.getDownloadURL().then((value) {
          createPost(content: content, imageUrl: value);
        });
      }).catchError((error) {
        emit(LayoutUploadPostImageErrorState(error.toString()));
      });
    }
  }

  // create post in firebase firestore with post image url
  void createPost({required String content, String? imageUrl}) {
    emit(LayoutCreatePostLoadingState());
    PostModel postModel = PostModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      imageUrl: imageUrl,
      createAt: DateTime.now().toIso8601String(),
      user: user,
      likes: [],
    );
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postModel.id)
        .set(postModel.toJson())
        .then((value) {
      emit(LayoutCreatePostSuccessState());
    }).catchError((error) {
      emit(LayoutCreatePostErrorState(error.toString()));
    });
  }

  // get posts from firebase firestore
  List<PostModel> posts = [];

  void getPosts() {
    emit(LayoutGetPostsLoadingState());
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      if (value.docs.isNotEmpty) {
        posts = value.docs.map((e) => PostModel.fromJson(e.data())).toList();
        emit(LayoutGetPostsSuccessState());
      } else {
        emit(LayoutGetPostsErrorState('posts not found'));
      }
    }).catchError((error) {
      emit(LayoutGetPostsErrorState(error.toString()));
    });
  }

  //make post like
  void likePost({required String postId}) {
    emit(LayoutLikePostLoadingState());
    FirebaseFirestore.instance.collection('posts').doc(postId).update({
      'likes': FieldValue.arrayUnion([LocalStorage.getData(key: 'uId')]),
    }).then((value) {
      emit(LayoutLikePostSuccessState());
    }).catchError((error) {
      emit(LayoutLikePostErrorState(error.toString()));
    });
  }

  //make post unlike
  void unlikePost({required String postId}) {
    emit(LayoutUnlikePostLoadingState());
    FirebaseFirestore.instance.collection('posts').doc(postId).update({
      'likes': FieldValue.arrayRemove([LocalStorage.getData(key: 'uId')]),
    }).then((value) {
      emit(LayoutUnlikePostSuccessState());
    }).catchError((error) {
      emit(LayoutUnlikePostErrorState(error.toString()));
    });
  }

  // save post in users posts
  void savePost({required String postId}) {
    emit(LayoutSavePostLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(LocalStorage.getData(key: 'uId'))
        .update({
      'posts': FieldValue.arrayUnion([postId]),
    }).then((value) {
      emit(LayoutSavePostSuccessState());
    }).catchError((error) {
      emit(LayoutSavePostErrorState(error.toString()));
    });
  }

  // unsave post in users posts
  void unsavePost({required String postId}) {
    emit(LayoutUnsavePostLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(LocalStorage.getData(key: 'uId'))
        .update({
      'posts': FieldValue.arrayRemove([postId]),
    }).then((value) {
      emit(LayoutUnsavePostSuccessState());
    }).catchError((error) {
      emit(LayoutUnsavePostErrorState(error.toString()));
    });
  }

  // get saved posts from users posts list
  List<PostModel> savedPosts = [];

  void getSavedPosts() async {
    emit(LayoutGetSavedPostsLoadingState());
    savedPosts =await Future.wait(user!.posts!
        .map(
          (e) async => await FirebaseFirestore.instance
          .collection('posts')
          .doc(e)
          .get()
          .then((value) {
        return PostModel.fromJson(value.data()!);
      }),
    )
        .toList());
    emit(LayoutGetSavedPostsSuccessState());
  }
}
