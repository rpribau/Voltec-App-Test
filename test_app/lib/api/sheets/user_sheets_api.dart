import 'package:gsheets/gsheets.dart';

import '../../models/user.dart';

class UserSheetsApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "gsheets-354307",
  "private_key_id": "b2f1bfa2245a222a54dffec3d352208d581eb5f7",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCyud2qz/DkbK0W\nvZE2LzIvDX7ojCkFacifH06NQwWfEXt2AlvqY4kwYtsky0Ra84R4AYQTzzDXWuM9\nmNVuQ0KOJofSSVuIKur3KvC+NyWO6fu5MDHRHqBUh9OQJahyamVec/wPgIX/mU47\nWREJX8HSIgdY24l6pao3wrp/RuO03wrBIgUf3yUk+Mf1yBLSKh7L/5qHupBpI+nf\nCahHJJG3Ht7HdA7Y8MPtklqRtzjJSlH9P8Df9JIany/qQzvks9BzTOx/3zBN5Qzq\n9zc2FlfEmJir7DZyfbCfdt7x5NgZRsvgFRVXPp3AgDu1O5jGB5GB+SS/03PN/7F0\n3HrLzIGnAgMBAAECggEABrVrWKoNhMV/icb72GjVHWcISHpaX9WkrjRionLNlzb0\nx203PgkWcTaEu1DV9AQICOklqAiy8KJ8vScre8QSj3tqxb3zLZ1OzJBUEQ/I3SBz\nTnQ8qnjX09R1YIfJVuIfg/gekgZlAT8j7J5fQVbS06xrUi6LboshZI5uqbBjg7p7\nZ5EVxulIRQd+UhrKDFLvN2zH94Nh7+Rmon3/Vstcj2f1Jn1OsiqnbJdCjsM/gL/l\nBKcd9b+6ndbvWvH7/CO08IVCtf5tpisWzxPiS8QVp2TC2MY4rn8rUD2eWsSipyhj\n2S9opa8Ma6bYAEnLCGN8ehi25ORLf6IlMD5JhF4QYQKBgQDviuS+FM4SgBd7aUeT\nhthlIPPSeCHvrJzXpWaKFK0eGzDgCjI8mvKXB2xyuctpVfQw8sz+fvs3HhVAOltF\nwPvBGISoVHN6A5QZzqwLq6y71KwTlDG1qIbSQM+YCnblqHs7Q2OYzCMuoNhUt4UK\nXiI+HTady430Vx0hWn/UtCItZQKBgQC/AVLIgCI5iC7KgmVsp6ByPfxxcrvb67zs\nC13UBTq+qgdUO/XwRIM2jTSQN+OqZ1PdIik5wV7ihijSxP73lWPc9qahEr4rMoM3\nJtYO2utVpL7qFYk7nXCk/Lw8dRAj/0F4Thjx0Kd+qRkpREpmN8OEw4sPvJO21Z8L\nEUI9wEtYGwKBgQC1sZabj1BXvA0TsOF3xzpwSrRmmnSzRSyabXz/k3tUcK974IAG\ndEk5wYnC46akuWvFjQVsrIiEYC8iTqFYoW7UInLM83G7xOcbRCY/m/Ijbscu+qNR\n9Qh+hmZwHs/clxUR+KWdCopNHfe5GpKxMIGst5/rxLBh+4m++NQpVJDv+QKBgBH7\nc+nAdnhoI8+Y+yeBmI9o2o1rudf4l665WzoMy/0LUOlTQ9I9AQVvwdUaDesLE1As\nWSlA1UgKTWmadk6k1+QDrKhZdWHnvYbBt0FqxuEnQ3oSUPs11VcTHD2s37oj2+wR\nnjOV6073aJEEBuUctuGW706p+FYsQm7uTwg1RGKlAoGAdeF3GCjO4Z3P1W5tkOHt\nIk/41n+E9vcI9tZxhTd+wgISqJ12+RA0D84khdSsPyjRuIu750ASzRHZr0HahXAR\nF4IfODYP2+KzZhAFwKKKeD4mflo40Epj+iTmulZ7MfgDrl8PVkCPs5doCaFqBG8N\nq5U16yfeEzIeWrwOJ0jTrmQ=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-354307.iam.gserviceaccount.com",
  "client_id": "105645860336273484468",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-354307.iam.gserviceaccount.com"
}
''';
  static final _spreadsheetId = '10jLgLMa0GabdLGPh_Uj00OUHj8mjxuhcQemTuj9Y328';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'quals');

      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
}
