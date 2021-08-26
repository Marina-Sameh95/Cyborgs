import 'package:cyborgs/Data_Access_Layer/Model/getForm_model.dart';

import '../http_client.dart';



class GetFormApi {
  Future<GetFormResponse> getForm() async {

    var header = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var response = await HttpClient().get(
      'https://api.sheety.co/35d19ef70a919d2cd590129f12c3899b/cyborgsForm/cyborgsForm',
      headers: header,
    );
    GetFormResponse res = new GetFormResponse();
    res.fromJson(response);
    return res;
  }
}
