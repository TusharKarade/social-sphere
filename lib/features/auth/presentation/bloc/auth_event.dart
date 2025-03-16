// blocs/auth_event.dart
abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;

  SignUpEvent(this.email, this.password, this.username);
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class LogoutEvent extends AuthEvent {}
