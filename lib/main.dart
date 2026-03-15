import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/routing/router_generatour.dart';
import 'package:store_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xtmhgoctgsnltpyrjyvm.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh0bWhnb2N0Z3NubHRweXJqeXZtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM1NTY1ODIsImV4cCI6MjA4OTEzMjU4Mn0.V6Up4nx_GJK_6tqpxqZXrkQhj60oIeLxcPVJM8srdCQ',
  );
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
