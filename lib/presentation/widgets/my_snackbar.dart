import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class MySnackbar extends StatelessWidget {
  const MySnackbar({
    Key? key,
    required this.controller,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);
  final FlashController controller;
  final String title, description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Flash.bar(
      controller: controller,
      backgroundGradient: LinearGradient(
        colors: [Color(0xff816A1A), Color(0xff2B1A1A)],
      ),
      position: FlashPosition.bottom,
      horizontalDismissDirection: HorizontalDismissDirection.startToEnd,
      margin: const EdgeInsets.all(8),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.slowMiddle,
      child: FlashBar(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
        content: Text(
          description,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white, fontSize: 12),
        ),
        icon: Icon(
          Icons.dangerous,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        primaryAction: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Ok",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
