import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  final Function(String) onAddHistory;

  const CalculatorPage({super.key, required this.onAddHistory});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = "";
  String output = "";
  bool isDarkTheme = false; // Status tema

  void _calculate() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(input);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        output = eval.toString();
        widget.onAddHistory("$input = $output"); // Panggil callback untuk menambah riwayat
      });
    } catch (e) {
      setState(() {
        output = "Error";
      });
    }
  }

  void _clear() {
    setState(() {
      input = "";
      output = "";
    });
  }

  void _delete() {
    setState(() {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    });
  }

  void _updateInput(String value) {
    setState(() {
      input += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kalkulator"),
          actions: [
            Switch(
              value: isDarkTheme,
              onChanged: (value) {
                setState(() {
                  isDarkTheme = value;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(
              minWidth: 100,
              maxWidth: 300,
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Gabungkan input dan output tanpa kotak
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          input,
                          style: TextStyle(
                            fontSize: 24,
                            color: isDarkTheme ? Colors.white : Colors.black, // Warna teks berdasarkan tema
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 10),
                        Text(
                          output,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: isDarkTheme ? Colors.white : Colors.black, // Warna teks berdasarkan tema
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // GridView tombol kalkulator dengan Expanded agar tidak overflow
                Expanded(
                  flex: 2,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1.2,
                    children: [
                      _button("7"), _button("8"), _button("9"), _button("/"),
                      _button("4"), _button("5"), _button("6"), _button("*"),
                      _button("1"), _button("2"), _button("3"), _button("-"),
                      _button("0"), _button("."), _button("="), _button("+"),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                // Tombol tambahan untuk "Clear" dan "Riwayat"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _clear,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      child: Text("C", style: TextStyle(fontSize: 18)),
                    ),
                    ElevatedButton(
                      onPressed: _delete,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      child: Text("⌫", style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(String text) {
    return ElevatedButton(
      onPressed: text == "=" ? _calculate : () => _updateInput(text),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(60, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: text == "=" ? Colors.orange : Colors.blueGrey,
        foregroundColor: Colors.white,
        padding: EdgeInsets.all(16),
      ),
      child: Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}