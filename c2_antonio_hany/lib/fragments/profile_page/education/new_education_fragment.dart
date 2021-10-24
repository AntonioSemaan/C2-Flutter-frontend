import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/data_classes/user_education.dart';
import 'package:c2_antonio_hany/fragments/profile_page/wrappers/profile_page_fragment_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NewEducationFragment extends StatefulWidget {
  NewEducationFragment({Key? key}) : super(key: key);

  @override
  _NewEducationFragmentState createState() => _NewEducationFragmentState();
}

class _NewEducationFragmentState extends State<NewEducationFragment> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController domainController = TextEditingController();
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  String _name = "";
  String _degree = "";
  String _domain = "";
  DateTime? _dateFrom;
  DateTime? _dateTo;

  @override
  Widget build(BuildContext context) {
    return ProfilePageFragmentWrapper(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 25.0,
          right: 25.0,
          left: 25.0,
        ),
        child: Container(
          width: 600,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildNameField(),
                buildDegreeField(),
                buildDomainField(),
                buildDateFromField(),
                buildDateToField(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildRestore(),
                    buildSubmit(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget buildNameField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: nameController,
        decoration: const InputDecoration(
          label: Text("Name"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              _name = value!;
            });
          }
        },
      ),
    );
  }

  Widget buildDegreeField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: degreeController,
        decoration: const InputDecoration(
          label: Text("Degree"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              _degree = value!;
            });
          }
        },
      ),
    );
  }

  Widget buildDomainField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: domainController,
        decoration: const InputDecoration(
          label: Text("Domain"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              _domain = value!;
            });
          }
        },
      ),
    );
  }

  Widget buildDateFromField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: dateFromController,
        decoration: const InputDecoration(
            label: Text("Date From"),
            border: OutlineInputBorder(),
            hintText: "dd/mm/yyyy"),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) {
          try {
            gNormalFormat.parse(value!);
            return null;
          } catch (e) {
            return "Date should be in following format: 'dd/mm/yyyy'";
          }
        },
        onSaved: (value) {
          if (mounted) {
            setState(() {
              _dateFrom = gNormalFormat.parse(value!);
            });
          }
        },
      ),
    );
  }

  Widget buildDateToField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: dateToController,
        decoration: const InputDecoration(
            label: Text("Date To"),
            border: OutlineInputBorder(),
            hintText: "Leave emtpy if to present"),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) {
          try {
            if (value == "") {
              return null;
            }
            gNormalFormat.parse(value!);
            return null;
          } catch (e) {
            return "Date should be in following format: 'dd/mm/yyyy'";
          }
        },
        onSaved: (value) {
          if (mounted) {
            setState(() {
              _dateTo = gNormalFormat.parse(value!);
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
              setState(() {
                nameController.text = "";
                degreeController.text = "";
                domainController.text = "";
                dateFromController.text = "";
                dateToController.text = "";
              });
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
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              UserEducation education = UserEducation(
                  name: _name,
                  degree: _degree,
                  domain: _domain,
                  dateFrom: _dateFrom,
                  dateTo: _dateTo);
              context.read<EducationListWrapper>().value.insert(0, education);
              Map<String, dynamic>? responseData =
                  await MainApiRepo.profileApiRepo.updateUserEducation(
                      gLoggedUser!.userId,
                      context.read<EducationListWrapper>().value);
              String stringToShow = "";
              if (responseData == null ||
                  responseData.containsKey("errorMessage")) {
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
                stringToShow = "Education is successfully saved.";
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(stringToShow,
                      style: Theme.of(context).textTheme.headline4),
                  backgroundColor: const Color.fromRGBO(0, 133, 254, 1.0),
                ));

                Navigator.pop(context);
              }
            }
          },
          child: const Text("Save")),
    );
  }
}
