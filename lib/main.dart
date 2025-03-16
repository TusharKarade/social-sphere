import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_sphere/core/theme/theme.dart';
import 'package:social_sphere/features/auth/data/repositories/auth_repository.dart';
import 'package:social_sphere/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:social_sphere/features/auth/presentation/screens/login_screen.dart';
import 'package:social_sphere/features/auth/presentation/screens/signup_screen.dart';
import 'package:social_sphere/features/posts/data/repositories/post_repository.dart';
import 'package:social_sphere/features/posts/presentation/bloc/post_bloc.dart';
import 'package:social_sphere/features/posts/presentation/screens/home_screen.dart';
import 'package:social_sphere/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(AuthRepository()),
          ),
          BlocProvider(
            create: (context) => PostBloc(PostRepository()),
          ),
        ],
        child: MaterialApp(
          title: 'Social Sphere',
          theme: AppTheme.lightThemeMode,
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginScreen(),
            '/signup': (context) => SignupScreen(),
            '/home': (context) {
              final args = ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>?;
              return HomeScreen(username: args?['username'] ?? "Unknown");
            },
          },
        ),
      ),
    );
  }
}
