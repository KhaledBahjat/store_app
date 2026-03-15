part of 'auth_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class SignInSuccess extends AuthCubitState {}

final class SignInLoading extends AuthCubitState {}

final class SignInFailure extends AuthCubitState {
  final String errorMessage;
  SignInFailure({required this.errorMessage});
}

final class SignUpSuccess extends AuthCubitState {}

final class SignUpLoading extends AuthCubitState {}

final class SignUpFailure extends AuthCubitState {
  final String errorMessage;
  SignUpFailure({required this.errorMessage});
}

final class GoogleSignInSuccess extends AuthCubitState {}

final class GoogleSignInLoading extends AuthCubitState {}

final class GoogleSignInFailure extends AuthCubitState {
  final String errorMessage;

  GoogleSignInFailure({required this.errorMessage});

}
