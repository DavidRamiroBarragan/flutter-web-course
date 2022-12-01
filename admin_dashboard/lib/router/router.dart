import 'package:admin_dashboard/router/handlers/admin.dart';
import 'package:admin_dashboard/router/handlers/dashboard.dart';
import 'package:admin_dashboard/router/handlers/not_found.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRouter = '/';
  static String loginRouter = '/auth/login';
  static String registerRouter = '/auth/register';
  static String dashBoardRouter = '/dashboard';

  static void configureRouter() {
    router.define(rootRouter, handler: AdminHandlers.login);
    router.define(loginRouter,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRouter,
        handler: AdminHandlers.register, transitionType: TransitionType.none);
    router.define(dashBoardRouter, handler: DashboardHandlers.dashboard);

    router.notFoundHandler = NotPageFoundHandlers.notPageFound;
  }
}
