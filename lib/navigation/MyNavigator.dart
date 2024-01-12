import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midyear/content/pages/admin/AdminAnnouncementPage.dart';
import 'package:midyear/content/pages/admin/ViewSignUp.dart';
import 'package:midyear/content/pages/user/UserAnnouncementPage.dart';
import 'package:midyear/content/pages/admin/ViewAttendance.dart';
import 'package:midyear/database/data/Event.dart';

import '../content/pages/admin/AdminHome.dart';
import 'NavigationLoginPage.dart';
import 'NavigationPage.dart';
import 'UserState.dart';
import '../content/pages/Profile.dart';
import '../content/pages/admin/AdminEvent.dart';
import '../content/pages/user/UserEvent.dart';
import '../content/pages/user/UserHome.dart';
import '../content/pages/LoginPage.dart';

class MyNavigator {
  static final MyNavigator _instance = MyNavigator._internal();

  static MyNavigator get instance => _instance;
  factory MyNavigator() {
    return _instance;
  }

  static late StatefulNavigationShell _navigationShell;
  static StatefulNavigationShell get shell => _navigationShell;

  static late final GoRouter router;

  static late int _navigationbarIndex;
  static int get navigationbarIndex => _navigationbarIndex;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> loginNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> adminHomeNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> userHomeNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> adminEventNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> userEventNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> profileNavigatorKey =
      GlobalKey<NavigatorState>();

  static const String loginPath = '/login';
  static const String adminHomePath = '/adminHome';
  static const String userHomePath = '/userHome';
  static const String adminEventPath = '/adminEvent';
  static const String userEventPath = '/userEvent';
  static const String profilePath = '/profile';

  static const String adminAnnouncementPath = '/AdminAnnouncementPage';
  static const String userAnnouncementPath = '/announcementPage';

  static const String adminViewAttendance = '/AdminViewAttendance';
  static const String adminViewSignUp = '/AdminViewSignUp';

  MyNavigator._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(navigatorKey: loginNavigatorKey, routes: [
            GoRoute(
                path: loginPath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const LoginPage(),
                    state: state,
                  );
                }),
          ]),
          StatefulShellBranch(navigatorKey: adminHomeNavigatorKey, routes: [
            GoRoute(
              path: adminHomePath,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const AdminHome(),
                  state: state,
                );
              },
            ),
            GoRoute(
                path: adminAnnouncementPath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const AdminAnnouncementPage(),
                    state: state,
                  );
                }),
            GoRoute(
                path: adminViewAttendance,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const AdminAttendancePage(),
                    state: state,
                  );
                }),
            GoRoute(
                path: adminViewSignUp,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: ViewSignUp(event: state.extra as Event),
                    state: state,
                  );
                }),
          ]),
          StatefulShellBranch(navigatorKey: userHomeNavigatorKey, routes: [
            GoRoute(
                path: userHomePath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const UserHome(),
                    state: state,
                  );
                }),
            GoRoute(
                path: userAnnouncementPath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const AnnouncementPage(),
                    state: state,
                  );
                }),
          ]),
          StatefulShellBranch(navigatorKey: adminEventNavigatorKey, routes: [
            GoRoute(
                path: adminEventPath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const AdminEvent(),
                    state: state,
                  );
                }),
          ]),
          StatefulShellBranch(navigatorKey: userEventNavigatorKey, routes: [
            GoRoute(
                path: userEventPath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const UserEvent(),
                    state: state,
                  );
                }),
          ]),
          StatefulShellBranch(navigatorKey: profileNavigatorKey, routes: [
            GoRoute(
                path: profilePath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const Profile(),
                    state: state,
                  );
                }),
          ]),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          _navigationShell = navigationShell;
          return getPage(
            child: (navigationShell.currentIndex == 0)
                ? NavigationLoginPage(child: navigationShell)
                : NavigationPage(child: navigationShell),
            state: state,
          );
        },
      )
    ];
    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: loginPath,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }

  static void loginScreen() {
    UserState.signOut();
    _navigationShell.goBranch(0, initialLocation: true);
  }

  static void goHome({bool? initial}) {
    log('homed');
    log(UserState.perm.toString());
    _navigationbarIndex = 0;
    switch (UserState.perm) {
      case 1:
        log('admined');
        _navigationShell.goBranch(1, initialLocation: initial ?? false);
        break;
      case 0:
        log('usered');
        _navigationShell.goBranch(2, initialLocation: initial ?? false);
        break;
    }
  }

  static void goEvent({bool? initial}) {
    _navigationbarIndex = 1;
    switch (UserState.perm) {
      case 1:
        _navigationShell.goBranch(3, initialLocation: initial ?? false);
        break;
      case 0:
        _navigationShell.goBranch(4, initialLocation: initial ?? false);
        break;
    }
  }

  static void goProfile({bool? initial}) {
    _navigationbarIndex = 2;
    _navigationShell.goBranch(5, initialLocation: initial ?? false);
  }
}
