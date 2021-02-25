import 'package:billing_splitter_app/util/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:billing_splitter_app/util/sliding_switch.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  bool _currency = false;

  Color _purple = HexColor('#6908D6');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            alignment: Alignment.center,
            color: Colors.transparent,
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(20.5),
              children: <Widget>[
                Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: _purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Per Person',
                            style: TextStyle(
                              color: Color(0xff6629d0),
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                              '\$${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}',
                              style: TextStyle(
                                color: Color(0xff6629d0),
                                fontWeight: FontWeight.w900,
                                fontSize: 43,
                              )),
                        ],
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          color: Colors.grey.shade400,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        style: TextStyle(color: _purple),
                        decoration: InputDecoration(
                            prefixText: 'Bill Amount ',
                            //suffixText: '\$',
                            prefixIcon: Icon(Icons.attach_money_sharp)),
                        onChanged: (String value) {
                          try {
                            _billAmount = double.parse(value);
                          } catch (exception) {
                            _billAmount = 0.0;
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Currency',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SlidingSwitch(
                              value: _currency,
                              width: 90,
                              height: 40,
                              textOn: 'COP',
                              textOff: 'USD',
                              animationDuration:
                                  const Duration(milliseconds: 20),
                              colorOn: Colors.grey.shade700,
                              colorOff: Colors.grey.shade700,
                              onChanged: (bool value) {
                                setState(() {
                                  debugPrint('$value');
                                  changeCurrency(value);
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Split',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          Row(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(50.0),
                                onTap: () {
                                  setState(() {
                                    if (_personCounter > 1) {
                                      _personCounter--;
                                    } else {
                                      //Pass
                                    }
                                  });
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: _purple.withOpacity(0.1)),
                                  child: Center(
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                        color: _purple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '$_personCounter',
                                style: TextStyle(
                                  color: _purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(50.0),
                                onTap: () {
                                  setState(() {
                                    if (_personCounter < 100) {
                                      _personCounter++;
                                    } else {
                                      //Pass
                                    }
                                  });
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: _purple.withOpacity(0.1)),
                                  child: Center(
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        color: _purple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tip',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text(
                              '\$ ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: _purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0),
                            ),
                          )
                        ],
                      ),
                      //Slider
                      Column(
                        children: [
                          Text(
                            '$_tipPercentage %',
                            style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                          Slider(
                            min: 0,
                            max: 100,
                            activeColor: _purple,
                            inactiveColor: Colors.grey,
                            divisions: 10,
                            value: _tipPercentage.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                _tipPercentage = newValue.round();
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )));
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty) {
      //Pass
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }

  changeCurrency(bool currency) {
    if (currency == true) {
      _billAmount *= 3500;
      calculateTotalTip(_billAmount, _personCounter, _tipPercentage);
      calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage);
    } else {
      _billAmount /= 3500;
      calculateTotalTip(_billAmount, _personCounter, _tipPercentage);
      calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage);
    }
  }
}
