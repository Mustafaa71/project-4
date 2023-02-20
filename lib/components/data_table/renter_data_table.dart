import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project_4/models/renter.dart';
import 'package:flutter_project_4/models/widget_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RenterDataTable extends StatefulWidget {
  const RenterDataTable({
    Key? key,
  }) : super(key: key);

  @override
  State<RenterDataTable> createState() => _RenterDataTableState();
}

class _RenterDataTableState extends State<RenterDataTable> {
  final supabase = Supabase.instance.client;
  List<Renter> renterList = [];

  @override
  void initState() {
    super.initState();
    fetchRenterData();
  }

  Future<List<Renter>> fetchRenterData() async {
    final response = await supabase.from('usr').select().execute();

    List<Renter> renters = [];

    for (final renterJson in response.data) {
      final renter = Renter.fromJson(renterJson);
      renters.add(renter);
    }

    setState(() {
      renterList = renters;
    });

    return renters;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.69,
      height: MediaQuery.of(context).size.height * 0.40,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Renter Name')),
          DataColumn(label: Text('Building')),
          DataColumn(label: Text('Starting Date')),
          DataColumn(label: Text('Monthly Rent')),
          DataColumn(label: Text('More Details')),
          DataColumn(label: Text('Pay Due')),
        ],
        dataRowColor: MaterialStateColor.resolveWith((states) => const Color(0xFFf5f5f5)),
        headingRowColor: MaterialStateColor.resolveWith((states) => const Color(0xFFeaecee)),
        rows: <DataRow>[
          for (var renter in renterList) ...[
            DataRow(
              cells: <DataCell>[
                DataCell(Text(renter.usrId)),
                DataCell(Text('${renter.fName} ${renter.lName}')),
                DataCell(Text(renter.buildingNumber)),
                DataCell(Text(renter.startingDate)),
                DataCell(Text(renter.monthlyRent)),
                DataCell(
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () => WidgetModel.showRenterDialog(context, renter),
                      child: const Icon(Icons.insert_drive_file_outlined),
                    ),
                  ),
                ),
                const DataCell(Icon(Icons.face)),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
