import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gs_two/app/core/models/users.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePageManager extends ChangeNotifier {

  HomePageManager() {
    getUsers();
  }

  List<Users> usersList = [];

  String _gender = 'Todos';

  String get gender => _gender;

  set gender(String value) {
    _gender = value;

    notifyListeners();
  }

  List<Users> get filterUsers{
    final List<Users> filterUsers = [];

    if(gender == 'Todos'){
      filterUsers.addAll(usersList);
    } else if(gender.isNotEmpty && gender == 'female'){
      filterUsers.addAll(usersList.where((f) => f.gender!.contains(gender)));
    } else if(gender.isNotEmpty && gender == 'male'){
      filterUsers.addAll(usersList.where((m) => m.gender == 'male'));
    }

    return filterUsers;

  }

  Future<void> getUsers() async {
    
    var url = Uri.parse(
      'https://randomuser.me/api/?format=json&page=&results=15&inc=&gender,name,email,picture&nat=br');
    
    final request = await http.get(url);

    String fileName = 'path.json';
    var dir = await getTemporaryDirectory();

    File file = File(dir.path + '/' + fileName);

    if (file.existsSync() && request.statusCode != 200) {
      final data = file.readAsStringSync();
      Iterable resp = json.decode(data)['results'];

      usersList = resp.map((u) => Users.fromJson(u)).toList();
    } else {
      if (request.statusCode == 200) {
        var body = request.body;

        file.writeAsStringSync(body, flush: true, mode: FileMode.write);
        Iterable response = json.decode(body)['results'];
        
        usersList += response.map((e) => Users.fromJson(e)).toList();

      } else {
        return json.decode(request.body);
      }
    }
    notifyListeners();
  }
 
}
