import 'package:bases_web/locator.dart';
import 'package:bases_web/router/route_generator.dart';
import 'package:bases_web/services/navigation_service.dart';
import 'package:bases_web/ui/layout/main_layout.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rutas App',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      builder: (context, child) => MaiinLayout(child: child ?? Container),
      navigatorKey: locator<NavigationService>().navigationKey,
    );
  }
}
