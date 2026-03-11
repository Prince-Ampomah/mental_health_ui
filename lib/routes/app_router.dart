import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health_ui/components/app_shell.dart';
import 'package:mental_health_ui/features/assistant/pages/assistant_page.dart';
import 'package:mental_health_ui/features/dashboard/pages/dashboard_page.dart';
import 'package:mental_health_ui/features/performance/pages/performance_page.dart';
import 'package:mental_health_ui/routes/route_names.dart';
import 'package:mental_health_ui/routes/route_paths.dart';

final _parentNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    navigatorKey: _parentNavigatorKey,
    initialLocation: RoutePaths.homePath,
    routes: [
      // GoRoute(
      //   path: RoutePaths.homePath,
      //   name: RouteNames.home,
      //   builder: (context, state) => const DashboardPage(),
      // ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShellLayout(
            key: state.pageKey,
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.home,
                path: RoutePaths.homePath,
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.assistant,
                path: RoutePaths.assistantPath,
                builder: (context, state) => const AssistantPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.performance,
                path: RoutePaths.performancePath,
                builder: (context, state) => const PerformancePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
