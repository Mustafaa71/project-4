import 'package:flutter/material.dart';
import 'package:flutter_project_4/components/dashboard/horizontal_container.dart';
import 'package:flutter_project_4/components/dashboard/reusable_renter_dashboard.dart';
import 'package:flutter_project_4/components/data_table/building_data_table.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BuildingOne extends StatefulWidget {
  const BuildingOne({super.key});

  @override
  State<BuildingOne> createState() => _BuildingOneState();
}

class _BuildingOneState extends State<BuildingOne> {
  final supabase = Supabase.instance.client;

  Future<String> freeApartment() async {
    final response1 = await supabase.from('usr').select('id');
    final response2 = await supabase.from('free').select('id');
    final result = response2.length - response1.length;
    return result.toString();
  }

  Future<String> numberOfApartment() async {
    final response = await supabase.from('free').select('id');
    final result = response.length;
    return result.toString();
  }

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
              Expanded(
                child: FutureBuilder<String>(
                  future: numberOfApartment(),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return HorizontalContainer(
                        info: snapshot.data!,
                        title: 'Number Of Appartment',
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const CircularProgressIndicator.adaptive();
                    }
                  },
                ),
              ),
              Expanded(
                child: FutureBuilder<String>(
                  future: freeApartment(),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return HorizontalContainer(
                        info: snapshot.data!,
                        title: 'Free Appartment',
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const CircularProgressIndicator.adaptive();
                    }
                  },
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
