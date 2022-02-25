import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ClickToCopy {
  // Copy data to Clipboard
  static Future<void> copy(String text) async {
    if (text.isNotEmpty) {
      await Clipboard.setData(ClipboardData(text: text));
      debugPrint('ClickToCopy: $text');
      return;
    } else {
      debugPrint('ClickToCopy: No text to copy on Clipboard');
      //throw ('No text to copy on Clipboard');
    }
  }

  // Paste data copied from Clipboard
  static Future<String> paste() async {
    ClipboardData? data = await Clipboard.getData('text/plain');
    debugPrint('ClickToCopy: ${data?.text?.toString() ?? ''}');
    return data?.text?.toString() ?? '';
  }
}
