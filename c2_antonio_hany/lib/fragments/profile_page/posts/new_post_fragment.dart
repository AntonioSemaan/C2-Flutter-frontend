import 'package:c2_antonio_hany/data_classes/job.dart';
import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/data_classes/user.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/profile_page/wrappers/profile_page_fragment_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NewPostFragment extends StatefulWidget {
  NewPostFragment({Key? key}) : super(key: key);

  @override
  _NewPostFragmentState createState() => _NewPostFragmentState();
}

class _NewPostFragmentState extends State<NewPostFragment> {
  final formKey = GlobalKey<FormState>();

  JobEnum? _jobEnum;
  JobType? _jobType;
  JobEnvironment? _jobEnvironment;
  JobExperience? _jobExperience;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController salaryFromController = TextEditingController();
  TextEditingController salaryToController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();

  String _title = "";
  String _description = "";
  double _salaryFrom = 0.0;
  double _salaryTo = 0.0;
  DateTime? _deadline;

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
          width: 300,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [buildJobEnumField(), buildJobTypeField()],
                ),
                Row(
                  children: [
                    buildJobEnvironmentField(),
                    buildJobExperienceField(),
                  ],
                ),
                buildTitleField(),
                buildDescriptionField(),
                buildSalaryFromField(),
                buildSalaryToField(),
                buildDeadlineField(),
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

  Widget buildJobEnumField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromRGBO(0, 133, 254, 1.0))),
        child: Column(
          children: [
            Text("Job:", style: Theme.of(context).textTheme.headline5),
            RadioListTile<JobEnum>(
                title: Text(JobEnum.JOB_OFFER.stringValue),
                value: JobEnum.JOB_OFFER,
                groupValue: _jobEnum,
                onChanged: (value) {
                  _jobEnum = value;
                }),
            RadioListTile<JobEnum>(
                title: Text(JobEnum.JOB_REQUEST.stringValue),
                value: JobEnum.JOB_REQUEST,
                groupValue: _jobEnum,
                onChanged: (value) {
                  _jobEnum = value;
                }),
          ],
        ),
      ),
    );
  }

  Widget buildJobTypeField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromRGBO(0, 133, 254, 1.0))),
        child: Column(
          children: [
            Text("Type:", style: Theme.of(context).textTheme.headline5),
            RadioListTile<JobType>(
                title: Text(JobType.INTERNSHIP.stringValue),
                value: JobType.INTERNSHIP,
                groupValue: _jobType,
                onChanged: (value) {
                  _jobType = value;
                }),
            RadioListTile<JobType>(
                title: Text(JobType.PART_TIME.stringValue),
                value: JobType.PART_TIME,
                groupValue: _jobType,
                onChanged: (value) {
                  _jobType = value;
                }),
            RadioListTile<JobType>(
                title: Text(JobType.FULL_TIME.stringValue),
                value: JobType.FULL_TIME,
                groupValue: _jobType,
                onChanged: (value) {
                  _jobType = value;
                }),
            RadioListTile<JobType>(
                title: Text(JobType.FREELANCE.stringValue),
                value: JobType.FREELANCE,
                groupValue: _jobType,
                onChanged: (value) {
                  _jobType = value;
                }),
          ],
        ),
      ),
    );
  }

  Widget buildJobExperienceField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromRGBO(0, 133, 254, 1.0))),
        child: Column(
          children: [
            Text("Experience:", style: Theme.of(context).textTheme.headline5),
            RadioListTile<JobExperience>(
                title: Text(JobExperience.JUNIOR.stringValue),
                value: JobExperience.JUNIOR,
                groupValue: _jobExperience,
                onChanged: (value) {
                  _jobExperience = value;
                }),
            RadioListTile<JobExperience>(
                title: Text(JobExperience.MID.stringValue),
                value: JobExperience.MID,
                groupValue: _jobExperience,
                onChanged: (value) {
                  _jobExperience = value;
                }),
            RadioListTile<JobExperience>(
                title: Text(JobExperience.SENIOR.stringValue),
                value: JobExperience.SENIOR,
                groupValue: _jobExperience,
                onChanged: (value) {
                  _jobExperience = value;
                }),
          ],
        ),
      ),
    );
  }

  Widget buildJobEnvironmentField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromRGBO(0, 133, 254, 1.0))),
        child: Column(
          children: [
            Text("Environment:", style: Theme.of(context).textTheme.headline5),
            RadioListTile<JobEnvironment>(
                title: Text(JobEnvironment.ONSITE.stringValue),
                value: JobEnvironment.ONSITE,
                groupValue: _jobEnvironment,
                onChanged: (value) {
                  _jobEnvironment = value;
                }),
            RadioListTile<JobEnvironment>(
                title: Text(JobEnvironment.REMOTE.stringValue),
                value: JobEnvironment.REMOTE,
                groupValue: _jobEnvironment,
                onChanged: (value) {
                  _jobEnvironment = value;
                }),
          ],
        ),
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

  Widget buildSalaryFromField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: salaryFromController,
        decoration: const InputDecoration(
          label: Text("Salary From"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) {
          try {
            if (value == null || value.isNotEmpty) {
              return "Salary from cannot be empty";
            }
            double.parse(value);
            return null;
          } catch (e) {
            return "Salary from is an invalid number";
          }
        },
        onSaved: (value) {
          if (mounted) {
            setState(() {
              _salaryFrom = double.parse(value!);
            });
          }
        },
      ),
    );
  }

  Widget buildSalaryToField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: salaryToController,
        decoration: const InputDecoration(
          label: Text("Salary To"),
          border: OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) {
          try {
            if (value == null || value.isNotEmpty) {
              return "Salary to cannot be empty";
            }

            double b = double.parse(value);
            double salaryFrom = _salaryFrom;
            if (b < salaryFrom) {
              return "Salary from needs to be less than salary to";
            }
            return null;
          } catch (e) {
            return "Salary to is an invalid number";
          }
        },
        onSaved: (value) {
          if (mounted) {
            setState(() {
              _salaryTo = double.parse(value!);
            });
          }
        },
      ),
    );
  }

  Widget buildDeadlineField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: deadlineController,
        decoration: const InputDecoration(
            label: Text("Deadline"),
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
              _deadline = gNormalFormat.parse(value!);
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
                _jobEnum = null;
                _jobType = null;
                _jobExperience = null;
                titleController.text = "";
                descriptionController.text = "";
                salaryFromController.text = "";
                salaryToController.text = "";
                deadlineController.text = "";
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
              String? result = validateRadioFields();
              if (result == null) {
                formKey.currentState!.save();
                Job job = Job(
                  jobEnum: _jobEnum!,
                  jobType: _jobType!,
                  user: gLoggedUser,
                  jobEnvironment: _jobEnvironment!,
                  jobExperience: _jobExperience!,
                  title: _title,
                  description: _description,
                  salaryFrom: _salaryFrom,
                  salaryTo: _salaryTo,
                  deadline: _deadline,
                );
                Map<String, dynamic>? responseData =
                    await MainApiRepo.jobApiRepo.create(job);
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
                  stringToShow = "Job was added successfuly.";
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(stringToShow,
                        style: Theme.of(context).textTheme.headline4),
                    backgroundColor: const Color.fromRGBO(0, 133, 254, 1.0),
                  ));
                }

                Navigator.pop(context);

                context.read<ProfilePageViewWrapper>().value =
                    context.read<ProfilePageViewWrapper>().value;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(result),
                  backgroundColor: Colors.red,
                ));
              }
            }
          },
          child: const Text("Save")),
    );
  }

  String? validateRadioFields() {
    if (_jobType != null &&
        _jobEnum != null &&
        _jobExperience != null &&
        _jobEnvironment != null) {
      return null;
    } else {
      return "Not all radio button groups are selected";
    }
  }
}
