import 'package:beta_loan/views/components/action_button.dart';
import 'package:beta_loan/views/components/transact_input.dart';
import 'package:beta_loan/views/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Eligibilty extends StatefulWidget {
  const Eligibilty({Key? key}) : super(key: key);

  @override
  State<Eligibilty> createState() => _EligibiltyState();
}

class _EligibiltyState extends State<Eligibilty> {
  @override
  Widget build(BuildContext context) {
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
          child: Stack(
            children: [
              Positioned.fill(
                bottom: -450.0,
                left: 0.0,
                child: Opacity(
                    opacity: 0.9,
                    child: SvgPicture.asset("assets/images/loanCheck.svg")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const Text(
                          "BetaLoan",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    Form(
                      child: Column(
                        children: [
                          Column(
                            children: const [
                              TransactInput(label: "Loan Amount"),
                              SizedBox(
                                height: 10,
                              ),
                              TransactInput(label: "Purpose"),
                              SizedBox(
                                height: 10,
                              ),
                              TransactInput(label: "Current Job"),
                              SizedBox(
                                height: 10,
                              ),
                              TransactInput(label: "Monthly Income"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ActionButton(
                        label: "Confirm",
                        callback: _confirm,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _confirm() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoanDuration()));
  }
}
