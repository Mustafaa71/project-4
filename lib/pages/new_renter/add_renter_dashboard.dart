import 'package:flutter/material.dart';
import 'package:flutter_project_4/components/add_renter/textFieldContainer.dart';
import 'package:flutter_project_4/components/dashboard/reusable_renter_dashboard.dart';
import 'package:flutter_project_4/models/renter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddRenterDashboard extends StatefulWidget {
  const AddRenterDashboard({
    super.key,
  });

  @override
  State<AddRenterDashboard> createState() => _AddRenterDashboardState();
}

class _AddRenterDashboardState extends State<AddRenterDashboard> {
  final usrIdController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final nationalIdController = TextEditingController();
  final phoneController = TextEditingController();
  final buildingController = TextEditingController();
  final apartmentController = TextEditingController();
  final rentController = TextEditingController();

  final supabase = Supabase.instance.client;

  @override
  void dispose() {
    usrIdController.dispose();
    fNameController.dispose();
    lNameController.dispose();
    nationalIdController.dispose();
    phoneController.dispose();
    buildingController.dispose();
    apartmentController.dispose();
    rentController.dispose();
    super.dispose();
  }

  funcClearTextField() {
    usrIdController.clear();
    fNameController.clear();
    lNameController.clear();
    nationalIdController.clear();
    phoneController.clear();
    phoneController.clear();
    buildingController.clear();
    apartmentController.clear();
    rentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ReusableRenterDashboard(
      title: 'Add Renter',
      showButton: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40.0),
          TextFieldContainer(
            label: 'Renter ID',
            controller: usrIdController,
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: TextFieldContainer(
                  label: 'First Name',
                  controller: fNameController,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFieldContainer(
                  label: 'Last Name',
                  controller: lNameController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: TextFieldContainer(
                  label: 'Phone Number',
                  controller: phoneController,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFieldContainer(
                  label: 'National ID',
                  controller: nationalIdController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: TextFieldContainer(
                  label: 'Building Number',
                  controller: buildingController,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFieldContainer(
                  label: 'Apartment Number',
                  controller: apartmentController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldContainer(
                label: 'Monthly Rent',
                controller: rentController,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final renter = Renter(
                      usrId: usrIdController.text,
                      fName: fNameController.text,
                      lName: lNameController.text,
                      nationalId: nationalIdController.text,
                      phoneNumber: phoneController.text,
                      buildingNumber: buildingController.text,
                      apartmentNumber: apartmentController.text,
                      monthlyRent: rentController.text,
                      startingDate: '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                    );

                    final response = await supabase.from('usr').insert([renter.toJson()]);
                    funcClearTextField();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    margin: const EdgeInsets.only(top: 25.0),
                    child: const Text(
                      'Add Renter',
                      style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
