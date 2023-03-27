
import 'package:flutter/material.dart';
import 'package:flutter_chart/provider/temp_converter_provider.dart';
import 'package:provider/provider.dart';
import '../widget/targettemp_sliding_control_widget.dart';
import '../widget/temp_value_textfield.dart';

class TemperatureConverterScreen extends StatelessWidget {
   TemperatureConverterScreen({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();
  List<String> converterType = ['Celsius', 'Fahrenheit', 'kelvin'];
  double controllerValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final converterProvider = Provider.of<TempConverterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('We Convert'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.black26,
                    border: Border.all(color: Colors.deepPurple)),
                child: Column(
                  children: [
                    TempValueTextField(controller: controller),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Select Metrics',
                          style: TextStyle(fontSize: 20),
                        ),
                        DropdownButton(
                          value: converterProvider.selectedValue,
                          items: converterType.map((String items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onChanged: (newValue) {
                            controllerValue = double.parse(controller.text);
                            converterProvider.controllerValue = controllerValue;
                            converterProvider.selectCurrentMetric(newValue!);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black26,
                    border: Border.all(color: Colors.deepPurple)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'TARGET TEMPERATURE',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TargetTempSlidingControlWidget(converterProvider: converterProvider),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          converterProvider.finalResult,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
