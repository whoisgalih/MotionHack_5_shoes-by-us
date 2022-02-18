import 'package:intl/intl.dart';

final f = NumberFormat("###,###,###");

String addDot(num num) {
  return "Rp${f.format(num).replaceAll(",", ".")}";
}
