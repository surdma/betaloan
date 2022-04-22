import 'package:flutter/cupertino.dart';

enum TRANSACTIONSTATUS { SENT, RECEIVED, PENDING, PROCESSING }

class TransactionHistory {
  final icon;
  String name;
  String amount;
  TRANSACTIONSTATUS status;
  String state;
  final time;

  TransactionHistory({
    required this.time,
    required this.icon,
    required this.amount,
    required this.name,
    required this.state,
    required this.status,
  });
}
