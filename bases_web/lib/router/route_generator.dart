import 'package:bases_web/ui/pages/counter_provider_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:bases_web/ui/pages/counter_page.dart';
import 'package:bases_web/ui/pages/page_404.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return _fadeRoute(
          const CounterPage(),
          '/',
        );
      case '/provider':
        return _fadeRoute(const CounterProviderPage(), '/provider');
      default:
        return _fadeRoute(const Page404(), '/404');
    }
  }

  static PageRoute _fadeRoute(Widget child, String routeName) {
    return PageRouteBuilder(
        pageBuilder: (
          _,
          __,
          ___,
        ) =>
            child,
        settings: RouteSettings(name: routeName),
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (_, animation, __, ___) => (kIsWeb)
            ? FadeTransition(
                opacity: animation,
                child: child,
              )
            : CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: __,
                linearTransition: true,
                child: child));
  }
}
