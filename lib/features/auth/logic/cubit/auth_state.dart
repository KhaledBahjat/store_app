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

final class SignOutSuccess extends AuthCubitState {}
final class SignOutLoading extends AuthCubitState {}
final class SignOutFailure extends AuthCubitState {
  final String errorMessage;

  SignOutFailure({required this.errorMessage});
}

final class PasswordResetEmailSuccess extends AuthCubitState {}
final class PasswordResetEmailLoading extends AuthCubitState {}
final class PasswordResetEmailFailure extends AuthCubitState {
  final String errorMessage;

  PasswordResetEmailFailure({required this.errorMessage});
}


final class AddedUserDataSuccess extends AuthCubitState {}
final class AddedUserDataLoading extends AuthCubitState {}
final class AddedUserDataFailure extends AuthCubitState {
  final String errorMessage;

  AddedUserDataFailure({required this.errorMessage});
}
