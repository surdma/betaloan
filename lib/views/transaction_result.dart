import 'package:beta_loan/views/cashout.dart';
import 'package:beta_loan/views/components/action_button.dart';
import 'package:beta_loan/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TransactionResult extends StatefulWidget {
  final result;
  const TransactionResult({Key? key, this.result}) : super(key: key);

  @override
  State<TransactionResult> createState() => _TransactionResultState();
}

class _TransactionResultState extends State<TransactionResult> {
  var currentRESULT;

  @override
  void initState() {
    _displayResult();
    super.initState();
  }

  _displayResult() {
    setState(() {
      currentRESULT = widget.result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: SafeArea(
            child: currentRESULT == RESULT.SUCCESSFUL
                ? Flexible(
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Flexible(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                      Icons.arrow_circle_left_rounded),
                                ),
                                const Text(
                                  "BetaLoan",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              "Successful",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Lottie.asset("assets/splash/successful.json"),
                            const SizedBox(height: 50),
                            const Text(
                              "Transaction Successful",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Your cash is on the way",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            ActionButton(
                              label: "okay",
                              callback: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => DashBoard()));
                              },
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DashBoard()));
                              },
                              child:
                                  const Icon(Icons.arrow_circle_left_rounded),
                            ),
                            const Text(
                              "BetaLoan",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Failed",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Lottie.asset("assets/splash/failed.json"),
                        const SizedBox(height: 50),
                        const Text(
                          "Transaction Failed",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Try again later",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        ActionButton(
                          label: "okay",
                          callback: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => DashBoard()));
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
          )),
    );
  }
}
