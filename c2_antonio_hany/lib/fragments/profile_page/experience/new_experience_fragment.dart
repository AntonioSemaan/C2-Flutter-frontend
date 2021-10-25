import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/data_classes/user_experience.dart';
import 'package:c2_antonio_hany/fragments/profile_page/wrappers/profile_page_fragment_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NewExperienceFragment extends StatefulWidget {
  List<UserExperience> experiences;

  NewExperienceFragment({Key? key, required this.experiences})
      : super(key: key);

  @override
  _NewExperienceFragmentState createState() => _NewExperienceFragmentState();
}

class _NewExperienceFragmentState extends State<NewExperienceFragment> {
  final formKey = GlobalKey<FormState>();

  TextEditingController companyController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  String _company = "";
  String _title = "";
  String _description = "";
  DateTime? _dateFrom;
  DateTime? _dateTo;

  @override
  Widget build(BuildContext context) {
    return ProfilePageFragmentWrapper(
        desiredHeight: 300,
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
                    buildCompanyField(),
                    buildTitleField(),
                    buildDescriptionField(),
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

  Widget buildCompanyField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: companyController,
        decoration: const InputDecoration(
          label: Text("Company"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              _company = value!;
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
        controller: titleController,
        decoration: const InputDecoration(
          label: Text("Title"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              _title = value!;
            });
          }
        },
      ),
    );
  }

  Widget buildDescriptionField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: descriptionController,
        decoration: const InputDecoration(
          label: Text("Description"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              _description = value!;
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
          if (value!.isNotEmpty) {
            if (mounted) {
              setState(() {
                _dateTo = gNormalFormat.parse(value);
              });
            }
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
                companyController.text = "";
                titleController.text = "";
                descriptionController.text = "";
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
              UserExperience experience = UserExperience(
                  company: _company,
                  title: _title,
                  description: _description,
                  dateFrom: _dateFrom,
                  dateTo: _dateTo);
              widget.experiences.insert(0, experience);
              Map<String, dynamic>? responseData =
                  await MainApiRepo.profileApiRepo.updateUserExperiences(
                      gLoggedUser!.userId, widget.experiences);
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
                stringToShow = "Experiences is successfully saved.";
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
