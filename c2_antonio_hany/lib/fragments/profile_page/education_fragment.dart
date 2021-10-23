import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/data_classes/user_education.dart';
import 'package:c2_antonio_hany/fragments/dashboard/dashboard_panel_wrapper.dart';
import 'package:c2_antonio_hany/fragments/profile_page/profile_page_fragment_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class EducationFragment extends StatefulWidget {
  int index;

  EducationFragment({Key? key, required this.index}) : super(key: key);

  @override
  _EducationFragmentState createState() => _EducationFragmentState();
}

class _EducationFragmentState extends State<EducationFragment> {
  final formKey = GlobalKey<FormState>();
  late bool inEditMode;

  @override
  Widget build(BuildContext context) {
    inEditMode = context.read<UserIdWrapper>().value == gLoggedUser!.userId;

    return ProfilePageFragmentWrapper(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildNameField(),
              buildDegreeField(),
              buildDomainField(),
              buildDateFromField(),
              buildDateToField(),
              Visibility(
                visible: inEditMode,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildRestore(),
                    buildSubmit(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildNameField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue:
            context.read<EducationListWrapper>().value[widget.index].name,
        decoration: const InputDecoration(
          label: Text("Name"),
          border: OutlineInputBorder(),
        ),
        enabled: inEditMode,
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              context.read<EducationListWrapper>().value[widget.index].name =
                  value!;
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
        initialValue:
            context.read<EducationListWrapper>().value[widget.index].degree,
        decoration: const InputDecoration(
          label: Text("Degree"),
          border: OutlineInputBorder(),
        ),
        enabled: inEditMode,
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              context.read<EducationListWrapper>().value[widget.index].degree =
                  value!;
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
        initialValue:
            context.read<EducationListWrapper>().value[widget.index].domain,
        decoration: const InputDecoration(
          label: Text("Domain"),
          border: OutlineInputBorder(),
        ),
        enabled: inEditMode,
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) =>
            value!.length > 2 ? null : "Enter at least 3 characters",
        onSaved: (value) {
          if (mounted) {
            setState(() {
              context.read<EducationListWrapper>().value[widget.index].domain =
                  value!;
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
        initialValue: gNormalFormat.format(
            context.read<EducationListWrapper>().value[widget.index].dateFrom!),
        decoration: const InputDecoration(
            label: Text("Date From"),
            border: OutlineInputBorder(),
            hintText: "dd/mm/yyyy"),
        enabled: inEditMode,
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
              context
                  .read<EducationListWrapper>()
                  .value[widget.index]
                  .dateFrom = gNormalFormat.parse(value!);
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
        initialValue: gNormalFormat.format(
            context.read<EducationListWrapper>().value[widget.index].dateTo!),
        decoration: const InputDecoration(
            label: Text("Date To"),
            border: OutlineInputBorder(),
            hintText: "Leave emtpy if to present"),
        enabled: inEditMode,
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
              context.read<EducationListWrapper>().value[widget.index].dateTo =
                  gNormalFormat.parse(value!);
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
            fixedSize: MaterialStateProperty.all(const Size(70, 40)),
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
            fixedSize: MaterialStateProperty.all(const Size(70, 40)),
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
            }
          },
          child: const Text("Save")),
    );
  }
}
