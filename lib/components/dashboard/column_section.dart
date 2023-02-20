import 'package:flutter/material.dart';

class ColumnSection extends StatefulWidget {
  const ColumnSection({
    super.key,
    required this.onFilterChanged,
  });
  final Function(int) onFilterChanged;
  static List newBuilding = [];
  @override
  State<ColumnSection> createState() => _ColumnSectionState();
}

class _ColumnSectionState extends State<ColumnSection> {
  int filter = 0;

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
            Image.asset(
              'assets/logo-no-background.png',
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 48),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'General',
                style: TextStyle(color: Color(0xFFb6b6b6), fontSize: 20, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  widget.onFilterChanged(0);
                },
                child: const Text(
                  '   🤖 Dashboard',
                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ]),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Buildings',
                  style: TextStyle(
                    color: Color(0xFFb6b6b6),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                DropdownButton(
                  items: const [
                    DropdownMenuItem(value: 0, child: Text('Dashboard')),
                    DropdownMenuItem(value: 1, child: Text('Available Appartment')),
                    DropdownMenuItem(value: 2, child: Text('Add New Renter')),
                  ],
                  hint: const Text('Building - 1'),
                  onChanged: (value) {
                    setState(
                      () {
                        if (value == 0) {
                          widget.onFilterChanged(0);
                        } else if (value == 1) {
                          widget.onFilterChanged(1);
                        } else if (value == 2) {
                          widget.onFilterChanged(2);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
