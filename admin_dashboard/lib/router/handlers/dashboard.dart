import 'package:admin_dashboard/providers/auth.dart';
import 'package:admin_dashboard/providers/menu.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/categories.dart';
import 'package:admin_dashboard/ui/views/dashboard.dart';
import 'package:admin_dashboard/ui/views/icons.dart';
import 'package:admin_dashboard/ui/views/login.dart';
import 'package:admin_dashboard/ui/views/user_view.dart';
import 'package:admin_dashboard/ui/views/users_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.status == AuthStatus.notAuthenticated) {
      return const LoginView();
    }
    Provider.of<MenuProvider>(context)
        .setCurrentPageUrl(Flurorouter.dashBoardRouter);
    return const DashboardView();
  });

  static Handler icons = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.status == AuthStatus.notAuthenticated) {
      return const LoginView();
    }
    Provider.of<MenuProvider>(context)
        .setCurrentPageUrl(Flurorouter.iconsRouter);
    return const IconsView();
  });

  static Handler blank = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.status == AuthStatus.notAuthenticated) {
      return const LoginView();
    }
    Provider.of<MenuProvider>(context)
        .setCurrentPageUrl(Flurorouter.blankRouter);
    return const BlankView();
  });
  static Handler categories = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.status == AuthStatus.notAuthenticated) {
      return const LoginView();
    }
    Provider.of<MenuProvider>(context)
        .setCurrentPageUrl(Flurorouter.categoriesRouter);
    return const CategoriesView();
  });

  static Handler users = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.status == AuthStatus.notAuthenticated) {
      return const LoginView();
    }
    Provider.of<MenuProvider>(context)
        .setCurrentPageUrl(Flurorouter.blankRouter);
    return UsersView();
  });

  static Handler user = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    final uid = params['uid']?.first;
    if (authProvider.status == AuthStatus.notAuthenticated) {
      return const LoginView();
    }

    if (uid == null) {
      return UsersView();
    }
    Provider.of<MenuProvider>(context)
        .setCurrentPageUrl(Flurorouter.userRouter);
    return UserView(uid: uid);
  });
}
