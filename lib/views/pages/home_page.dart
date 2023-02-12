import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/student_controller.dart';
import './create_student_page.dart';
import '../widgets/student_list_cell_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String title = "Student List";
  void _addNewStudent(BuildContext context) {
    print("----- Adding New Student -----");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => CreateStudentPage(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Provider.of(
      context,
      listen: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: (studentController.getStudentList.isEmpty)
            ? const Center(
                child: Text(
                  "There is no student in the list. \n Create one!",
                  textAlign: TextAlign.center,
                ),
              )
            : ListView(
                children: [
                  const SizedBox(height: 5.0),
                  ...studentController.getStudentList
                      .map(
                        (student) => StudentListCellWidget(
                          student: student,
                        ),
                      )
                      .toList(),
                  const SizedBox(height: 5.0),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewStudent(context),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}