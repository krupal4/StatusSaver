import 'package:flutter/material.dart';

class RedContainer extends StatelessWidget {
  const RedContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
      ),
      child: child,
    );
  }
}
