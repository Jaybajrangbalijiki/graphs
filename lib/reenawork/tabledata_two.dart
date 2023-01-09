import 'package:flutter/material.dart';
import 'package:reenawork/reenawork/management_dto.dart';

class InsertDataTableTwo extends StatelessWidget {
  List<TopFiveIssuanceCertificate> topFiveIssuanceCertificate;

  InsertDataTableTwo(this.topFiveIssuanceCertificate, {super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(

      border: TableBorder.all(
          color: Colors.grey, style: BorderStyle.solid, width: 2),
        columns: const [
          DataColumn(
            label: Text("Name",style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14),),
          ),
          DataColumn(
            label: Text("Total Value",style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14)),
          ),
        ],
      rows: List<DataRow>.generate(
          topFiveIssuanceCertificate.length,
              (index) => DataRow(
              color: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    // Even rows will have a grey color.
                    if (index % 2 == 0)
                      return Colors.grey.withOpacity(0.2);
                    return Colors.pinkAccent.withOpacity(0.0); // Use default value for other states and odd rows.
                  }),
              cells: [
                DataCell(
                  Text(topFiveIssuanceCertificate[index].txtName),
                ),
                DataCell(
                  Text(topFiveIssuanceCertificate[index].totalCount),
                ),
              ]))
          .toList(),
    );
  }
}
