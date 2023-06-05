import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_clone/utils/app_theme.dart';

class FormFieldUser extends StatefulWidget {
  const FormFieldUser(
      {super.key,
      required this.fieldText,
      required this.controller,
      required this.hintText,
      required this.inputType,
      required this.inputAction,
      required this.isPassword,
      this.validator});
  final String fieldText;
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<FormFieldUser> createState() => _FormFieldUserState();
}

class _FormFieldUserState extends State<FormFieldUser> {
  var _passwordToggle = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              widget.fieldText,
              style: AppTheme.tagTxt,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppTheme.chipBackground,
              ),
              child: widget.isPassword
                  ? TextFormField(
                      controller: widget.controller,
                      keyboardType: widget.inputType,
                      obscureText: _passwordToggle,
                      onTapOutside: (event) {
                        FocusNode().unfocus();
                      },
                      onFieldSubmitted: (value) {
                        AutovalidateMode.always;
                      },
                      textInputAction: widget.inputAction,
                      decoration: InputDecoration(
                        labelText: widget.hintText,
                        labelStyle: const TextStyle(fontSize: 14),
                        suffix: InkWell(
                          child: _passwordToggle
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onTap: () {
                            setState(() {
                              _passwordToggle = !_passwordToggle;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(width: 5)),
                        //floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintMaxLines: 1,
                      ),
                      validator: widget.validator,
                    )
                  : TextFormField(
                      controller: widget.controller,
                      keyboardType: widget.inputType,
                      onTapOutside: (event) {
                        FocusNode().unfocus();
                      },
                      onFieldSubmitted: (value) {
                        AutovalidateMode.always;
                      },
                      textInputAction: widget.inputAction,
                      decoration: InputDecoration(
                        labelText: widget.hintText,
                        hintStyle: const TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(width: 5)),
                        //floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintMaxLines: 1,
                      ),
                      validator: widget.validator,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
