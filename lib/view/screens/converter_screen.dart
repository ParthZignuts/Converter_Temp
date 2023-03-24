import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  int controllerValue= 0;
  int? selectedTab = 0;
  double targetTemp = 0.0;

  @override
  Widget build(BuildContext context) {
setState(() {
});
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
                            setState(() {
                              targetTemp=(controllerValue * 9/5) + 32;
                              selectedValue = newValue!;
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
                            });
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '$targetTemp',
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
