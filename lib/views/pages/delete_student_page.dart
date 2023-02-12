import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/student_model.dart';
import '../../controllers/student_controller.dart';
import '../widgets/text_field_widget.dart';

class DeleteStudentPage extends StatelessWidget {
  final int studentId;
  DeleteStudentPage({
    required this.studentId,
    super.key,
  });
  final String title = "Delete Student";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();

  void _onInitialize(BuildContext context) {
    final StudentController studentController = Provider.of<StudentController>(
      context,
      listen: false,
    );
    StudentModel filteredStudent = studentController.filterStudent(studentId);
    _studentNameController.text = filteredStudent.name.toString();
    _ageController.text = filteredStudent.age.toString();
    _addressController.text = filteredStudent.address.toString();
    _rollNoController.text = filteredStudent.rollNumber.toString();
  }

  void _onDeleteStudent(BuildContext context) {
    final StudentController studentController = Provider.of<StudentController>(
      context,
      listen: false,
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Delete Student"),
      content: const Text("Are you sure to delete this student?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            studentController.deleteStudent(studentId);

            Navigator.of(context).pop();

            const SnackBar snackBar = SnackBar(
              content: Text(
                'Deleted student successfully!',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: (Colors.grey),
              duration: Duration(seconds: 3),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            Navigator.of(context).pop();
          },
          child: const Text("Delete"),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    _onInitialize(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20.0),
                TextFieldWidget(
                  controller: _studentNameController,
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  label: "Name",
                  hint: "Enter student name",
                ),
                TextFieldWidget(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  readOnly: true,
                  label: "Age",
                  hint: "Enter student age",
                ),
                TextFieldWidget(
                  controller: _addressController,
                  keyboardType: TextInputType.streetAddress,
                  readOnly: true,
                  label: "Address",
                  hint: "Enter student address",
                ),
                TextFieldWidget(
                  controller: _rollNoController,
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  label: "Roll Number",
                  hint: "Enter student roll number",
                ),
                const SizedBox(height: 50.0),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () => _onDeleteStudent(context),
                    child: const Text("Delete Student"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}