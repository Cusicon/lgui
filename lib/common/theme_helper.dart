import 'package:flutter/material.dart';

class ThemeHelper {
  InputDecoration textInputDecoration({
    String hintText = '',
  }) {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.all(20.0),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple.shade200, width: 1.5),
          borderRadius: BorderRadius.circular(12)),
      border: InputBorder.none,
      hintText: hintText,
      fillColor: Colors.grey.shade200,
      filled: true,
    );
  }

  InputDecoration passwordInputDecoration({
    String hintText = '',
    dynamic suffixMethod,
  }) {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.all(20.0),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple.shade200, width: 1.5),
          borderRadius: BorderRadius.circular(12)),
      border: InputBorder.none,
      hintText: hintText,
      fillColor: Colors.grey.shade200,
      filled: true,
      suffixIcon: suffixMethod,
    );
  }

  Container authSubmitButton(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12.0)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
