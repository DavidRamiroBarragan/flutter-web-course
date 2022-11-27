import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/router/handler.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static void configureRoutes(){
    router.define("/:page", handler: homeHandler);

    router.notFoundHandler = homeHandler;
  }
}