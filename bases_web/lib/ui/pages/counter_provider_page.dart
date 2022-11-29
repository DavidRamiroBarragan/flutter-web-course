import 'package:bases_web/providers/counter_provider.dart';
import 'package:bases_web/ui/shared/custom_app_menu.dart';
import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProviderPage extends StatelessWidget {
  String base = '5';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        child: const _CounterProviderPageBody(),
        create: (_) => CounterProvider(base));
  }
}

class _CounterProviderPageBody extends StatelessWidget {
  const _CounterProviderPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomMenuApp(),
        const Text('Contador provider'),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Counter: ${counterProvider.counter}',
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlatButton(
              onPress: () => counterProvider.increment(),
              label: "Incrementar",
            ),
            CustomFlatButton(
              onPress: () => counterProvider.decrement(),
              label: "Decrementar",
            ),
          ],
        )
      ],
    ));
  }
}
