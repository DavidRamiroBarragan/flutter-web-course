

import 'package:admin_dashboard/router/handlers/admin.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRouter = '/';
  static String loginRouter = '/auth/login';
  static String registerRouter = '/auth/register';
  static String dashBoardRouter = '/dashboard';

  static void configureRouter(){
    router.define(rootRouter, handler: AdminHandlers.login);
    router.define(loginRouter, handler: AdminHandlers.login);
    // router.define(registerRouter, handler: handler);
    // router.define(dashBoardRouter, handler: handler);
  }
}