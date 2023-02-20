import 'package:flutter/material.dart';
import 'package:flutter_project_4/models/building.dart';

class BuildingDataTable extends StatelessWidget {
  const BuildingDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.69,
      height: MediaQuery.of(context).size.height * 0.40,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Building Number')),
            DataColumn(label: Text('Floor Number')),
            DataColumn(label: Text('Appartment Number')),
            DataColumn(label: Text('deserved Money')),
            DataColumn(label: Text('Last Maintance')),
            DataColumn(label: Text('Is Ready')),
          ],
          dataRowColor: MaterialStateColor.resolveWith((states) => const Color(0xFFf5f5f5)),
          headingRowColor: MaterialStateColor.resolveWith((states) => const Color(0xFFeaecee)),
          rows: <DataRow>[
            for (var i in BuildingData.building_1) ...[
              DataRow(cells: <DataCell>[
                DataCell(Text(i.buildingNumber)),
                DataCell(Text(i.floorNumber)),
                DataCell(Text(i.appartmentNumber)),
                DataCell(Text(i.deservedMoney)),
                DataCell(Text(i.lastMaintance)),
                DataCell(Text(i.isReady)),
              ]),
            ],
          ],
        ),
      ),
    );
  }
}
