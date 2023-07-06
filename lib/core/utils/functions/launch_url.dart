import 'package:url_launcher/url_launcher.dart';

import 'custom_snack_bar.dart';

Future<void> launchCustomUrl(context, String url) async {
  if (url.isNotEmpty) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      customSnackBar(context, url);
    }
  }
}
