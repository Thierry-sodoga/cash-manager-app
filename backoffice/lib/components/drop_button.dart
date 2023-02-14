// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class DropDownComponent extends StatefulWidget {
  final List<dynamic> listsContent;
  final Function(String? value)? onChanged;
  final String? value;
  const DropDownComponent(
      {super.key,
      required this.listsContent,
      required this.onChanged,
      this.value});

  @override
  _DropDownComponentState createState() => _DropDownComponentState();
}

class _DropDownComponentState extends State<DropDownComponent> {
  String dropdownvalue = "";

  @override
  void initState() {
    super.initState();
    dropdownvalue = widget.value ?? widget.listsContent[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        value: widget.value,
        style: const TextStyle(
          fontSize: 15,
          color: Color(0xffA3A3A3),
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color: const Color(0xffA3A3A3),
          size: MediaQuery.of(context).size.width * 0.08,
        ),
        items: widget.listsContent
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
