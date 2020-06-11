import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void openPage(StatefulWidget page) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
