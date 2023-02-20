import 'package:flutter/material.dart';
import 'package:flutter_project_4/components/dashboard/horizontal_container.dart';
import 'package:flutter_project_4/components/dashboard/reusable_renter_dashboard.dart';
import 'package:flutter_project_4/components/data_table/renter_data_table.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VirtualPage extends StatefulWidget {
  const VirtualPage({super.key});

  @override
  State<VirtualPage> createState() => _VirtualPageState();
}

class _VirtualPageState extends State<VirtualPage> {
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return ReusableRenterDashboard(
      title: 'Upcoming Dues',
      showButton: true,
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: HorizontalContainer(
                  info: '30',
                  title: 'Numbe of Renters',
                ),
              ),
              Expanded(
                child: HorizontalContainer(
                  info: '${DateTime.now().day} / ${DateTime.now().month + 1} / ${DateTime.now().year}',
                  title: 'Due Date',
                ),
              ),
              const Expanded(
                child: HorizontalContainer(
                  info: '15000.0 SAR',
                  title: 'Today Income',
                ),
              ),
            ],
          ),
          const RenterDataTable(),
        ],
      ),
    );
  }
}
