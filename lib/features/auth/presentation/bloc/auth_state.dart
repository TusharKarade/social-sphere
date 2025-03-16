// blocs/auth_state.dart
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String userName;

  AuthSuccess({required this.userName});
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}
