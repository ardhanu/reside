import 'package:hive/hive.dart';
import 'package:reside/models/user_data.dart';

class DataService {
  static const String _boxName = 'userDataBox';
  late Box<UserData> _box;

  Future<void> init() async {
    _box = await Hive.openBox<UserData>(_boxName);
  }

  Future<void> addData(UserData data) async {
    await _box.add(data);
  }

  List<UserData> getAllData() {
    return _box.values.toList();
  }

  Future<void> deleteData(String id) async {
    final index = _box.values.toList().indexWhere((data) => data.id == id);
    if (index != -1) {
      await _box.deleteAt(index);
    }
  }

  Future<void> updateData(UserData data) async {
    final index = _box.values.toList().indexWhere((d) => d.id == data.id);
    if (index != -1) {
      await _box.putAt(index, data);
    }
  }
}
