import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final double widthMultiplier;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;
  final Color cursorColor;
  final Color iconColor;
  final Color editTextBackgroundColor;
  final double height;

  const RoundedInputField(
      {Key key,
      this.height,
      this.widthMultiplier,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.textEditingController,
      this.cursorColor,
      this.iconColor,
      this.editTextBackgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * widthMultiplier,
      decoration: BoxDecoration(
        color: editTextBackgroundColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        controller: textEditingController,
        onChanged: onChanged,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: iconColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
