import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chart/provider/temp_converter_provider.dart';
import 'package:provider/provider.dart';

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({Key? key}) : super(key: key);

  @override
  State<TemperatureConverterScreen> createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  TextEditingController controller = TextEditingController();
  List<String> converterType = ['Celsius', 'Fahrenheit', 'kelvin'];

  String? selectedValue = 'Celsius';
  double controllerValue = 0;
  int? selectedTab = 0;
  double targetTemp = 0.0;
  String finalResult='0';

  @override
  Widget build(BuildContext context) {
    final converterProvider=Provider.of<TempConverterProvider>(context);
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
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple)),
                          labelText: 'Temperature',
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                          hintText: 'Enter Temperature'),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Select Metrics',
                          style: TextStyle(fontSize: 20),
                        ),
                        DropdownButton(
                          value: selectedValue,

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

                            setState(() {
                              switch (newValue) {
                                case 'Celsius':
                                  {
                                    targetTemp = controllerValue ;
                                    selectedValue = newValue!;
                                  }
                                  break;

                                case 'Fahrenheit':
                                  {
                                   targetTemp= (controllerValue - 32) * 5/9;
                                   selectedValue = newValue!;
                                  }
                                  break;
                                case 'kelvin':
                                  {
                                    targetTemp=controllerValue- 273.15;
                                    selectedValue = newValue!;
                                  }
                                  break;

                                default:
                                  {
                                    targetTemp = controllerValue;
                                    selectedValue = newValue!;
                                  }
                                  break;
                              }
                            });
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
                        CupertinoSlidingSegmentedControl(
                          padding: const EdgeInsets.only(
                              left: 16, bottom: 8, top: 8, right: 16),
                          thumbColor: Colors.deepPurple,
                          groupValue: selectedTab,
                          children: const {
                            0: Text('Celsius'),
                            1: Text('Fahrenheit'),
                            2: Text('kelvin'),
                          },
                          onValueChanged: (value) {
                            setState(() {
                              selectedTab = value;
                              switch (value) {
                                case 0:
                                  {
                                    finalResult = targetTemp.toStringAsFixed(3);
                                    selectedTab=value;
                                  }
                                  break;

                                case 1:
                                  {
                                    finalResult= ((9 / 5 * targetTemp) + 32).toStringAsFixed(3);
                                    selectedTab=value;
                                  }
                                  break;
                                case 2:
                                  {
                                    finalResult=(targetTemp + 273.15).toStringAsFixed(3);
                                    selectedTab=value;
                                  }
                                  break;

                                default:
                                  {
                                    finalResult = '0';
                                    selectedTab=value;
                                  }
                                  break;
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          finalResult,
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
