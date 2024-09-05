import 'package:flutter/material.dart';
import 'package:weather_app/src/feature/weather/presentation/styles.dart';

class DetailBlock extends StatelessWidget {
  const DetailBlock({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
    this.unit,
  }) : super(key: key);

  final Icon? icon;
  final String? title;
  final String? value;
  final Color? color;
  final String? unit;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? Container(),
          Text(
            title ?? "",
            style: weatherDetailsTextStyle.copyWith(fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textBaseline: TextBaseline.ideographic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                value ?? "",
                style: weatherDetailsTextStyle.copyWith(
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5),
              Text(
                unit ?? "",
                style: weatherDetailsTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      color: color,
    );
  }
}
