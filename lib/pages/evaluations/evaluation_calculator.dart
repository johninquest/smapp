import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/style.dart';
import '../../utils/calculator.dart';

class EvaluationCalculator extends StatefulWidget {
  const EvaluationCalculator({super.key});

  @override
  State<EvaluationCalculator> createState() => _EvaluationCalculatorState();
}

class _EvaluationCalculatorState extends State<EvaluationCalculator> {
  final meanCalculatorFormKey = GlobalKey<FormState>();
  final TextEditingController term1Average = TextEditingController();
  final TextEditingController term2Average = TextEditingController();
  final TextEditingController term3Average = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'average (mean) calculator'.toUpperCase(),
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Form(
          key: meanCalculatorFormKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: TextFormField(
                      controller: term1Average,
                      enabled: true,
                      decoration:
                          const InputDecoration(labelText: '1. Term average'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() {
                        showCalculatedAvg();
                      }),
                      /* validator: (val) => val!.isEmpt
                                      ? 'Please enter registration number'
                                      : null, */
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: TextFormField(
                      controller: term2Average,
                      enabled: true,
                      decoration:
                          const InputDecoration(labelText: '2. Term average'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() {
                        showCalculatedAvg();
                      }),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: TextFormField(
                      controller: term3Average,
                      enabled: true,
                      decoration:
                          const InputDecoration(labelText: '3. Term average'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() {
                        showCalculatedAvg();
                      }),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 21.0),
                  child: Column(
                    children: [
                      Text(
                        'average (mean)'.toUpperCase(),
                        style: const TextStyle(color: primaryColor),
                      ),
                      Text(
                        '${showCalculatedAvg()}',
                        style: const TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  showCalculatedAvg() {
    double avg = CalculatorService().calculateMean([
      double.tryParse(term1Average.text) ?? 0,
      double.tryParse(term2Average.text) ?? 0,
      double.tryParse(term3Average.text) ?? 0
    ]);
    return avg.toStringAsFixed(2);
  }
}
