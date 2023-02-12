import 'package:flutter/material.dart';
import '../models/student_model.dart';

class StudentController with ChangeNotifier {
  List<StudentModel> _studentList = [];

  // Getters: Class Methods
  /* Read */
  List<StudentModel> get getStudentList => _studentList;

  // Action: Class Methods
  /* Create */
  void addNewStudent(StudentModel newStudent) {
    _studentList.add(newStudent);
    notifyListeners();
  }

  void updateStudent(StudentModel updatedStudent) {
    int editedIndex =
        _studentList.indexWhere((student) => student.id == updatedStudent.id);
    _studentList[editedIndex] = updatedStudent;
    notifyListeners();
  }

  void deleteStudent(int studentId) {
    int deletedIndex =
        _studentList.indexWhere((student) => student.id == studentId);
    _studentList.removeAt(deletedIndex);
    notifyListeners();
  }

  StudentModel filterStudent(int studentId) {
    int filteredIndex =
        _studentList.indexWhere((student) => student.id == studentId);
    return _studentList[filteredIndex];
  }
}