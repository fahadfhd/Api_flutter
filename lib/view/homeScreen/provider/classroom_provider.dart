import 'package:students/providers/base_provider.dart';
import 'package:students/services/web_api_services.dart';
import 'package:students/view/homeScreen/model/classroom_model.dart';

class ClassroomProvider extends BaseProvider {
  ClassroomProvider() : super(name: "classroomProvider");

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

  ClassroomModel? classroomModel;
  Future<ClassroomModel?> loadClassroom() async {
    isLoading = true;
    await WebAPIServices().loadClassroom().then((value) {
      classroomModel = value;
      isLoading = false;
      return classroomModel;
    });
  }
}
