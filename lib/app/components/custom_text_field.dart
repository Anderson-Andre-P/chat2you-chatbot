import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    required this.controller,
    this.validator,
    this.prefixIcon,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return TextFormField(
      key: widget.key, // Adicionando uma chave única
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
            : null,
        isDense: true,
        labelText: widget.label ?? "labelText",
        counterText: "",
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(4.r)),
        // ),
      ),
    );
  }
}
