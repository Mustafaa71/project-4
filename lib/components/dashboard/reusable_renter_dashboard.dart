import 'package:flutter/material.dart';
import 'package:flutter_project_4/models/widget_model.dart';

class ReusableRenterDashboard extends StatelessWidget {
  final String title;
  final bool showButton;
  final Widget child;

  const ReusableRenterDashboard({
    super.key,
    required this.title,
    required this.showButton,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0.0, 0.0), blurRadius: 10.0, spreadRadius: 5.0),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.75,
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                WidgetModel.funcShowButton(showButton),
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}
