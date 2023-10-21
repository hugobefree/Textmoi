import 'package:flutter/material.dart';
import 'package:testmoi/common/Data/DataSQlite.dart'; // Importez le bon fichier
import 'package:testmoi/common/models/model.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key})
      : super(key: key); // Corrigez la signature du constructeur.

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await DatabaseHelper.insertUsersFromAPI();
    _fetchUsersFromDatabase();
  }

void _fetchUsersFromDatabase() async {
  users = await DatabaseHelper().getAllUsers();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Users'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email.toString()),
          );
        },
      ),
    );
  }
}
