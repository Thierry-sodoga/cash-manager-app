// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class ComponentOfHome extends StatefulWidget {
  final String imagePath;
  String? contenent;
  void Function()? action;
  ComponentOfHome(
      {super.key, required this.imagePath, required this.contenent, required this.action});

  @override
  State<ComponentOfHome> createState() =>
      // ignore: no_logic_in_create_state
      _ComponentOfHomeState(imagePath, contenent, action);
}

class _ComponentOfHomeState extends State<ComponentOfHome> {
  final String imagePath;
  String? contenent;
  void Function()? action;
  _ComponentOfHomeState(this.imagePath, this.contenent, this.action);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: action,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Color(0xff184098),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              imagePath,
              //height: 100,
              // cacheColorFilter: false,
              // width: 100,
              color: Colors.white,
              // semanticsLabel: "Vente Logo",
            ),
            const SizedBox(height: 15.0),
            Text(
              contenent!,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
