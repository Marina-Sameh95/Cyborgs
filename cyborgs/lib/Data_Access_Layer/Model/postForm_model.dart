import 'dart:convert';

class PostForm {
  String name ;
  String modelNumber;
  String email;
  String mobile;
  String purchaseDate;


  PostForm({
    this.name, this.modelNumber,this.email,this.mobile,this.purchaseDate});

  factory PostForm.fromJson(Map<String, dynamic> json) {
    return PostForm(
      name: json['name'] as String,
      modelNumber: json['modelNumber'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      purchaseDate: json['purchaseDate'] as String,
    );
  }

  List<PostForm> parseUser(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<PostForm>((json) => PostForm.fromJson(json)).toList();
  }

  static Map<String, dynamic> toJson(name,modelNumber,email,mobile,purchaseDate) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['modelNumber'] = modelNumber;
    data['email'] = email;
    data['mobile'] = mobile;
    data['purchaseDate'] = purchaseDate;

    return data;
  }
}



