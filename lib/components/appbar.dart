import 'package:flutter/material.dart';
import 'package:ParchApp/constants/constants.dart';

AppBar HomeAppBar = AppBar(
  backgroundColor: kAccentColor,
  automaticallyImplyLeading: false,
  title: Center(
      child: Text(
    "ParchApp",
    style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2),
  )),
);
