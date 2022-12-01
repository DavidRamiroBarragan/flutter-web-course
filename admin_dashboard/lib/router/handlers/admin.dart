import 'package:admin_dashboard/providers/auth.dart';
import 'package:admin_dashboard/ui/views/dashboard.dart';
import 'package:admin_dashboard/ui/views/login.dart';
import 'package:admin_dashboard/ui/views/register.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.status == AuthStatus.notAuthenticated) {
      return const LoginView();
    }

    return const DashboardView();
  });
  static Handler register = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.status == AuthStatus.notAuthenticated) {
      return const RegisterView();
    }
    return const DashboardView();
  });
}
