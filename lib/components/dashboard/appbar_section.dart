import 'package:flutter/material.dart';
import 'package:flutter_project_4/constant.dart';

class AppbarSection extends StatelessWidget {
  const AppbarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFededee), width: 2.0),
        ),
      ),
      width: mediaQuery.size.width * Constant.kAppbarWidth,
      height: MediaQuery.of(context).size.height * Constant.kAppbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(color: Color(0xFFf5f5f5)),
            width: mediaQuery.size.width * 0.1,
            child: Row(children: const [
              Text('Notes', style: TextStyle(color: Color(0xFFb6b6b6), fontSize: 20)),
              Spacer(),
              Text(
                '📝',
                style: TextStyle(fontSize: 20),
              ),
            ]),
          ),
          Row(
            children: [
              const Text('User Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8.0),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFd9d9d9),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                width: 40.0,
                height: 40.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
