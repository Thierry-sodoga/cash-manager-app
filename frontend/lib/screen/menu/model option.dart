import 'package:flutter/material.dart';

class OptionMenu extends StatelessWidget {
  void Function()? action;
  Widget? icon;
  String? contenent;
  OptionMenu({super.key, required this.action, required this.icon, required this.contenent});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: action,
      child: Row(
        children: [
          icon!,
          const SizedBox(
            width: 20,
          ),
          Text(
            contenent!,
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          )
        ],
      ),
    );
  }
}
