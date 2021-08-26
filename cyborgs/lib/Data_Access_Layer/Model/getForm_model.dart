import 'dart:convert';

class GetFormResponse {
  List <FormData> formData;

  GetFormResponse(
      {
      this.formData,
      });

  factory GetFormResponse.fromJson1(Map<String, dynamic> json) {
    return GetFormResponse(
      formData: json['cyborgsForm'] ,

    );
  }

  fromJson(Map<String, dynamic> json) {
    if (json['cyborgsForm'] != null) {
      formData = new List<FormData>();
      json['cyborgsForm'].forEach((v) {
        formData.add(new FormData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.formData != null) {
      data['cyborgsForm'] = this.formData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FormData{
  String name ;
  int modelNumber;
  String email;
  int mobile;
  String purchaseDate;
  int id;

  FormData({
    this.name, this.modelNumber,this.email,this.mobile,this.purchaseDate,this.id
  });

  FormData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    modelNumber = json['modelNumber'];
    email = json['email'];
    mobile = json['mobile'];
    purchaseDate = json['purchaseDate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['modelNumber'] = this.modelNumber;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['purchaseDate'] = this.purchaseDate;
    data['id'] = this.id;
    return data;
  }
}