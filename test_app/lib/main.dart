import 'package:flutter/material.dart';
import 'package:test_app/controller.dart';
import 'package:test_app/models/feedback_form.dart';
import 'package:gsheets/gsheets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //TextField Controllers
  TextEditingController nameteamController = TextEditingController();
  TextEditingController numteamController = TextEditingController();
  TextEditingController chasisController = TextEditingController();
  TextEditingController wheelController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      FeedbackForm feedbackForm = FeedbackForm(
        nameteamController.text,
        numteamController.text,
        chasisController.text,
        wheelController.text,
      );

      FormController formController = FormController((String response) {
        print(response);
        if (response == FormController.STATUS_SUCCESS) {
          _showSnackBar("Se han enviado los datos");
        } else {
          _showSnackBar("Un error ha ocurrido, vuelve a intentarlo");
        }
      });

      _showSnackBar("Enviando informacion");
      formController.submitForm(feedbackForm);
    }
  }

  _showSnackBar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Lmao")));

    //_scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
          key: _formKey,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 100, horizontal: 24),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: nameteamController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Valid Name";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Nombre del equipo"),
                ),
                TextFormField(
                  controller: numteamController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Valid Name";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Numero de equipo"),
                ),
                TextFormField(
                  controller: chasisController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Valid Name";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Tipo de chasis"),
                ),
                TextFormField(
                  controller: wheelController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Valid Name";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Tipo de llantas"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  child: Text("Guardar"),
                )
              ]))),
    );
  }
}
