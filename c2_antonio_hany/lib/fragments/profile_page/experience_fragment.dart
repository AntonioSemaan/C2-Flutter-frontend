import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/data_classes/user_experience.dart';
import 'package:c2_antonio_hany/fragments/profile_page/profile_page_fragment_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ExperienceFragment extends StatefulWidget {
  int index;

  ExperienceFragment({Key? key, required this.index}) : super(key: key);

  @override
  _ExperienceFragmentState createState() => _ExperienceFragmentState();
}

class _ExperienceFragmentState extends State<ExperienceFragment> {
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
              buildCompanyField(),
              buildTitleField(),
              buildDescriptionField(),
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

  Widget buildCompanyField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue:
            context.read<ExperienceListWrapper>().value[widget.index].company,
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
              context
                  .read<ExperienceListWrapper>()
                  .value[widget.index]
                  .company = value!;
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
        initialValue:
            context.read<ExperienceListWrapper>().value[widget.index].title,
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
              context.read<ExperienceListWrapper>().value[widget.index].title =
                  value!;
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
        initialValue: context
            .read<ExperienceListWrapper>()
            .value[widget.index]
            .description,
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
              context
                  .read<ExperienceListWrapper>()
                  .value[widget.index]
                  .description = value!;
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
        initialValue: gNormalFormat.format(context
            .read<ExperienceListWrapper>()
            .value[widget.index]
            .dateFrom!),
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
                  .read<ExperienceListWrapper>()
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
            context.read<ExperienceListWrapper>().value[widget.index].dateTo!),
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
              context.read<ExperienceListWrapper>().value[widget.index].dateTo =
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
