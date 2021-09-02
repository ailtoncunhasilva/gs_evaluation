class Name{
  String? title;
  String? firstName;
  String? lastName;

  Name({this.title, this.firstName, this.lastName});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    firstName = json['first'];
    lastName = json['last'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['first'] = this.firstName;
    data['last'] = this.lastName;
    return data;
  }
}