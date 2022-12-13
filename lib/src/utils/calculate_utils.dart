import 'dart:math';

class CalculateUtils {
  static String calculateImc(double height, double weight) {
    double imc = weight / pow(height / 100, 2);

    return imc.toStringAsFixed(2);
  }
}
