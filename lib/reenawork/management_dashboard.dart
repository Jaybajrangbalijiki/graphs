import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reenawork/reenawork/total_partner_chart.dart';
import 'package:reenawork/reenawork/tabledata_one.dart';
import 'package:reenawork/reenawork/tabledata_three.dart';
import 'package:reenawork/reenawork/tabledata_two.dart';

import 'reg_vs_app_chart.dart';
import 'month_purchase_chart.dart';
import 'management_dto.dart';
import 'month_issuance_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class ManagementDashboard extends StatefulWidget {
  @override
  State<ManagementDashboard> createState() => _ManagementDashboardState();
}

class _ManagementDashboardState extends State<ManagementDashboard> {
  late double screenHeight;
  late double screenWidth;
  late List<GraphModel> graphs;
  late ManagementDTO? managementDTO;
  @override
  void initState() {
    callAPI("OGM0TEIwSmZiK0NjL1JacENFTURpUT09");
    graphs = [];
    managementDTO = null;
    for (int graphIndex = 0; graphIndex < 7; graphIndex++) {
      if (graphIndex == 0) {
        graphs.add(GraphModel(graphName: "Revenue / Purchase Value Graph"));
      } else if (graphIndex == 1) {
        graphs.add(GraphModel(graphName: "Issuance Quantity Graph"));
      } else if (graphIndex == 2) {
        graphs
            .add(GraphModel(graphName: "Total Channel/Business/Branch Graph"));
      } else if (graphIndex == 3) {
        graphs.add(
            GraphModel(graphName: "Top 5 Partner Purchase Value Till Date"));
      } else if (graphIndex == 4) {
        graphs.add(GraphModel(graphName: "Top 5 Issuance Certificate Count"));
      } else if (graphIndex == 5) {
        graphs.add(GraphModel(graphName: "Top 5 Partner Wise Issuance"));
      } else if (graphIndex == 6) {
        graphs.add(GraphModel(
            graphName: "Month Wise Registration v/s Approval Graph"));
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Management Dashboard"),
          centerTitle: true,
        ),
        body: managementDTO == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.infinity,
                height: screenHeight * 0.83,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
                          width: double.infinity,
                          height: screenHeight * 0.05,
                          // height: 20,
                          child: Text(
                            graphs[index].graphName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        _showWidget(graphs[index].graphName, index),
                      ],
                    );
                  },
                  itemCount: graphs.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                )),
      ),
    );
  }

  _showWidget(String name, int index) {
    double firstGraphWidth = screenWidth - screenWidth * 0.04;

    return index == 0
        ? Container(
            padding: EdgeInsets.all(5),
            width: firstGraphWidth,
            height: screenHeight * 0.4,
            child: RawScrollbar(
              thumbColor: Colors.grey,
              thickness: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 1.3,
                      child: MonthPurchaseChart(managementDTO!.result.monthPurchase),
                    ),
                    scrollDirection: Axis.horizontal),
              ),
            ))
        : index == 1
            ? Container(
                padding: EdgeInsets.all(5),
                width: firstGraphWidth,
                height: screenHeight * 0.4,
                child: RawScrollbar(
                  thumbColor: Colors.grey,
                  thickness: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: SingleChildScrollView(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1.02,
                          child: MonthIssuanceChart(
                              managementDTO!.result.monthIssuance),
                        ),
                        scrollDirection: Axis.horizontal),
                  ),
                ))
            : index == 2
                ? Container(
                    width: firstGraphWidth,
                    height: screenHeight * 0.38,
                    child:
                    TotalPartnerChart(managementDTO!.result.totalPartners))

                : index == 3
                    ? Container(
                        width: firstGraphWidth,
                        height: screenHeight * 0.38,
                        child: InsertDataTableOne(managementDTO!.result.topFivePartnerPurchaseValue))
                    : index == 4
                        ? Container(
                            width: firstGraphWidth,
                            height: screenHeight * 0.38,
                            child: InsertDataTableTwo(managementDTO!.result.topFiveIssuanceCertificate))
                        : index == 5
                            ? Container(
                                width: firstGraphWidth,
                                height: screenHeight * 0.38,
                                child: InsertDataTableThree(managementDTO!.result.topFiveIssuanceCertificatePartnerWise))
                            : index == 6
                                ? Container(
                                    padding: EdgeInsets.all(5),
                                    width: firstGraphWidth,
                                    height: screenHeight * 0.4,
                                    child: RawScrollbar(
                                      thumbColor: Colors.grey,
                                      thickness: 5,
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                        child: SingleChildScrollView(
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  5,
                                              child: RegVSAppChart(managementDTO!.result.monthArrRegVsApp,managementDTO!.result.monthCountArrRegVsApp1,managementDTO!.result.monthCountArrRegVsApp2),
                                            ),
                                            scrollDirection: Axis.horizontal),
                                      ),
                                    ))
                                : Container();
  }

  callAPI(String ra_id) async {
    Map data = {
      'ra_id': ra_id,
    };
    final response = await http.post(
        Uri.parse(
            "https://xtratrust.xtranetindia.com/RaMobile/getManagementGraphData"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));
    print("api response -------> ${response.body}");

    if (response.statusCode == 200) {
      // EasyLoading.dismiss();
      Map<String, dynamic> resData = jsonDecode(response.body);
      if (resData['success']) {
        managementDTO = ManagementDTO.fromJson(jsonDecode(response.body));

        setState(() {});
      } else {}
    }
  }
}

class GraphModel {
  String graphName;

  GraphModel({required this.graphName});
}
