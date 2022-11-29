import 'package:admin_dashboard/ui/views/login.dart';
import 'package:fluro/fluro.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params){
    return const LoginView();
  });
}