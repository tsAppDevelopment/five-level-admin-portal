import 'package:flutter/material.dart';
import '../admin_statless/black_button.dart';
import '../admin_statless/edit_text.dart';
import '../util.dart';
import 'api_serialazable.dart';

class User implements APISerialiable {
  int aircraftid;
  int userid;
  String name;
  void setName(String s) => name = s;
  int role;
  void setRole(int s) => role = s;
  String ep = 'user';
  void Function(Map<String, dynamic> obj) onSave;

  User.fromJson(Map<String, dynamic> json, this.onSave)
      : aircraftid = json["aircraftid"],
        userid = json["userid"] ?? 0,
        name = json["name"] ?? '',
        role = json["role"] ?? 1;

  Map<String, dynamic> toJson() => {
        "aircraftid": aircraftid,
        "userid": userid,
        "name": name,
        "role": role,
      };

  Widget getForm() {
    final key = GlobalKey<FormState>();
    return Form(
        key: key,
        child: SingleChildScrollView(
            child: Column(children: [
          EditText(
              initialValue: name,
              hintText: 'Email',
              validate: (s) => validateStringNotEmpty(s, setName)),
          EditText(
              initialValue: role.toString(),
              hintText: '0: No Role, 1: User, 2: Admin, 3: DB Admin, 4: Owner',
              validate: (s) => validateIntPositive(s, setRole)),
          BlackButton(() {
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
