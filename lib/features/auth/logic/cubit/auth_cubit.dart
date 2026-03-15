import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit() : super(AuthCubitInitial());
  SupabaseClient clint = Supabase.instance.client;
  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    try {
      final response = await clint.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.session != null) {
        emit(SignInSuccess());
      } else {
        emit(SignInFailure(errorMessage: 'Failed to sign in'));
      }
    } on AuthException catch (e) {
      emit(SignInFailure(errorMessage: e.message));
    } catch (e) {
      emit(SignInFailure(errorMessage: 'An error occurred while signing in'));
    }
  }
}
