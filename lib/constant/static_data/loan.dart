import 'package:flutter/material.dart';

import '../../model/oan_history.dart';

final loanData = [
  LoanHistory(
      icon: const Icon(Icons.send),
      amount: "₦100.00",
      interest: "45",
      state: "ongoing",
      status: LOANSTATUS.ONGOING,
      purpose: "House Rent"),
  LoanHistory(
      icon: const Icon(Icons.payment),
      amount: "₦70.00",
      interest: "10",
      state: "Paid",
      status: LOANSTATUS.REFUND,
      purpose: 'Shopping'),
  LoanHistory(
      icon: const Icon(Icons.add_a_photo),
      amount: "₦1,000.00",
      interest: "20",
      state: "Paid",
      status: LOANSTATUS.REFUND,
      purpose: 'Gas Bill'),
  LoanHistory(
      icon: const Icon(Icons.ice_skating),
      amount: "₦1,000.00",
      interest: "0.6",
      status: LOANSTATUS.REFUND,
      state: "Paid",
      purpose: 'Water Utility'),
  LoanHistory(
      icon: const Icon(Icons.wallet_membership),
      amount: "₦1,000.00",
      interest: "5",
      status: LOANSTATUS.REFUND,
      state: "Paid",
      purpose: 'School Fees'),
  LoanHistory(
      icon: const Icon(Icons.call_received),
      amount: "₦1,000.00",
      interest: "30",
      status: LOANSTATUS.REFUND,
      state: "Paid",
      purpose: 'Food'),
  LoanHistory(
      icon: const Icon(Icons.send),
      amount: "₦100.00",
      interest: "45",
      state: "Paid",
      status: LOANSTATUS.REFUND,
      purpose: "House Rent"),
  LoanHistory(
      icon: const Icon(Icons.payment),
      amount: "₦70.00",
      interest: "10",
      state: "Paid",
      status: LOANSTATUS.REFUND,
      purpose: 'Shopping'),
  LoanHistory(
      icon: const Icon(Icons.add_a_photo),
      amount: "₦1,000.00",
      interest: "20",
      state: "Paid",
      status: LOANSTATUS.REFUND,
      purpose: 'Gas Bill'),
];
