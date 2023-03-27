import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../provider/temp_converter_provider.dart';

class TargetTempSlidingControlWidget extends StatelessWidget {
  const TargetTempSlidingControlWidget({
    super.key,
    required this.converterProvider,

  });

  final TempConverterProvider converterProvider;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      padding: const EdgeInsets.only(left: 16, bottom: 8, top: 8, right: 16),
      thumbColor: Colors.deepPurple,
      groupValue: converterProvider.selectedTab,
      children: const {
        0: Text('Celsius'),
        1: Text('Fahrenheit'),
        2: Text('kelvin'),
      },
      onValueChanged: (value) {
        converterProvider.selectTargetMetric(value!);
      },
    );
  }
}
