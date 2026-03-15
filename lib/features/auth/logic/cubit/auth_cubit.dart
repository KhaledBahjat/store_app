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
      await clint.auth.signInWithPassword(
        email: email,
        password: password,
      );
      emit(SignInSuccess());
    } on AuthException catch (e) {
      emit(SignInFailure(errorMessage: e.message));
    } catch (e) {
      emit(SignInFailure(errorMessage: 'An error occurred while signing in'));
    }
  }

  Future<void> signUp({required String name,required String email, required String password}) async {
    emit(SignUpLoading());
    try {
       await clint.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
        }
      );
      emit(SignUpSuccess());
    
    } on AuthException catch (e) {
      emit(SignUpFailure(errorMessage: e.message));
    } catch (e) {
      emit(SignUpFailure(errorMessage: 'An error occurred while signing up'));
    }
  }
}
