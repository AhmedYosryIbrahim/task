
abstract class AppLoginStates {}

class AppLoginInitialState extends AppLoginStates {}

class AppLoginChangePasswordVisibilityState extends AppLoginStates {}

class AppLoginLoadingState extends AppLoginStates {}

class AppLoginSuccessState extends AppLoginStates {
  final String uId;

  AppLoginSuccessState(this.uId);
}

class AppLoginErrorState extends AppLoginStates {
  final String error;

  AppLoginErrorState(this.error);
}
class AppLoginResetPasswordLoadingState extends AppLoginStates {}
class AppLoginResetPasswordSuccessState extends AppLoginStates {}
class AppLoginResetPasswordErrorState extends AppLoginStates {
  final String error;

  AppLoginResetPasswordErrorState(this.error);
}

