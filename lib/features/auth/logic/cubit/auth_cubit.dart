import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit() : super(AuthCubitInitial());
  SupabaseClient clint = Supabase.instance.client;
  final googleSignIn = GoogleSignIn.instance;

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    try {
      await clint.auth.signInWithPassword(email: email, password: password);
      emit(SignInSuccess());
    } on AuthException catch (e) {
      emit(SignInFailure(errorMessage: e.message));
    } catch (e) {
      emit(SignInFailure(errorMessage: 'An error occurred while signing in'));
    }
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    try {
      await clint.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      emit(SignUpSuccess());
    } on AuthException catch (e) {
      emit(SignUpFailure(errorMessage: e.message));
    } catch (e) {
      emit(SignUpFailure(errorMessage: 'An error occurred while signing up'));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());
    try {
      const webClientId =
          '145957994613-qbh8vv56n77tb38n44rea1kusfkvgg07.apps.googleusercontent.com';
      final scopes = ['email', 'profile'];
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(serverClientId: webClientId);
      final googleUser = await googleSignIn.attemptLightweightAuthentication();
      if (googleUser == null) {
        throw AuthException('Failed to sign in with Google.');
      }
      final authorization =
          await googleUser.authorizationClient.authorizationForScopes(scopes) ??
          await googleUser.authorizationClient.authorizeScopes(scopes);
      final idToken = googleUser.authentication.idToken;
      if (idToken == null) {
        throw AuthException('No ID Token found.');
      }
      await clint.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: authorization.accessToken,
      );
      emit(GoogleSignInSuccess());
    } on Exception catch (e) {
      emit(GoogleSignInFailure(errorMessage: e.toString()));
    }
  }


  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await clint.auth.signOut();
      await googleSignIn.signOut();
      emit(SignOutSuccess());
    } on AuthException catch (e) {
      emit(SignOutFailure(errorMessage: e.message));
    } catch (e) {
      emit(SignOutFailure(errorMessage: 'An error occurred while signing out'));
    }
  }
}
