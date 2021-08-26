import 'dart:convert';

import 'package:cyborgs/Data_Access_Layer/Model/postForm_model.dart';
import 'package:cyborgs/Data_Access_Layer/http_client.dart';


class PostFormApi {
  postForm(String name,
  String modelNumber,
  String email,
  String mobile,
  String purchaseDate) async {
    // var body = {
    //   cyborgsForm: {
    //     name,modelNumber,email,mobile,purchaseDate
    //   }
    // }
    var response =
    await HttpClient().post(
        'https://api.sheety.co/35d19ef70a919d2cd590129f12c3899b/cyborgsForm/cyborgsForm',
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(PostForm.toJson(name,modelNumber,email,mobile,purchaseDate)));

  }
}
