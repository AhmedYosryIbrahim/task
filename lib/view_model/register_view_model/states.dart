abstract class AppRegisterStates {}

class AppRegisterInitialState extends AppRegisterStates {}

class AppRegisterChangePasswordVisibilityState extends AppRegisterStates {}





// register user with email and password and add user to firebase firestore
class AppRegisterCreateUserLoadingState extends AppRegisterStates {}


class AppRegisterCreateUserSuccessState extends AppRegisterStates {
  final String uId;

  AppRegisterCreateUserSuccessState(this.uId);
}

class AppRegisterCreateUserErrorState extends AppRegisterStates {
  final String error;
  AppRegisterCreateUserErrorState(this.error);
}
