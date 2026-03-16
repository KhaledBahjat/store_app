import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:store_app/features/auth/logic/model/users_model.dart';
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
      await clint.auth.signUp(email: email, password: password);

      await addUserData(email: email, name: name);
      await getUserData();
      await clint.auth.signOut();

      emit(SignUpSuccess());
      await getUserData();
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
      await addUserData(email: googleUser.email, name: googleUser.displayName!);
      await getUserData();
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

  Future<void> sendPasswordResetEmail({required String email}) async {
    emit(PasswordResetEmailLoading());
    try {
      await clint.auth.resetPasswordForEmail(email);
      emit(PasswordResetEmailSuccess());
    } on AuthException catch (e) {
      emit(PasswordResetEmailFailure(errorMessage: e.message));
    } catch (e) {
      emit(
        PasswordResetEmailFailure(
          errorMessage: 'An error occurred while sending password reset email',
        ),
      );
    }
  }

  Future<void> addUserData({
    required String email,
    required String name,
  }) async {
    emit(AddedUserDataLoading());
    try {
      await clint.from('users').upsert({
        'name': name,
        'email': email,
        'id': clint.auth.currentUser!.id,
      });
      emit(AddedUserDataSuccess());
    } on AuthException catch (e) {
      emit(AddedUserDataFailure(errorMessage: e.message));
    } catch (e) {
      log(e.toString());
      emit(
        AddedUserDataFailure(
          errorMessage: 'An error occurred while adding user data',
        ),
      );
    }
  }

  UsersModel? userData;
  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      final jsonData = await clint
          .from('users')
          .select()
          .eq('id', clint.auth.currentUser!.id);
      log(jsonData.toString());
      userData = UsersModel.fromJson(jsonData[0]);
      emit(GetUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(
        GetUserDataFailure(
          errorMessage: 'An error occurred while getting user data',
        ),
      );
    }
  }
}
