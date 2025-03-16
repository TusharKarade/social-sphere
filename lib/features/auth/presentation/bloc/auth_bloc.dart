// blocs/auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_sphere/features/auth/data/repositories/auth_repository.dart';
import 'package:social_sphere/features/auth/presentation/bloc/auth_event.dart';
import 'package:social_sphere/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.signUp(event.email, event.password, event.username);

      // Emit success state with the username from Firestore
      emit(AuthSuccess(userName: event.username));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userData = await authRepository.login(event.email, event.password);

      if (userData != null) {
        emit(AuthSuccess(userName: userData['username'] ?? "Unknown"));
      } else {
        emit(AuthFailure("User data not found in Firestore"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    await authRepository.logout();
    emit(AuthInitial());
  }
}
