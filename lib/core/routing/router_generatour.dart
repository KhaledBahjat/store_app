import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/app_routs.dart';
import 'package:store_app/features/auth/sign_in.dart';
import 'package:store_app/features/auth/sign_up.dart';
import 'package:store_app/features/auth/widgets/forget_password_widget.dart';

class RouterGeneratour {
  static GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: AppRouts.loginScreen,
        builder: (context, state) => const SignIn(),
        name: AppRouts.loginScreen,
      ),
      GoRoute(
        path: AppRouts.forgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordWidget(),
        name: AppRouts.forgetPasswordScreen,
      ),
      GoRoute(
        path: AppRouts.registerScreen,
        builder: (context, state) => const SignUp(),
        name: AppRouts.registerScreen,
      ),
    ],
    initialLocation: AppRouts.loginScreen,
  );
}
