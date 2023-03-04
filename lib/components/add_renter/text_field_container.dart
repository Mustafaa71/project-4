import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const TextFieldContainer({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFFeaeaea),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
