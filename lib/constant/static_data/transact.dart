import 'package:flutter/material.dart';

import '../../model/transcation_history.dart';

final transactData = [
  TransactionHistory(
    icon: const Icon(Icons.send),
    amount: "₦100.00",
    time: "1:20PM",
    state: "Pending",
    status: TRANSACTIONSTATUS.PENDING,
    name: "Tolu Olaniyi",
  ),
  TransactionHistory(
    icon: const Icon(Icons.payment),
    amount: "₦70.00",
    time: "10:00AM",
    state: "Received",
    status: TRANSACTIONSTATUS.RECEIVED,
    name: 'IDOWUN JJC',
  ),
  TransactionHistory(
      icon: const Icon(Icons.add_a_photo),
      amount: "₦1,000.00",
      time: "2:45PM",
      state: "Sent",
      status: TRANSACTIONSTATUS.SENT,
      name: 'KENNY TOPE'),
  TransactionHistory(
      icon: const Icon(Icons.ice_skating),
      amount: "₦1,000.00",
      time: "12.06PM",
      status: TRANSACTIONSTATUS.RECEIVED,
      state: "Received",
      name: 'RUKAYAT UMME'),
  TransactionHistory(
      icon: const Icon(Icons.wallet_membership),
      amount: "₦1,000.00",
      time: "5:23PM",
      status: TRANSACTIONSTATUS.RECEIVED,
      state: "Received",
      name: 'FEMI TOLUWA'),
  TransactionHistory(
      icon: const Icon(Icons.call_received),
      amount: "₦1,000.00",
      time: "3:20PM",
      status: TRANSACTIONSTATUS.SENT,
      state: "Sent",
      name: 'YEMO IFALEYI'),
  TransactionHistory(
      icon: const Icon(Icons.send),
      amount: "₦100.00",
      time: "4:50AM",
      state: "Pending",
      status: TRANSACTIONSTATUS.PENDING,
      name: "JACK JOHNNY"),
  TransactionHistory(
      icon: const Icon(Icons.payment),
      amount: "₦70.00",
      time: "10:01AM",
      state: "Received",
      status: TRANSACTIONSTATUS.RECEIVED,
      name: 'LATEEF RIGHT'),
  TransactionHistory(
      icon: const Icon(Icons.add_a_photo),
      amount: "₦1,000.00",
      time: "2:09PM",
      state: "Sent",
      status: TRANSACTIONSTATUS.SENT,
      name: 'PAUL JACK'),
];
