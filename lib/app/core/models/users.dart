import 'package:gs_two/app/core/models/image_model.dart';
import 'package:gs_two/app/core/models/name.dart';

class Users {
  Name? name;
  String? email;
  ImageModel? image;
  String? gender;

  Users({this.name, this.email, this.image, required this.gender});

  Users.fromJson(Map<String, dynamic> json){
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    email = json['email'];
    image = json['picture'] != null ? ImageModel.fromJson(json['picture']) : null;
    gender = json['gender'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['picture'] = this.image;
    data['gender'] = this.gender;
    return data;
  }
}