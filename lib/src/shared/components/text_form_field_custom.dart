import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatefulWidget {
  const TextFormFieldCustom({
    super.key,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.margin = const EdgeInsets.only(bottom: 20),

    //Obrigatórios
    required this.label,
    required this.validator,
  });

  final TextEditingController? controller;
  final bool isPassword;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? margin;

  //Obrigatórios
  final String label;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.isPassword && !isVisible,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: (widget.isPassword)
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(!isVisible
                      ? Icons.remove_red_eye_rounded
                      : Icons.remove_red_eye_outlined),
                )
              : null,
        ),
      ),
    );
  }
}
