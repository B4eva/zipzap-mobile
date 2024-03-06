import 'package:flutter/material.dart';
import 'package:zipzap/src/app_colors.dart';

class ZizapTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final Function(String) onChanged;
  final String? Function(String?)? validator;

  final void Function()? trailingTapped;
  final Widget? trailing;

  final TextEditingController? controller;

  final double radius;

  const ZizapTextField({
    Key? key,
    required this.hintText,
    this.radius = 10.0,
    this.obscureText = false,
    required this.onChanged,
    this.trailingTapped,
    this.trailing,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<ZizapTextField> createState() => _ZizapTextFieldState();
}

class _ZizapTextFieldState extends State<ZizapTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.all(16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        suffixIcon: widget.trailing != null
            ? InkWell(
                onTap: widget.trailingTapped,
                child: widget.trailing,
              )
            : null,
      ),
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
    );
  }
}

// kvnladnv'kldv

// ajbd;jbsadv
