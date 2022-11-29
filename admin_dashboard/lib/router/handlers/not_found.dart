import 'package:admin_dashboard/ui/views/not_found.dart';
import 'package:fluro/fluro.dart';

class NotPageFoundHandlers {
  static Handler notPageFound = Handler(handlerFunc: (context, params){
    return const NotFoundPage();
  });
}