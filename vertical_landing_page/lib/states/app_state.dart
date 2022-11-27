import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/my_app.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PageProvider(),
        )
      ],
      child: MyApp(),
    );
  }
}
