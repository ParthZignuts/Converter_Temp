import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../model/salesdata_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charts'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SfCartesianChart(
            title: ChartTitle(text: 'Adani Power'),
            crosshairBehavior: CrosshairBehavior(
              enable: true,
              activationMode: ActivationMode.longPress,
              lineColor: Colors.green,
            ),
              primaryXAxis: CategoryAxis(),
              enableAxisAnimation: true,
              legend: Legend(backgroundColor: Colors.green,isVisible: true),
              series: <LineSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                  // Bind data source
                    dataSource:  <SalesData>[
                      SalesData('Jan', 20),
                      SalesData('Feb', 28),
                      SalesData('Mar', 5),
                      SalesData('Apr', 32),
                      SalesData('May', 40)
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales
                ),
              ]
          ),
        ),
      ),
    );
  }
}
