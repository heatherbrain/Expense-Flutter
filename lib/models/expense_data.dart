import 'package:uuid/uuid.dart';

enum Category {item, food, weapon}

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
}
