import 'package:bloc/bloc.dart';
import 'package:e_commerce/Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
   final AuthService authService;
  AuthCubit(this.authService) : super(AuthInitial()){
     authService.authChanges().listen((user) {
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    });
  }
  
  
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authService.login(email, password);
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthError("Login failed"));
      }
    } catch (e) {
      emit(AuthError("Login error: $e"));
    }
  }


   Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authService.signUp(email, password);
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthError("Signup failed"));
      }
    } catch (e) {
      emit(AuthError("Signup error: $e"));
    }
  }
  

}

