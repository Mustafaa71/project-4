import 'package:flutter/material.dart';
import 'package:flutter_project_4/components/dashboard/add_building_dialog.dart';
import 'package:flutter_project_4/components/dashboard/appbar_section.dart';
import 'package:flutter_project_4/components/dashboard/column_section.dart';
import 'package:flutter_project_4/pages/home_page/building-dashboard/building-one.dart';
import 'package:flutter_project_4/pages/home_page/building-dashboard/virtual_page.dart';
import 'package:flutter_project_4/pages/new_renter/add_renter_dashboard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    const pages = [
      VirtualPage(),
      BuildingOne(),
      AddRenterDashboard(),
    ];

    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ColumnSection(onFilterChanged: (newIndex) {
          setState(() {
            pageIndex = newIndex;
          });
        }),
        Column(
          children: [
            const AppbarSection(),
            pages[pageIndex],
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF010c80),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AddBuildingDialog();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
