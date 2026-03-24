import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/functions/observer.dart';
import 'package:store_app/core/routing/router_generatour.dart';
import 'package:store_app/core/sensetive_data.dart';
import 'package:store_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xtmhgoctgsnltpyrjyvm.supabase.co',
    anonKey: apiKey,
  );
  Bloc.observer = MyObserver();
  runApp(const MarketApp());
}

class MarketApp extends StatelessWidget {
  const MarketApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => BlocProvider(
        create: (context) => AuthCubitCubit(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: RouterGeneratour.goRouter,
          title: 'Market App',
          theme: ThemeData(primarySwatch: Colors.blue),
        ),
      ),
    );
  }
}
