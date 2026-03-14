import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/app_routs.dart';
import 'package:store_app/features/auth/sign_in.dart';
import 'package:store_app/features/auth/sign_up.dart';
import 'package:store_app/features/auth/widgets/forget_password_widget.dart';
import 'package:store_app/features/favorite/ui/favorite_view.dart';
import 'package:store_app/features/home/ui/home_view.dart';
import 'package:store_app/features/nav_bar/ui/main_home_view.dart';
import 'package:store_app/features/pofile/ui/profile_view.dart';
import 'package:store_app/features/store/ui/store_view.dart';

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
      GoRoute(
        path: AppRouts.mainHomeScreen,
        builder: (context, state) => MainHomeView(),
        name: AppRouts.mainHomeScreen,
      ),
      GoRoute(
        path: AppRouts.homeviewScreen,
        builder: (context, state) => const HomeView(),
        name: AppRouts.homeviewScreen,
      ),
      GoRoute(
        path: AppRouts.profileviewScreen,
        builder: (context, state) => const ProfileView(),
        name: AppRouts.profileviewScreen,
      ),
      GoRoute(
        path: AppRouts.storeviewScreen,
        builder: (context, state) => const StoreView(),
        name: AppRouts.storeviewScreen,
      ),
      GoRoute(
        path: AppRouts.favoriteviewScreen,
        builder: (context, state) => const FavoriteView(),
        name: AppRouts.favoriteviewScreen,
      ),
    ],
    initialLocation: AppRouts.loginScreen,
  );
}
