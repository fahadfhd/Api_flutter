import 'package:students/providers/base_provider.dart';
import 'package:students/services/web_api_services.dart';
import 'package:students/view/homeScreen/model/students_model.dart';

class StudentsProvider extends BaseProvider {
  StudentsProvider() : super(name: "StudentsProvider");

  int _index = 0;
  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  StudentModel? studentModel;
  Future<StudentModel?> loadStudent() async {
    isLoading = true;
    await WebAPIServices().loadStudents().then((value) {
      studentModel = value;
      isLoading = false;
      return studentModel;
    });
    notifyListeners();
  }
}
