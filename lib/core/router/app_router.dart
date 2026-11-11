import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_dashboard_app/features/analytics/presentation/screens/analytics_screen.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/presentation/screens/dashboard_screen.dart';

class AppRouter {
  static const dashboard = '/';
  static const analytics = '/analytics';

  static final router = GoRouter(
    initialLocation: analytics, //dashboard,
    routes: [
      GoRoute(
        path: dashboard,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: analytics,
        builder: (context, state) => const AnalyticsScreen(),
      ),
    ],
  );
}
