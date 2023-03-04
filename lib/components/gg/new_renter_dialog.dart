import 'package:flutter/material.dart';

class NewRenterDialog extends StatefulWidget {
  const NewRenterDialog({Key? key}) : super(key: key);

  @override
  _GgState createState() => _GgState();
}

class _GgState extends State<NewRenterDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _monthlyRentController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _nationalIdController.dispose();
    _phoneController.dispose();
    _monthlyRentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Rental Information'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _nationalIdController,
              decoration: const InputDecoration(labelText: 'National ID'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: _monthlyRentController,
              decoration: const InputDecoration(labelText: 'Monthly Rent'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Do something with the rental information
            final String name = _nameController.text;
            final String nationalId = _nationalIdController.text;
            final String phone = _phoneController.text;
            final double monthlyRent = double.tryParse(_monthlyRentController.text) ?? 0.0;

            // You can perform some validation here and return an error if needed
            if (name.isEmpty || nationalId.isEmpty || phone.isEmpty || monthlyRent <= 0) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill in all fields')));
              return;
            }

            // You can also pass the rental information back to the parent widget using Navigator.pop
            Navigator.pop(
                context, {'name': name, 'nationalId': nationalId, 'phone': phone, 'monthlyRent': monthlyRent});
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
