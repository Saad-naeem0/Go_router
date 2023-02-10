import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/navbar.dart';
import 'package:gorouter/screens/home.dart';
import 'package:gorouter/screens/search.dart';
import 'package:gorouter/screens/settings.dart';


// GoRouter router = GoRoute();
class MyRouter {
  GoRouter router = GoRouter(routes: [
    ShellRoute(
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => MaterialPage(child: HomePage(context)),
          ),
          GoRoute(
              path: '/search',
              pageBuilder: (context, state) => MaterialPage(child: Search())),
          GoRoute(
              path: '/setting',
              pageBuilder: (context, state) => MaterialPage(child: Setting())),
        ],
        builder: (context, state, child) {
          return NavBar(child: child);
        }),
  ]
  );
}