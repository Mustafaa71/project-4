import 'package:flutter/material.dart';
import 'package:flutter_project_4/models/free.dart';
import 'package:flutter_project_4/pages/new_renter/add_renter_dashboard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BuildingDataTable extends StatefulWidget {
  const BuildingDataTable({super.key});

  @override
  State<BuildingDataTable> createState() => _BuildingDataTableState();
}

class _BuildingDataTableState extends State<BuildingDataTable> {
  final supabase = Supabase.instance.client;

  List<Free> freeAppartmentList = [];
  var page = const AddRenterDashboard();

  @override
  void initState() {
    super.initState();
    fetchFreeAppartment();
  }

  Future<List<Free>> fetchFreeAppartment() async {
    final response = await supabase.from('free').select().execute();

    List<Free> appartment = [];

    for (final freeAppartmentJson in response.data) {
      final renter = Free.fromJson(freeAppartmentJson);
      appartment.add(renter);
    }

    setState(() {
      freeAppartmentList = appartment;
    });

    return appartment;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.69,
      height: MediaQuery.of(context).size.height * 0.40,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Floor Number')),
            DataColumn(label: Text('Appartment Number')),
            DataColumn(label: Text('deserved Money')),
            DataColumn(label: Text('Last Maintance')),
            DataColumn(label: Text('Is Ready')),
            DataColumn(label: Text('Pick')),
          ],
          dataRowColor: MaterialStateColor.resolveWith((states) => const Color(0xFFf5f5f5)),
          headingRowColor: MaterialStateColor.resolveWith((states) => const Color(0xFFeaecee)),
          rows: <DataRow>[
            for (var i in freeAppartmentList) ...[
              DataRow(cells: <DataCell>[
                DataCell(Text(i.floorNumb.toString())),
                DataCell(Text(i.appartmentNumb.toString())),
                DataCell(Text(i.deservedMoney.toString())),
                DataCell(Text(i.lastMaintain.toString())),
                DataCell(Text(i.isReady.toString())),
                DataCell(
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(context: context, builder: (context) => page, isScrollControlled: true);
                    },
                    child: Image.network('https://img.icons8.com/color/512/goal.png', width: 30.0, height: 30.0),
                  ),
                ),
              ]),
            ],
          ],
        ),
      ),
    );
  }
}
