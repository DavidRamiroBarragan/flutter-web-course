import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';

final homeHandler = Handler(handlerFunc: ((context, parameters) {
  final route = parameters['page']!.first;

  if (route != '/') {


    return const HomePage();
  }
}));
