import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    required Key key,
    required this.child,
    required this.value,
    required this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child, //Pervious defined in widget

        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 16,
            minWidth: 16,
          ),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          ),
        )
      ],
    );
  }
}
