import 'package:c2_antonio_hany/data_classes/user.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/managers/api_manager.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:c2_antonio_hany/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class LogInFormFragment extends StatefulWidget {
  LogInFormFragment({Key? key}) : super(key: key);

  @override
  _LogInFormFragmentState createState() => _LogInFormFragmentState();
}

class _LogInFormFragmentState extends State<LogInFormFragment> {
  final formKey = GlobalKey<FormState>();

  String _username = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildUsernameField(),
          buildPasswordField(),
          buildSubmit(),
        ],
      ),
    );
  }

  Widget buildUsernameField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          label: Text("Username"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onSaved: (value) => setState(() {
          _username = value!;
        }),
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          label: Text("Password"),
          border: OutlineInputBorder(),
        ),
        obscureText: true,
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onSaved: (value) => setState(() {
          _password = value!;
        }),
      ),
    );
  }

  Widget buildSubmit() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(550, 40)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(
                        color: Color.fromRGBO(0, 133, 254, 1.0)))),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(0, 133, 254, 1.0)),
            textStyle: MaterialStateProperty.all(
                Theme.of(context).textTheme.headline4),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              callLoginApi();
            }
          },
          child: const Text("Submit")),
    );
  }

  Future callLoginApi() async {
    Map<String, dynamic>? responseData =
        await MainApiRepo.userApiRepo.logIn(_username, _password);

    if (responseData == null || responseData.containsKey("errorMessage")) {
      String string = "Something went wrong, please try again";
      if (responseData != null) {
        string = responseData["errorMessage"];
      }
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(string)));
    } else if (!responseData["success"]) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red, content: Text(responseData["message"])));
    } else {
      gLoggedUser = User.fromJson(responseData["data"]);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DashboardPage()),
          (route) => false);
    }
  }
}
