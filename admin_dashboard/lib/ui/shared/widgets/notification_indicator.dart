import 'package:flutter/material.dart';

class NotificationIndicator extends StatelessWidget {
  const NotificationIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          const Icon(
            Icons.notification_add_outlined,
            color: Colors.grey,
          ),
          Positioned(
            left: 2,
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(100)),
            ),
          )
        ],
      ),
    );
  }
}
