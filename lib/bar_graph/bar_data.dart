import 'package:expense_tracker/bar_graph/individual_bar.dart';

class BarData {
  double sunAmount = 0.0;
  double monAmount = 0.0;
  double tueAmount = 0.0;
  double wedAmount = 0.0;
  double thuAmount = 0.0;
  double friAmount = 0.0;
  double satAmount = 0.0;

  

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sunAmount),
      IndividualBar(x: 0, y: monAmount),
      IndividualBar(x: 0, y: tueAmount),
      IndividualBar(x: 0, y: wedAmount),
      IndividualBar(x: 0, y: thuAmount),
      IndividualBar(x: 0, y: friAmount),
      IndividualBar(x: 0, y: satAmount),
    ];
  }
}
