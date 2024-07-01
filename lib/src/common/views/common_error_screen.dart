import 'package:flutter/material.dart';

Widget commonErrorScreen(
  final Object error,
  final StackTrace stackTrace,
) =>
    Column(
      children: [
        const Text(
          "something went wrong, please restart app",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          error.toString(),
          style: const TextStyle(fontSize: 22),
        )
      ],
    );
