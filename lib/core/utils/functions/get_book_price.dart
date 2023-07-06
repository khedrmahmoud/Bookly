import '../../data/models/book_model/book_model.dart';
import 'get_currency_symbol.dart';

String getPriceText(BookModel book, context) {
  if (book.saleInfo!.saleability == "FOR_SALE") {
    return "${book.saleInfo?.retailPrice?.amount?.toInt() ?? ''}${currency(context, book.saleInfo?.retailPrice?.currencyCode ?? "")}";
  } else if (book.saleInfo!.saleability == "FREE") {
    return 'Free';
  } else {
    return 'Unsalable';
  }
}
