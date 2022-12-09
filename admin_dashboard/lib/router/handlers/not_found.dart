import 'package:admin_dashboard/providers/menu.dart';
import 'package:admin_dashboard/ui/views/not_found.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class NotPageFoundHandlers {
  static Handler notPageFound = Handler(handlerFunc: (context, params){
    Provider.of<MenuProvider>(context!, listen: false).setCurrentPageUrl('/404');
    return const NotFoundPage();
  });
}