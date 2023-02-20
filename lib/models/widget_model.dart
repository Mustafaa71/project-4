import 'package:flutter/material.dart';
import 'package:flutter_project_4/models/renter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// This Function Controls the Visibility of the Elevated Button In Dahboard Container...

class WidgetModel {
  static funcShowButton(toShow) {
    return toShow == true
        ? ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFf5f5f5))),
            child: Row(
              children: const [
                Text('Upcoming Dues', style: TextStyle(color: Colors.black)),
                Icon(Icons.arrow_drop_down_sharp, color: Colors.black),
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  /// Show Renter info dialog ...
  static Future<void> showRenterDialog(BuildContext context, Renter renter) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Renter Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${renter.fName} ${renter.lName}'),
              const SizedBox(
                height: 8.0,
              ),
              Text('Phone Number: ${renter.phoneNumber}'),
              const SizedBox(
                height: 8.0,
              ),
              Text('Starting Date: ${renter.startingDate}'),
              const SizedBox(
                height: 8.0,
              ),
              Text('Monthly Rent: ${renter.monthlyRent}'),
              const SizedBox(height: 8.0),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Supabase.instance.client.from('usr').delete().eq('usrId', renter.usrId).execute();
                  Navigator.pop(context);
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  /// Model to add new building in column section ...
}
