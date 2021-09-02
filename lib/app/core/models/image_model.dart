class ImageModel{
  String? large;

  ImageModel({this.large});

  ImageModel.fromJson(Map<String, dynamic> json){
    large = json['large'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['large'] = this.large;
    return data;
  }
}