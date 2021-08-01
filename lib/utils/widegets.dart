import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    border: InputBorder.none,
    //focusedBorder: InputBorder.none,
    //enabledBorder: InputBorder.none,
    // errorBorder: InputBorder.none,
    //disabledBorder: InputBorder.none,
    prefixIcon: Container(
      margin: const EdgeInsets.only(right: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.black26),
        ),
      ),
      child: Icon(
        icon,
        color: Color.fromRGBO(50, 62, 72, 1.0),
      ),
    ),
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}
