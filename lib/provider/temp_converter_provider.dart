import 'package:flutter/cupertino.dart';

class TempConverterProvider extends ChangeNotifier {
  String _selectedValue = 'Celsius';
  int _selectedTab = 0;
  double _targetTemp = 0.0;
  String _finalResult = '0';
  double _controllerValue = 0;

  String get selectedValue => _selectedValue;

  double get controllerValue => _controllerValue;

  int get selectedTab => _selectedTab;

  String get finalResult => _finalResult;

  double get targetTemp => _targetTemp;

  set selectedValue(String value) {
    _selectedValue = value;
  }

  set controllerValue(double value) {
    _controllerValue = value;
  }

  void selectCurrentMetric(String newValue) {
    switch (newValue) {
      case 'Celsius':
        {
          _targetTemp = controllerValue;
          _selectedValue = newValue!;

        }
        break;

      case 'Fahrenheit':
        {
          _targetTemp = (controllerValue - 32) * 5 / 9;
          _selectedValue = newValue!;


        }
        break;
      case 'kelvin':
        {
          _targetTemp = controllerValue - 273.15;
          _selectedValue = newValue!;

        }
        break;

      default:
        {
          _targetTemp = controllerValue;
          _selectedValue = newValue!;
        }
        break;
    }
    notifyListeners();
  }

  void selectTargetMetric(int value) {
    switch (value) {
      case 0:
        {
          _finalResult = targetTemp.toStringAsFixed(3);
          _selectedTab = value;
        }
        break;

      case 1:
        {
          _finalResult = ((9 / 5 * targetTemp) + 32).toStringAsFixed(3);
          _selectedTab = value;
        }
        break;
      case 2:
        {
          _finalResult = (targetTemp + 273.15).toStringAsFixed(3);
          _selectedTab = value;
        }
        break;

      default:
        {
          _finalResult = '0';
          _selectedTab = value;
        }
        break;
    }
    notifyListeners();
  }
}
