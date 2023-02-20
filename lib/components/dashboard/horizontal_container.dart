import 'package:flutter/material.dart';
import 'package:flutter_project_4/constant.dart';

class HorizontalContainer extends StatelessWidget {
  final String info;
  final String title;

  const HorizontalContainer({
    super.key,
    required this.info,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFf5f5f5)),
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.13,
      margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            info,
            style: Constant.kHorizontalBoxTextStyle1,
          ),
          const SizedBox(height: 12.0),
          Text(
            title,
            style: Constant.kHorizontalBoxTextStyle2,
          ),
        ]),
      ),
    );
  }
}
