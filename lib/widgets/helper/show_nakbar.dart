  import 'package:flutter/material.dart';

void snakbarmessage(BuildContext context, String massge) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massge),
      ),
    );
  }