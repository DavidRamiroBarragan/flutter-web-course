import 'package:admin_dashboard/providers/auth.dart';
import 'package:admin_dashboard/providers/menu.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/dashboard.dart';
import 'package:admin_dashboard/ui/views/icons.dart';
import 'package:admin_dashboard/ui/views/login.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.status == AuthStatus.notAuthenticated) {
      return const LoginView();
    }
    Provider.of<MenuProvider>(context)
        .serCurrentPageUrl(Flurorouter.dashBoardRouter);
    return const DashboardView();
  });
  static Handler icons = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.status == AuthStatus.notAuthenticated) {
      return const LoginView();
    }
    Provider.of<MenuProvider>(context)
        .serCurrentPageUrl(Flurorouter.iconsRouter);
    return const IconsView();
  });
}
