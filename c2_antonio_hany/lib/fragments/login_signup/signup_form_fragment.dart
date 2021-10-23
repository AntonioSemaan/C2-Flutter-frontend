import 'package:c2_antonio_hany/data_classes/user.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:c2_antonio_hany/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpFormFragment extends StatefulWidget {
  SignUpFormFragment({Key? key}) : super(key: key);

  @override
  _SignUpFormFragmentState createState() => _SignUpFormFragmentState();
}

class _SignUpFormFragmentState extends State<SignUpFormFragment> {
  final formKey = GlobalKey<FormState>();

  String _username = "";
  String _password = "";
  String _confirmPassword = "";
  String _email = "";
  String _firstName = "";
  String _lastName = "";
  String _title = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildUsernameField(),
              buildPasswordField(),
              buildPasswordConfirmationField(),
              buildEmailField(),
              buildFirstNameField(),
              buildLastNameField(),
              buildTitleField(),
              buildSubmit(),
            ],
          ),
        ),
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
        onSaved: (value) {
          if (mounted) {
            setState(() {
              _username = value!;
            });
          }
        },
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
        onChanged: (value) {
          if (mounted) {
            setState(() {
              _password = value;
            });
          }
        },
      ),
    );
  }

  Widget buildPasswordConfirmationField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          label: Text("Confirm Password"),
          border: OutlineInputBorder(),
        ),
        obscureText: true,
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) {
          if (value!.length < 3) {
            return "Enter at least 3 characters";
          } else if (_password != _confirmPassword) {
            return "Your passwrods do not match";
          } else {
            return null;
          }
        },
        onChanged: (value) {
          if(mounted) {
            setState(() {
          _confirmPassword = value;
        });
          }
        },
      ),
    );
  }

  Widget buildEmailField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          label: Text("Email"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!)
                ? null
                : "Please enter a valid email address",
        onSaved: (value) {
         if(mounted) {
           setState(() {
          _email = value!;
        });
         }
        },
      ),
    );
  }

  Widget buildFirstNameField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          label: Text("First Name"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 1 ? null : "Enter at least 2 characters",
        onSaved: (value) {
         if(mounted) {
           setState(() {
          _firstName = value!;
        });
         }
        },
      ),
    );
  }

  Widget buildLastNameField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          label: Text("Last Name"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 1 ? null : "Enter at least 2 characters",
        onSaved: (value) {
         if(mounted) {
           setState(() {
          _lastName = value!;
        });
         }
        },
      ),
    );
  }

  Widget buildTitleField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          label: Text("Your Title"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 4 ? null : "Enter at least 5 characters",
        onSaved: (value) {
         if(mounted) {
           setState(() {
          _title = value!;
        });
         }
        },
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
              callSignUpApi();
            }
          },
          child: const Text("Submit")),
    );
  }

  Future callSignUpApi() async {
    Map<String, dynamic>? responseData = await MainApiRepo.userApiRepo
        .signUp(_username, _password, _email, _firstName, _lastName, _title);

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
          MaterialPageRoute(builder: (context) => ProfilePage(userId: gLoggedUser!.userId)),
          (route) => false);
    }
  }
}
