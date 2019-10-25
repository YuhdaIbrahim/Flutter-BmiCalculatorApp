import 'dart:math';

class CalculateBrain {
  CalculateBrain({this.height, this.weight, this.age});

  final int height;
  final int weight;
  final int age;

  double _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Lu harus olahraga jangan tidur aja';
    } else if (_bmi >= 18.5) {
      return 'Bagus tetep jaga kondisi seperti ini';
    } else {
      return 'Harus banyak makan!';
    }
  }
}
