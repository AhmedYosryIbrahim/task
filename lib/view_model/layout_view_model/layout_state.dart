part of 'layout_cubit.dart';
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class LayoutChangeTapBarState extends LayoutState {}

class LayoutGetUserLoadingState extends LayoutState {}
class LayoutGetUserSuccessState extends LayoutState {}
class LayoutGetUserErrorState extends LayoutState {
  final String error;
  LayoutGetUserErrorState(this.error);
}

class LayoutPickPostImageSuccessState extends LayoutState {}
class LayoutPickPostImageErrorState extends LayoutState {}

class LayoutUploadPostImageLoadingState extends LayoutState {}
class LayoutUploadPostImageSuccessState extends LayoutState {
  final String imageUrl;
  LayoutUploadPostImageSuccessState(this.imageUrl);
}
class LayoutUploadPostImageErrorState extends LayoutState {
  final String error;
  LayoutUploadPostImageErrorState(this.error);
}

class LayoutCreatePostLoadingState extends LayoutState {}
class LayoutCreatePostSuccessState extends LayoutState {}
class LayoutCreatePostErrorState extends LayoutState {
  final String error;
  LayoutCreatePostErrorState(this.error);
}

class LayoutGetPostsLoadingState extends LayoutState {}
class LayoutGetPostsSuccessState extends LayoutState {

}
class LayoutGetPostsErrorState extends LayoutState {
  final String error;
  LayoutGetPostsErrorState(this.error);
}

class LayoutLikePostLoadingState extends LayoutState {}
class LayoutLikePostSuccessState extends LayoutState {}
class LayoutLikePostErrorState extends LayoutState {
  final String error;
  LayoutLikePostErrorState(this.error);
}

class LayoutUnlikePostLoadingState extends LayoutState {}
class LayoutUnlikePostSuccessState extends LayoutState {}
class LayoutUnlikePostErrorState extends LayoutState {
  final String error;
  LayoutUnlikePostErrorState(this.error);
}

class LayoutSavePostLoadingState extends LayoutState {}
class LayoutSavePostSuccessState extends LayoutState {}
class LayoutSavePostErrorState extends LayoutState {
  final String error;
  LayoutSavePostErrorState(this.error);
}

class LayoutUnsavePostLoadingState extends LayoutState {}
class LayoutUnsavePostSuccessState extends LayoutState {}
class LayoutUnsavePostErrorState extends LayoutState {
  final String error;
  LayoutUnsavePostErrorState(this.error);
}

class LayoutGetSavedPostsLoadingState extends LayoutState {}
class LayoutGetSavedPostsSuccessState extends LayoutState {}
class LayoutGetSavedPostsErrorState extends LayoutState {
  final String error;
  LayoutGetSavedPostsErrorState(this.error);
}
class LayoutPickProfileImageLoadingState extends LayoutState {}
class LayoutPickProfileImageSuccessState extends LayoutState {}
class LayoutPickProfileImageErrorState extends LayoutState {
  final String error;
  LayoutPickProfileImageErrorState(this.error);
}
class LayoutPickCoverImageLoadingState extends LayoutState {}
class LayoutPickCoverImageSuccessState extends LayoutState {}
class LayoutPickCoverImageErrorState extends LayoutState {
  final String error;
  LayoutPickCoverImageErrorState(this.error);
}

class LayoutChangeEmailLoadingState extends LayoutState {}
class LayoutChangeEmailSuccessState extends LayoutState {}
class LayoutChangeEmailErrorState extends LayoutState {
  final String error;
  LayoutChangeEmailErrorState(this.error);
}

class LayoutEditUserLoadingState extends LayoutState {}
class LayoutEditUserSuccessState extends LayoutState {}
class LayoutEditUserErrorState extends LayoutState {
  final String error;
  LayoutEditUserErrorState(this.error);
}