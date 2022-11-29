import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: (size.width > 1000) ? size.height * 0.075 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(text: 'About', onPress: () => print('About'),),
          LinkText(text: 'Help Center', onPress: () => print('Help Center'),),
          LinkText(text: 'Terms of Service', onPress: () => print('of Service'),),
          LinkText(text: 'Privacy policy', onPress: () => print('Privacy policy'),),
          LinkText(text: 'Cookie Policy', onPress: () => print('Cookie Policy'),),
          LinkText(text: 'Ads info', onPress: () => print('Ads info'),),
          LinkText(text: 'Blog', onPress: () => print('Blog'),),
          LinkText(text: 'Status', onPress: () => print('Status'),),
          LinkText(text: 'Careers', onPress: () => print('Careers'),),
          LinkText(text: 'Brand Resources', onPress: () => print('Brand Resources'),),
          LinkText(text: 'Marketing', onPress: () => print('Marketing'),),
        ],
      ),
    );
  }
}
