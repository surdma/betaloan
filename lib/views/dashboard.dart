import 'package:beta_loan/constant/static_data/transact.dart';
import 'package:beta_loan/model/transcation_history.dart';
import 'package:beta_loan/views/cashout.dart';
import 'package:beta_loan/views/components/action_button.dart';
import 'package:beta_loan/views/components/transact_input.dart';
import 'package:beta_loan/views/eligible.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constant/static_data/loan.dart';
import '../model/oan_history.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

enum WALLETCARD { showLoanCard, showWalletCard }

class _DashBoardState extends State<DashBoard> {
  var data = ["loan", "wallet"];
  final _controller = PageController();
  WALLETCARD currentCard = WALLETCARD.showLoanCard;
  List<TransactionHistory> _transactHistory = transactData;
  List<LoanHistory> _loanHistory = loanData;
  var status;
  var loanBalance = 100.00;
  var accountBalance = 10.00;

  final _walletBalance = TextEditingController();
  final _refundAmountController = TextEditingController();

  _getWalletBalance() {
    setState(() {
      _walletBalance.text = "₦ ${accountBalance}";
    });
  }

  @override
  void initState() {
    _getWalletBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD3F8FB),
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onDoubleTap: () {
                    if (currentCard == WALLETCARD.showLoanCard) {
                      setState(() {
                        currentCard = WALLETCARD.showWalletCard;
                      });
                    } else {
                      setState(() {
                        currentCard = WALLETCARD.showLoanCard;
                      });
                    }
                  },
                  child: topCard(),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    currentCard == WALLETCARD.showLoanCard
                        ? "Loan History"
                        : "Transaction History",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                currentCard == WALLETCARD.showLoanCard
                    ? loanHistory()
                    : transactionHistory(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loanHistory() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _loanHistory.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: _loanHistory[index].status == LOANSTATUS.ONGOING
                          ? Colors.redAccent
                          : Color(0xFF38A6BE),
                    ),
                    child: Icon(Icons.send),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _loanHistory[index].purpose,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Interest ${_loanHistory[index].interest}%",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _loanHistory[index].amount,
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        _loanHistory[index].state,
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  transactionHistory() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _transactHistory.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: _transactHistory[index].status ==
                              TRANSACTIONSTATUS.PENDING
                          ? Colors.redAccent
                          : _transactHistory[index].status ==
                                  TRANSACTIONSTATUS.RECEIVED
                              ? Color(0xFF38A6BE)
                              : Colors.white,
                    ),
                    child: const Icon(Icons.send),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _transactHistory[index].name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${_transactHistory[index].time}",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _transactHistory[index].amount,
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        _transactHistory[index].state,
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 1,
        );
      },
    );
  }

  topCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Material(
        elevation: 10,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          height: 270,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF5CE7AC),
                Color(0xFF7DD9E5),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentCard = WALLETCARD.showLoanCard;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 105,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: currentCard == WALLETCARD.showLoanCard
                                  ? const Color(0xFF256BF4)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Loan",
                              style: TextStyle(
                                color: currentCard == WALLETCARD.showLoanCard
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentCard = WALLETCARD.showWalletCard;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 105,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: currentCard == WALLETCARD.showWalletCard
                                  ? const Color(0xFF256BF4)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Wallet",
                              style: TextStyle(
                                color: currentCard == WALLETCARD.showLoanCard
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/mine.jpg",
                        height: 30,
                        width: 30,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    currentCard == WALLETCARD.showLoanCard
                        ? "Loan Balance"
                        : "Wallet Balance",
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    currentCard == WALLETCARD.showLoanCard
                        ? (loanBalance == 0.0
                            ? "₦ ${loanBalance}"
                            : "₦ ${loanBalance}")
                        : "${_walletBalance.text}",
                    style: const TextStyle(
                      fontSize: 45,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  transact(
                    loanLabel: "withdraw",
                    walletLabel: "cashout",
                    color: Color(0xFF256BF4),
                    icon: Icons.arrow_upward_rounded,
                    transactButton: currentCard == WALLETCARD.showLoanCard
                        ? _withdraw
                        : _cashout,
                  ),
                  transact(
                    loanLabel: "Borrow",
                    walletLabel: "Add Fund",
                    color: Colors.white,
                    icon: Icons.add,
                    transactButton: currentCard == WALLETCARD.showLoanCard
                        ? _borrowFund
                        : _addFund,
                  ),
                  transact(
                    loanLabel: "Refund",
                    walletLabel: "Pay Bills",
                    color: Color(0xFF256BF4),
                    icon: Icons.arrow_downward_rounded,
                    transactButton: currentCard == WALLETCARD.showLoanCard
                        ? _reFund
                        : _payBill,
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  _cashout() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Cashout()));
  }

  _withdraw() {
    accountBalance += loanBalance;
    setState(() {
      _walletBalance.text = "₦ $accountBalance";
      loanBalance = loanBalance * 0;
    });
  }

  _borrowFund() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Eligibilty()));
  }

  _addFund() {}

  _reFund() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          height: 350,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "REFUND",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TransactInput(
                      label: "Wallet Balance",
                      controller: _walletBalance,
                      editable: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TransactInput(
                      label: "Amount",
                      controller: _refundAmountController,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ActionButton(label: "Confirm", callback: _refundConfirm),
              ),
            ],
          ),
        );
      },
    );
  }

  _refundConfirm() {
    var refundAmount = _refundAmountController.text;

    if (double.parse(refundAmount) == 0.0 ||
        double.parse(refundAmount) <= 0.9) {
      print("amount is too low");
    } else if (int.parse(refundAmount) >= accountBalance) {
      print("amount is too high");
    } else {
      var refund = accountBalance - int.parse(refundAmount);

      Navigator.of(context).pop();

      var newBalance = refund;

      setState(() {
        _walletBalance.text = "₦ $newBalance";
        loanBalance -= double.parse(refundAmount);
        _refundAmountController.clear();
      });
    }
  }

  _payBill() {}

  transact({loanLabel, walletLabel, color, icon, transactButton}) {
    return InkWell(
      onTap: transactButton,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: color,
            ),
            child: Icon(icon),
          ),
          const SizedBox(height: 7),
          Text(
            currentCard == WALLETCARD.showLoanCard ? loanLabel : walletLabel,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
