import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category {item, food, weapon}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.item: Icons.emoji_objects,
  Category.weapon: Icons.shield_moon_outlined,
};

final formatter = DateFormat.yMEd();

const uuid = Uuid();

class ExpenseData {
  ExpenseData({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatDate {
    return formatter.format(date);
  }
}
