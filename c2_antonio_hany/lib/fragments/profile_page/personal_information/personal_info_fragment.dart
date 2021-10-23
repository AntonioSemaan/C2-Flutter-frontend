import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/data_classes/user.dart';
import 'package:c2_antonio_hany/fragments/profile_page/education/education_fragment.dart';
import 'package:c2_antonio_hany/fragments/profile_page/wrappers/profile_page_fragment_wrapper.dart';
import 'package:c2_antonio_hany/fragments/profile_page/wrappers/profile_page_panel_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PersonalInfoFragment extends StatefulWidget {
  User user;
  PersonalInfoFragment({Key? key, required this.user}) : super(key: key);

  @override
  _PersonalInfoFragmentState createState() => _PersonalInfoFragmentState();
}

class _PersonalInfoFragmentState extends State<PersonalInfoFragment> {
  final formKey = GlobalKey<FormState>();
  late bool inEditMode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    inEditMode = gLoggedUser!.userId == widget.user.userId;
    return ProfilePageFragmentWrapper(
        desiredHeight: 475,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 300,
            height: double.infinity,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  buildUsernameField(),
                  buildFirstNameField(),
                  buildLastNameField(),
                  buildTitleField(),
                  buildEmailField(),
                  Visibility(visible: inEditMode, child: buildPasswordField()),
                  Visibility(
                    visible: inEditMode,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          buildRestore(),
                          buildSubmit(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildUsernameField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: widget.user.username,
        decoration: const InputDecoration(
          label: Text("Username"),
          border: OutlineInputBorder(),
        ),
        enabled: inEditMode,
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              widget.user.username = value!;
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
        enabled: inEditMode,
        obscureText: true,
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onChanged: (value) {
          if (mounted) {
            setState(() {
              widget.user.password = value;
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
        initialValue: widget.user.email,
        decoration: const InputDecoration(
          label: Text("Email"),
          border: OutlineInputBorder(),
        ),
        enabled: inEditMode,
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!)
                ? null
                : "Please enter a valid email address",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              widget.user.email = value!;
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
        initialValue: widget.user.firstName,
        decoration: const InputDecoration(
          label: Text("First Name"),
          border: OutlineInputBorder(),
        ),
        enabled: inEditMode,
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 1 ? null : "Enter at least 2 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              widget.user.firstName = value!;
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
        initialValue: widget.user.lastName,
        decoration: const InputDecoration(
          label: Text("Last Name"),
          border: OutlineInputBorder(),
        ),
        enabled: inEditMode,
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 1 ? null : "Enter at least 2 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              widget.user.lastName = value!;
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
        initialValue: widget.user.title,
        decoration: const InputDecoration(
          label: Text("Your Title"),
          border: OutlineInputBorder(),
        ),
        enabled: inEditMode,
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 4 ? null : "Enter at least 5 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              widget.user.title = value!;
            });
          }
        },
      ),
    );
  }

  Widget buildRestore() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(90, 40)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.red))),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.red),
            textStyle: MaterialStateProperty.all(
                Theme.of(context).textTheme.headline4),
          ),
          onPressed: () {
            if (mounted) {
              setState(() {});
            }
          },
          child: const Text("Restore")),
    );
  }

  Widget buildSubmit() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(90, 40)),
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
              callSaveUserApi();
            }
          },
          child: const Text("Save")),
    );
  }

  Future callSaveUserApi() async {
    Map<String, dynamic>? responseData =
        await MainApiRepo.userApiRepo.updateUser(widget.user);
    String stringToShow = "";
    if (responseData == null || responseData.containsKey("errorMessage")) {
      stringToShow = "Something went wrong, please try again";
      if (responseData != null) {
        stringToShow = responseData["errorMessage"];
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(stringToShow),
        backgroundColor: Colors.red,
      ));
    } else if (!responseData["success"]) {
      stringToShow = responseData["message"];
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(stringToShow),
        backgroundColor: Colors.red,
      ));
    } else {
      stringToShow = "Personal info are successfully saved.";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text(stringToShow, style: Theme.of(context).textTheme.headline4),
        backgroundColor: const Color.fromRGBO(0, 133, 254, 1.0),
      ));
    }
  }
}
