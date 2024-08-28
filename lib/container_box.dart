import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  const ContainerBox({super.key, required this.boxColor, required this.childWidget});
  final Color boxColor;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: boxColor,
      ),
      child: childWidget,
    );
  }
}