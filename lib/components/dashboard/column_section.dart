import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project_4/pages/auth/sign_in_page.dart';

class ColumnSection extends StatefulWidget {
  const ColumnSection({
    super.key,
    required this.onFilterChanged,
  });
  final Function(int) onFilterChanged;

  @override
  State<ColumnSection> createState() => _ColumnSectionState();
}

class _ColumnSectionState extends State<ColumnSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: Color(0xFFededee), width: 2)),
      ),
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 1,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage())),
              child: Image.network('https://img.icons8.com/fluency/512/dashboard-layout.png', width: 100, height: 100),
            ),
            const SizedBox(height: 48),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'General',
                style: TextStyle(color: Color(0xFFb6b6b6), fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  widget.onFilterChanged(0);
                },
                child: Row(
                  children: [
                    Image.network('https://img.icons8.com/dusk/512/bot.png', height: 30.0, width: 30.0),
                    const SizedBox(width: 12),
                    const Text(
                      'Dashboard',
                      style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ]),
            const SizedBox(height: 32),
            Column(
              children: () {
                List<DropdownButton<String>> dropdownButtons = [];
                for (var e in test10) {
                  List<DropdownMenuItem<String>> dropdownMenuItems = [];
                  for (var option in DropdownMenuItemList) {
                    dropdownMenuItems.add(
                      DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ),
                    );
                  }
                  dropdownButtons.add(
                    DropdownButton(
                      items: dropdownMenuItems,
                      hint: const Text('Building '),
                      onChanged: (selectedOption) {
                        setState(() {
                          if (selectedOption == 'Dashboard') {
                            widget.onFilterChanged(0);
                          } else if (selectedOption == 'Free Appartment') {
                            widget.onFilterChanged(1);
                          } else if (selectedOption == 'Add Renter') {
                            widget.onFilterChanged(2);
                          }
                        });
                      },
                    ),
                  );
                }
                return dropdownButtons;
              }(),
            ),
          ],
        ),
      ),
    );
  }
}

List test10 = [0];

List DropdownMenuItemList = ['Dashboard', 'Free Appartment', 'Add Renter'];

StreamController mystreem = StreamController();
