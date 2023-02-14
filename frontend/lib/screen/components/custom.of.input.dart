import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final Function(String value) onChange;
  final String? Function(String?) validator;
  final TextInputType? keyBoardType;
  final String? initialValue;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextFormField({
    Key? key,
    required this.onChange,
    required this.validator,
    this.keyBoardType,
    this.initialValue,
    this.controller,
    required this.obscureText,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //maxLines: widget.line,
      controller: widget.controller,
      obscureText: widget.obscureText,
      cursorColor: const Color(0xffA3A3A3),
      decoration: InputDecoration(
        hintText: widget.initialValue,
        hintStyle: const TextStyle(
          fontFamily: "SFREGULAR",
          fontWeight: FontWeight.w400,
          fontSize: 13.0,
          color: Color(0xffA3A3A3),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffA3A3A3))
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffA3A3A3))
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red)
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red)
        ),
      ),
      style: const TextStyle(
          color: Color(0xffA3A3A3), fontWeight: FontWeight.bold),
      onChanged: widget.onChange,
      //obscureText: ,
      validator: widget.validator,
      keyboardType: widget.keyBoardType ?? TextInputType.name,
    );
  }
}
/*
class GetInuptValue extends StatefulWidget {
  final int? sized;
  final String? head;
  final Function(String value) onChange;
  final String? Function(String?) validator;
  final TextInputType? keyBoardType;
  final String? initialValue;
  final TextEditingController? controller;
  final bool? obscureText;
  const GetInuptValue({
    Key? key,
    this.head,
    required this.onChange,
    required this.validator,
    this.keyBoardType,
    this.initialValue,
    this.controller,
    this.sized,
    this.obscureText,
  }) : super(key: key);

  @override
  State<GetInuptValue> createState() => _GetInuptValueState();
}

class _GetInuptValueState extends State<GetInuptValue> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15.0),
          Text(
            widget.head!,
            style: const TextStyle(
                color: Color(0xff77badb), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            //height: 80,
            child: CustomTextFormField(
              obscureText: widget.obscureText ?? false,
              line: widget.sized ?? 1,
              onChange: widget.onChange,
              validator: widget.validator,
              keyBoardType: widget.keyBoardType,
              initialValue: widget.initialValue,
              controller: widget.controller,
            ),
          ),
          //const SizedBox(height: 11.0),
        ],
      ),
    );
  }
}
*/