import 'package:flutter/material.dart';
import 'package:testmoi/utils/data/models/user.dart';
import 'package:testmoi/utils/data/repositories/user_data_repository.dart';
import 'package:testmoi/utils/Usable/databaseHelper.dart';


class DataProvider extends ChangeNotifier {
  List<User> users = [];
  setUsersData() async {
    users = await UserRepository.getDataFromDatabase();
    notifyListeners();
  }

  removeUser(User user) async {
    users.remove(user);
    await DatabaseHelper()
        .delete('users', where: 'id = ?', whereArgs: [user.id]);
    notifyListeners();
  }
addUser(User user) async {
    users.add(user);
    await DatabaseHelper().insert("users", user.toJson());
    notifyListeners();
  }
  updateUser(User user) async {
    removeUser(user);
    addUser(user);
    notifyListeners();
  }

  likeUser(User user) async {
    user.favorite = !user.favorite;
    await DatabaseHelper()
        .update("users", user.toJson(), where: 'id = ?', whereArgs: [user.id]);
    notifyListeners();
  }
}
