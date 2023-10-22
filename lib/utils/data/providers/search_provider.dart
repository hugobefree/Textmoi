import 'package:flutter/material.dart';
import 'package:testmoi/utils/data/models/user.dart';


class SearchProvider extends ChangeNotifier{
  String parameter = " ";
  String filter = "name";
  List<User> searchResults = [];
  List listOfSearchFilters = [
    "name",
    "gender",
    "phone",
    "city",
    "email",
    "country"
  ];
  setParameter(String newParameter){
    parameter = newParameter;
    notifyListeners();
  }
  setFilter(String newFilter){
    filter = newFilter;
    notifyListeners();
  }
  setResults(List<User> results){
    searchResults = results;
    notifyListeners();
  }
}