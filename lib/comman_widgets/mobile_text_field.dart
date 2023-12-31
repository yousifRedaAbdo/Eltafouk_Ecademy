import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';

class MobileInputField extends StatefulWidget {
  IconData icon;
  TextInputType inputType;
  bool isPassword;
  TextEditingController controller;
  String hint;
  bool enable;

  final validator;

  MobileInputField({
    required this.hint,
    required this.inputType,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    this.enable = true,
    required this.validator,
  });

  @override
  State<MobileInputField> createState() => _MobileInputFieldState();
}

class _MobileInputFieldState extends State<MobileInputField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        enabled: widget.enable,
        cursorColor: mainColor,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          FilteringTextInputFormatter.digitsOnly
        ],
        validator: widget.validator,
        controller: widget.controller,
        style: const TextStyle(color: Colors.black, fontSize: 17),
        obscureText: isHidden && widget.isPassword,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          fillColor: Colors.white,filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
          isDense: true,
          hintText: widget.hint,
          labelStyle: const TextStyle(color: blueColor),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: blueColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: blueColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(50)),
            gapPadding: 0,
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: grey, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(50)),
            gapPadding: 0,
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(50)),
            gapPadding: 0,
          ),
          prefixIcon: Icon(
            widget.icon,
            color: blackColor,
            size: 22,
          ),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  child: isHidden == true
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Icon(
                            Icons.visibility_off,
                            color: blackColor,
                            size: 22,
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Icon(
                            Icons.visibility,
                            color: blackColor,
                            size: 22,
                          ),
                        ),
                )
              : const SizedBox(),
          suffixIconConstraints: const BoxConstraints(maxHeight: 20),
        ),
      ),
    );
  }
}
