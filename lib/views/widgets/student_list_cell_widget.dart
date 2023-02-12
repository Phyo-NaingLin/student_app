import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/student_model.dart';
import '../../controllers/student_controller.dart';
import '../pages/update_student_page.dart';
import '../pages/delete_student_page.dart';

class StudentListCellWidget extends StatelessWidget {
  final StudentModel student;

  const StudentListCellWidget({
    required this.student,
    super.key,
  });
  void _onUpdateStudent(
    BuildContext context,
    int studentId,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            UpdateStudentPage(studentId: studentId),
      ),
    );
  }

  void _onDeleteStudent(
    BuildContext context,
    int studentId,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            DeleteStudentPage(studentId: studentId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.account_circle,
          size: 50.0,
        ),
        title: Text(student.name),
        subtitle: Text(student.rollNumber),
        trailing: SizedBox(
          width: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => _onUpdateStudent(context, student.id),
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () => _onDeleteStudent(context, student.id),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}