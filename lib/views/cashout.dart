import 'package:beta_loan/views/components/action_button.dart';
import 'package:beta_loan/views/transaction_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/transact_input.dart';

class Cashout extends StatefulWidget {
  const Cashout({Key? key}) : super(key: key);

  @override
  State<Cashout> createState() => _CashoutState();
}

enum RESULT { SUCCESSFUL, FAILED }

class _CashoutState extends State<Cashout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.arrow_circle_left_rounded),
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
                  height: 40,
                ),
                const Text(
                  "Cashout",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Container(
                    height: 630,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF77D7AE),
                          Color(0xFFA7EBF4),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Opacity(
                            opacity: 0.2,
                            child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                "assets/images/Frame.svg",
                              ),
                            ),
                          ),
                        ),
                        Form(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(
                                  height: 100,
                                ),
                                Column(
                                  children: const [
                                    TransactInput(label: "Amount"),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TransactInput(label: "Account Number"),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TransactInput(label: "Account Name"),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TransactInput(label: "Bank Name"),
                                  ],
                                ),
                                Spacer(),
                                ActionButton(
                                  label: "Cashout",
                                  callback: _cashOut,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _cashOut() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            const TransactionResult(result: RESULT.SUCCESSFUL),
      ),
    );
  }
}
