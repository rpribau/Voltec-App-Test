import 'package:test_app/models/feedback_form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class FormController {
  final void Function(String) callback;

  static const String URL =
      "https://script.google.com/macros/s/AKfycbxUZpcVNzOgQvZkdnFwFn3cs8e4sRpxKfkJJsV0UNcBA7zP_iY/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async {
    try {
      await http.get(Uri.parse(URL + feedbackForm.toParams()).then((response)) {
        callback(convert.jsonDecode(response.body['status']));
      });
    } catch (e) {
      print(e);
    }
  }
}
