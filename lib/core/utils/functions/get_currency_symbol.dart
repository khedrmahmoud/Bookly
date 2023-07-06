import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String currency(context, name) {
  Locale locale = Localizations.localeOf(context);
  var format =
      NumberFormat.simpleCurrency(locale: locale.toString(), name: name);
  return format.currencySymbol;
}
