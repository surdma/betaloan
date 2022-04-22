import 'package:beta_loan/views/add_bank.dart';
import 'package:beta_loan/views/components/action_button.dart';
import 'package:beta_loan/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class EligibleConfirm extends StatefulWidget {
  const EligibleConfirm({Key? key}) : super(key: key);

  @override
  State<EligibleConfirm> createState() => _EligibleConfirmState();
}

enum ELIGIBLE { Eligible, notEligible }
enum ACCOUNT { Exist, notExist }

class _EligibleConfirmState extends State<EligibleConfirm> {
  var checkEligiblity = ELIGIBLE.Eligible;
  var alreadyAdded = ACCOUNT.Exist;

  _addBank() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AddBank()));
  }

  _cashout() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashBoard()));
  }

  _tryAgain() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashBoard()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: checkEligiblity == ELIGIBLE.Eligible
            ? Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF77BDD7),
                      Color(0xFFA7EBF4),
                    ],
                    end: Alignment.centerLeft,
                    begin: Alignment.topRight,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/images/Vector.svg",
                          ),
                          const Text("BetaLoan",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Lottie.asset("assets/splash/congratulation.json"),
                    ),
                    Column(
                      children: const [
                        Text(
                          "Hurray !!!",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "You're eligible",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ActionButton(
                        label: alreadyAdded == ACCOUNT.notExist
                            ? "Add Bank"
                            : "Cashout",
                        callback: alreadyAdded == ACCOUNT.notExist
                            ? _addBank
                            : _cashout,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF77BDD7),
                      Color(0xFFA7EBF4),
                    ],
                    end: Alignment.centerLeft,
                    begin: Alignment.topRight,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/images/Vector.svg",
                          ),
                          const Text("BetaLoan",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Lottie.asset(
                            "assets/splash/edited-yelly-face.json"),
                      ),
                    ),
                    Column(
                      children: const [
                        Text(
                          "Sorry",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "You're not eligible",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ActionButton(
                        label: "Try Again",
                        callback: _tryAgain,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
