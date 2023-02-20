import 'package:flutter/material.dart';
import 'package:flutter_project_4/components/dashboard/horizontal_container.dart';
import 'package:flutter_project_4/components/dashboard/reusable_renter_dashboard.dart';
import 'package:flutter_project_4/components/data_table/building_data_table.dart';
import 'package:flutter_project_4/models/building.dart';

class BuildingOne extends StatelessWidget {
  const BuildingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableRenterDashboard(
      title: 'Building - 1',
      showButton: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: HorizontalContainer(
                  info: '30',
                  title: 'Numbe of Appartments',
                ),
              ),
              Expanded(
                child: HorizontalContainer(
                  info: '${30 - BuildingData.building_1.length}',
                  title: 'Free Appartments',
                ),
              ),
              const Expanded(
                child: HorizontalContainer(
                  info: '01-02-2023',
                  title: 'Last Maintenance',
                ),
              ),
            ],
          ),
          const Text('Free Appartment', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 14.0),
          const BuildingDataTable(),
        ],
      ),
    );
  }
}
