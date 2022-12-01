import 'package:admin_dashboard/providers/auth.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard.dart';
import 'package:admin_dashboard/ui/layouts/splash/layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePreferences();
  Flurorouter.configureRouter();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: Flurorouter.loginRouter,
      navigatorKey: NavigationService.navigatorStateKey,
      onGenerateRoute: Flurorouter.router.generator,
      builder: (context, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.status == AuthStatus.checking) {
          return const SplashLayout();
        }
        if (authProvider.status == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        }
        return AuthLayout(child: child!);
      },
      theme: ThemeData.light().copyWith(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
              thumbColor:
                  MaterialStateProperty.all(Colors.grey.withOpacity(0.5)))),
    );
  }
}
