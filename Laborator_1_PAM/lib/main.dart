import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MaterialApp(
  home: CurrencyConverter(),
));

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String? selectedCurrency1;
  String? selectedCurrency2;

  final List<String> currencies = ['USD', 'EUR', 'GBP', 'RON', 'MDL'];

  final TextEditingController amountController1 = TextEditingController();
  final TextEditingController amountController2 = TextEditingController();

  void convertCurrency() {
    final amount = double.tryParse(amountController1.text);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount.')),
      );
      return;
    }


    amountController2.text = (amount * 1.2).toStringAsFixed(2);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Conversion performed!')),
    );
  }

  String formatAmount(String value) {
    if (value.isEmpty) return '0.00';
    final doubleValue = double.tryParse(value);
    return doubleValue != null ? doubleValue.toStringAsFixed(2) : '0.00';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child:Text(
              'Currency Converter',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(31, 34, 97, 1),
              ),
            ),
              padding: EdgeInsetsDirectional.fromSTEB(100, 0, 100, 10),
            ),

            Container(
              width: 350,
              height: 272,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipOval(
                        child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Flag_of_Moldova.svg/1280px-Flag_of_Moldova.svg.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      DropdownButton<String>(
                        value: selectedCurrency1,
                        hint: const Text('MDL'),
                        items: currencies.map((String currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCurrency1 = newValue;
                          });
                        },
                      ),
                      SizedBox(
                        width: 150,
                        height:42.5,
                        child: TextField(
                          controller: amountController1,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                            filled: true,
                            fillColor: Color.fromRGBO(203, 212, 205, 1), // Gray background
                          ),
                          onChanged: (value) {
                            amountController1.text = formatAmount(value);
                            amountController1.selection = TextSelection.fromPosition(
                              TextPosition(offset: amountController1.text.length),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: convertCurrency,
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.swap_vert_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Converted Amount',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipOval(
                        child: Image.network(
                          'https://vectorflags.s3.amazonaws.com/flags/us-circle-01.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      DropdownButton<String>(
                        value: selectedCurrency2,
                        hint: const Text('USD'),
                        items: currencies.map((String currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCurrency2 = newValue;
                          });
                        },
                      ),
                      SizedBox(
                        width: 150,
                        height:42.5 ,
                        child: TextField(
                          controller: amountController2,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                            filled: true,
                            fillColor: Color.fromRGBO(203, 212, 205, 1), // Gray background
                          ),
                          onChanged: (value) {
                            amountController2.text = formatAmount(value);
                            amountController2.selection = TextSelection.fromPosition(
                              TextPosition(offset: amountController2.text.length),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Indicative exchange rate:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  '1 USD = ',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color.fromRGBO(203, 212, 205, 1), // Gray background
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
