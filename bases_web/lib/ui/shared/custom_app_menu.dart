import 'package:bases_web/locator.dart';
import 'package:bases_web/services/navigation_service.dart';
import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CustomMenuApp extends StatelessWidget {
  const CustomMenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: ((_, boxConstraints) => (boxConstraints.maxWidth > 520)
            ? const _TabletDesktopMenu()
            : const _MobileDesktopMenu()));
  }
}

class _TabletDesktopMenu extends StatelessWidget {
  const _TabletDesktopMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          CustomFlatButton(
              onPress: () => locator<NavigationService>().navigateTo('/'),
              label: 'Contador StateFul',
              color: Colors.black),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
              onPress: () =>
                  locator<NavigationService>().navigateTo('/provider'),
              label: 'Contador con Provider',
              color: Colors.black),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
              onPress: () => locator<NavigationService>().navigateTo('/ddddd'),
              label: 'Otra Página',
              color: Colors.black),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
              onPress: () => locator<NavigationService>().navigateTo('/stateful/100'),
              label: 'Contador Stateful 100',
              color: Colors.black)
        ],
      ),
    );
  }
}

class _MobileDesktopMenu extends StatelessWidget {
  const _MobileDesktopMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Column(
        children: [
          CustomFlatButton(
              onPress: () => locator<NavigationService>().navigateTo('/'),
              label: 'Contador StateFul',
              color: Colors.black),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
              onPress: () =>
                  locator<NavigationService>().navigateTo('/provider'),
              label: 'Contador con Provider',
              color: Colors.black),
          CustomFlatButton(
              onPress: () => locator<NavigationService>().navigateTo('/ddddd'),
              label: 'Otra Página',
              color: Colors.black)
        ],
      ),
    );
  }
}
