import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loginapp/presentation/screens/home_screen.dart';
import 'package:loginapp/presentation/screens/login_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: LoginScreen().name,
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/home/:username/:passUsername',
          name: HomeScreen().name,
          builder: (BuildContext context, GoRouterState state) {
            final username = state.pathParameters['username'] ?? 'Sin nombre de usuario';
            final passUsername = state.pathParameters['passUsername'] ?? 'Sin nombre de clave';
            return HomeScreen(username: username, passUsername: passUsername,);
          },
        ),
      ],
    ),
  ],
);