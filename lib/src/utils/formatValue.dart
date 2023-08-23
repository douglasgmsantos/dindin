// ignore_for_file: depend_on_referenced_packages

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class FormatValue {
  String priceToCurrency(double price) {
    NumberFormat numberFormat =
        NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2);
    return numberFormat.format(price);
  }

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();

    return dateFormat.format(dateTime);
  }
}
