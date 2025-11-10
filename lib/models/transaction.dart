import 'package:flutter/material.dart';

class TransactionModel {
  final String title;
  final String category;
  final String amount;
  final IconData icon;
  final Color color;

  TransactionModel({
    required this.title,
    required this.category,
    required this.amount,
    required this.icon,
    required this.color,
  });
}
