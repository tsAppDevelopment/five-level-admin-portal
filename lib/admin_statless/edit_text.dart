import 'package:flutter/material.dart';
import '../const.dart';


class EditText extends StatelessWidget {
  final String hintText;
  final String initialValue;
  final String Function(String) validate;

  const EditText({
    Key key,
    this.validate,
    this.hintText,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          initialValue: initialValue,
          validator: validate,
          keyboardType: TextInputType.text,
          style: dmSelectedNormal,
          decoration: InputDecoration(
            labelText: hintText,
            fillColor: Color.fromRGBO(240, 240, 240, 1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(),
            ),
          ),
      ),
    );
  }
}
