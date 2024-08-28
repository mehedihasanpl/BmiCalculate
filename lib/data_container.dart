import 'package:flutter/material.dart';

const textStyle1 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 20.0,
);

const textStyle2 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const textStyle3 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 27.0,
);

class DataContainer extends StatelessWidget {
  const DataContainer({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 35.0,
          color: Colors.white,
        ),
        const SizedBox(height: 5.0),
        Text(title, style: textStyle1),
      ],
    );
  }
}