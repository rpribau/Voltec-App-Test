import 'package:test_app/models/feedback_match.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormMatch {
  final void Function(String) callback;

  static const String URL =
      "https://script.google.com/macros/s/AKfycbxd_TLMTk-Ws5XHrnPmuWof6wvAeRFtp1WZnJbJCLooP-6vXcA/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormMatch(this.callback);

  void submitForm(FeedbackMatch feedbackMatch) async {
    try {
      final response =
          await http.get(Uri.parse(URL + feedbackMatch.toParams()));
      await callback;
    } catch (e) {
      print(e);
    }
  }
}
