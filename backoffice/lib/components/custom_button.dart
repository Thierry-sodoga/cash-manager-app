import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Widget content;
  final Function()? action;
  final Color? color;
  
  const ButtonComponent(
      {Key? key, required this.content, this.action, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? const Color(0xff184098),
          fixedSize: const Size.fromHeight(43),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: content,
      ),
    );
  }
}
