import 'package:flutter/material.dart';
import 'package:test_app/controller_match.dart';
import 'package:test_app/models/feedback_match.dart';
import 'package:test_app/models/textform.dart';
import 'package:test_app/models/numberform.dart';
import 'package:test_app/models/topbar.dart';
import 'package:test_app/models/formdivider.dart';
import 'package:test_app/api/sheets/user_sheets_api.dart';
import 'package:gsheets/gsheets.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserSheetsApi.init();

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
  State<HomePage> createState() => _AddPageMatchState();
}

class _AddPageMatchState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

//TextField Controllers
  TextEditingController numteamController = TextEditingController();
  TextEditingController nameteamController = TextEditingController();
  TextEditingController matchnumController = TextEditingController();
  TextEditingController matchtypeController = TextEditingController();
  TextEditingController allianceController = TextEditingController();
  TextEditingController tarmacautoController = TextEditingController();
  TextEditingController lowerautoController = TextEditingController();
  TextEditingController upperautoController = TextEditingController();
  TextEditingController lowerteleopController = TextEditingController();
  TextEditingController upperteleopController = TextEditingController();
  TextEditingController defendedController = TextEditingController();
  TextEditingController gotdefendedController = TextEditingController();
  TextEditingController rungController = TextEditingController();
  TextEditingController foulsController = TextEditingController();
  TextEditingController techfoulsController = TextEditingController();
  TextEditingController alliancescoreController = TextEditingController();
  TextEditingController rpController = TextEditingController();
  TextEditingController wonController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      FeedbackMatch feedbackMatch = FeedbackMatch(
        numteamController.text,
        nameteamController.text,
        matchnumController.text,
        matchtypeController.text,
        allianceController.text,
        tarmacautoController.text,
        lowerautoController.text,
        upperautoController.text,
        lowerteleopController.text,
        upperteleopController.text,
        defendedController.text,
        gotdefendedController.text,
        rungController.text,
        foulsController.text,
        techfoulsController.text,
        alliancescoreController.text,
        rpController.text,
        wonController.text,
        commentController.text,
      );

      FormMatch formMatch = FormMatch((String response) {
        print(response);
        if (response == FormMatch.STATUS_SUCCESS) {
          _showSnackBar("Se han enviado los datos");
        } else {
          _showSnackBar("Un error ha ocurrido, vuelve a intentarlo");
        }
      });

      _showSnackBar("Enviando informacion");
      formMatch.submitForm(feedbackMatch);
    }
  }

  _showSnackBar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Datos enviados")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Image(
                        height: 30,
                        width: 30,
                        image: AssetImage("assets/images/back.png"),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const TopBar(
                topPadding: 0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Team number

                        NumberForm(
                          text: "Team number",
                          formText: "Enter team number",
                          padding: 0,
                          child: TextFormField(
                            controller: numteamController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Valid Number";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),

                        //Team name
                        TextForm(
                            text: "Team name",
                            formText: "Enter team name",
                            padding: 50,
                            child: TextFormField(
                                controller: nameteamController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Name";
                                  } else {
                                    return null;
                                  }
                                })),

                        NumberForm(
                            text: "Match number",
                            formText: "Enter match number",
                            padding: 50,
                            child: TextFormField(
                                controller: matchnumController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Number";
                                  } else {
                                    return null;
                                  }
                                })),

                        TextForm(
                            text: "Match type",
                            formText: "Enter match type",
                            padding: 50,
                            child: TextFormField(
                                controller: matchtypeController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Name";
                                  }
                                })),

                        TextForm(
                            text: "Alliance",
                            formText: "Enter alliance",
                            padding: 50,
                            child: TextFormField(
                                controller: allianceController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Alliance Color";
                                  } else {
                                    return null;
                                  }
                                })),

                        const FormDivider(
                          dividerText: "Autonomous",
                        ),

                        TextForm(
                            text: "Left tarmac?",
                            formText: "Yes/No",
                            padding: 30,
                            child: TextFormField(
                                controller: tarmacautoController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Boolean";
                                  } else {
                                    return null;
                                  }
                                })),

                        NumberForm(
                            text: "Lower Hub Cargo",
                            formText: "Enter cargo number",
                            padding: 50,
                            child: TextFormField(
                                controller: lowerautoController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Number";
                                  } else {
                                    return null;
                                  }
                                })),

                        NumberForm(
                            text: "Upper Hub Cargo",
                            formText: "Enter cargo number",
                            padding: 50,
                            child: TextFormField(
                                controller: upperautoController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Number";
                                  } else {
                                    return null;
                                  }
                                })),

                        const FormDivider(
                          dividerText: "Teleop",
                        ),
                        NumberForm(
                            text: "Lower Hub Cargo",
                            formText: "Enter cargo number",
                            padding: 30,
                            child: TextFormField(
                                controller: lowerteleopController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Number";
                                  } else {
                                    return null;
                                  }
                                })),

                        NumberForm(
                            text: "Upper Hub Cargo",
                            formText: "Enter cargo number",
                            padding: 50,
                            child: TextFormField(
                                controller: upperteleopController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Number";
                                  } else {
                                    return null;
                                  }
                                })),

                        TextForm(
                            text: "Robot defended?",
                            formText: "Yes/No",
                            padding: 50,
                            child: TextFormField(
                                controller: defendedController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Boolean";
                                  } else {
                                    return null;
                                  }
                                })),

                        TextForm(
                            text: "Was the robot defended?",
                            formText: "Yes/No",
                            padding: 50,
                            child: TextFormField(
                                controller: gotdefendedController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Boolean";
                                  } else {
                                    return null;
                                  }
                                })),

                        const FormDivider(
                          dividerText: "Endgame",
                        ),

                        TextForm(
                            text: "Rung climbed",
                            formText: "Enter answer",
                            padding: 30,
                            child: TextFormField(
                                controller: rungController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Name";
                                  } else {
                                    return null;
                                  }
                                })),

                        const FormDivider(
                          dividerText: "Fouls",
                        ),

                        NumberForm(
                            text: "Fouls made",
                            formText: "Enter number",
                            padding: 30,
                            child: TextFormField(
                                controller: foulsController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Number";
                                  } else {
                                    return null;
                                  }
                                })),

                        NumberForm(
                            text: "Tech fouls made",
                            formText: "Enter number",
                            padding: 50,
                            child: TextFormField(
                                controller: techfoulsController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Number";
                                  } else {
                                    return null;
                                  }
                                })),

                        const FormDivider(
                          dividerText: "Match results",
                        ),

                        NumberForm(
                            text: "Alliance score",
                            formText: "Enter score",
                            padding: 30,
                            child: TextFormField(
                                controller: alliancescoreController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Number";
                                  } else {
                                    return null;
                                  }
                                })),

                        NumberForm(
                            text: "Ranking points",
                            formText: "Enter ranking points",
                            padding: 50,
                            child: TextFormField(
                                controller: rpController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Number";
                                  } else {
                                    return null;
                                  }
                                })),

                        TextForm(
                            text: "Alliance won?",
                            formText: "Yes/No",
                            padding: 50,
                            child: TextFormField(
                                controller: wonController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Valid Boolean";
                                  } else {
                                    return null;
                                  }
                                })),

                        const FormDivider(
                          dividerText: "Extra comments",
                        ),

                        TextForm(
                          text: "",
                          formText: "Enter comments",
                          padding: 0,
                          child: TextFormField(
                            controller: commentController,
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        ElevatedButton(
                          onPressed: () {
                            _submitForm();
                          },
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            primary: Colors.indigo,
                          ),
                          child: Text("Submit"),

                          /* child: SizedBox(
                        width: 150,
                        height: 40,
                      ), */
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
