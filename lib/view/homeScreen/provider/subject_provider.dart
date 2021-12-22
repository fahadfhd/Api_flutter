import 'package:students/providers/base_provider.dart';
import 'package:students/services/web_api_services.dart';
import 'package:students/view/homeScreen/model/subject_model.dart';

class SubjectProvider extends BaseProvider {
  SubjectProvider() : super(name: "SubjectProvider");

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

  List<String> _dropDownValueList = [];
  List<String> get dropDownValueList => _dropDownValueList;

  set dropDownValueList(List<String> value) {
    _dropDownValueList = value;
    notifyListeners();
  }

  SubjectModel? subjectModel;
  Future<SubjectModel?> loadSubject() async {
    isLoading = true;
    await WebAPIServices().loadSubject().then((value) {
      subjectModel = value;
      isLoading = false;
      return subjectModel;
    });
    notifyListeners();
  }
}
