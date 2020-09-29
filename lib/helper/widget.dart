import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Mask",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          "News",
          style:
              TextStyle(color: Color(0xffBB866FC), fontWeight: FontWeight.w600),
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
