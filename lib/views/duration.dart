import 'package:beta_loan/views/components/action_button.dart';
import 'package:beta_loan/views/components/transact_input.dart';
import 'package:beta_loan/views/eligible_confirm.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoanDuration extends StatelessWidget {
  const LoanDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _checkEligiblity() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => EligibleConfirm()));
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                    ),
                    Text(
                      "BetaLoan",
                      style: TextStyle(
                        fontFamily: "ROboto",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Lottie.asset("assets/splash/timer-icons.json"),
                const SizedBox(height: 30),
                Form(
                  child: Column(
                    children: const [
                      TransactInput(label: "Loan Duration"),
                      SizedBox(height: 10),
                      TransactInput(label: "Interest Rate"),
                      SizedBox(height: 10),
                      TransactInput(label: "Home Address"),
                    ],
                  ),
                ),
                Spacer(),
                ActionButton(
                  label: "Check",
                  callback: _checkEligiblity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
