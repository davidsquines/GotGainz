import 'package:flutter/material.dart';

class FullImage extends StatelessWidget {
  FullImage(this._location);

  final String _location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.network(
            _location,
            height: 700.0,
            width: 700.0,
          ),
        ),
      ),
    );
  }
}
