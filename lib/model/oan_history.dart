import 'package:flutter/cupertino.dart';

enum LOANSTATUS { ONGOING, REFUND }

class LoanHistory {
  String purpose;
  final icon;
  String interest;
  String amount;
  LOANSTATUS status;
  String state;

  LoanHistory({
    required this.purpose,
    required this.icon,
    required this.amount,
    required this.interest,
    required this.state,
    required this.status,
  });
}
