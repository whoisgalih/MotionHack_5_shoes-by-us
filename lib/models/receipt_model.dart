import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:shoes_by_us/models/payment_provider.dart';
import 'package:uuid/uuid.dart';

class ReceiptProvider with ChangeNotifier {
  var uuid = Uuid();

  List<Receipt> _receipts = [];

  List<Receipt> get receipts => _receipts;

  addReceipt(total, payment) {
    _receipts.add(Receipt(
        id: uuid.v1(),
        total: total,
        date: DateFormat("dd MMMM yyyy, hh:mm a").format(DateTime.now()),
        payment: payment));
    notifyListeners();
  }
}

class Receipt {
  String id;
  num total;
  String date;
  Payment payment;

  Receipt({
    Key? key,
    required this.id,
    required this.total,
    required this.date,
    required this.payment,
  });
}
