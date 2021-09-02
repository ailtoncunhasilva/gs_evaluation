import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterHomePageManager extends ChangeNotifier{

  FilterHomePageManager(){
    dropdownGender();
  }

  List<DropdownMenuItem<String>> genderList = [];

  String itemSelected = 'Todos';

  dropdownGender() {
    genderList
        .add(DropdownMenuItem(child: Text('Todos', style: TextStyle(color: Colors.grey[500])), value: 'Todos'));
    genderList
        .add(DropdownMenuItem(child: Text('Masculino'), value: 'male'));
    genderList
        .add(DropdownMenuItem(child: Text('Feminino'), value: 'female'));

  }

  notifyListeners();
}