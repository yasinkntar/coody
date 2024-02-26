class AuthStates {}

class AuthInitState extends AuthStates {}

// login
class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {
  final String error;

  LoginErrorState({required this.error});
}

// login
class LoginGoogleLoadingState extends AuthStates {}

class LoginGoogleSuccessState extends AuthStates {}

class LoginGoogleErrorState extends AuthStates {
  final String error;

  LoginGoogleErrorState({required this.error});
}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterErrorState extends AuthStates {
  final String error;

  RegisterErrorState({required this.error});
}

class RestPasswordLoadingState extends AuthStates {}

class RestPasswordSuccessState extends AuthStates {}

class RestPasswordErrorState extends AuthStates {
  final String error;

  RestPasswordErrorState({required this.error});
}
