
import 'package:go_router/go_router.dart';
import 'package:internsala_assignment/features/home/home.dart';
import 'package:internsala_assignment/features/splash/splash.dart';

final GoRouter router=GoRouter(
  initialLocation: SplashScreen.routePath,
  routes: [
    GoRoute(path:SplashScreen.routePath,builder: (context, state) => const SplashScreen(),),

    GoRoute(path:HomeScreen.routePath,builder: (context, state)=> HomeScreen(),),
  ]
);