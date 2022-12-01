import 'package:admin_dashboard/providers/auth.dart';
import 'package:admin_dashboard/ui/views/dashboard.dart';
import 'package:admin_dashboard/ui/views/login.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.status == AuthStatus.notAuthenticated) {
      return const LoginView();
    }

    return const DashboardView();
  });
}
