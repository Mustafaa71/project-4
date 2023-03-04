import 'package:flutter/material.dart';
import 'package:flutter_project_4/components/dashboard/column_section.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddBuildingDialog extends StatefulWidget {
  const AddBuildingDialog({
    super.key,
  });

  @override
  State<AddBuildingDialog> createState() => _AddBuildingDialogState();
}

class _AddBuildingDialogState extends State<AddBuildingDialog> {
  final buildingName = TextEditingController();
  final supabase = Supabase.instance.client;

  @override
  void dispose() {
    buildingName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xfff0f0f1),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        width: 400,
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add the new property',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Building Number',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: buildingName,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  mystreem.sink.add(10);
                  Navigator.of(context).pop();
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFF010c80),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(26.0),
                ),
              ),
              child: const Text(
                'Add Building',
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
