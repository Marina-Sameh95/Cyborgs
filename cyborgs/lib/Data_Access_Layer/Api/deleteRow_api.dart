import 'package:cyborgs/Data_Access_Layer/http_client.dart';


class DeleteRowApi {
   deleteRow(int rowIndex) async {

    var header = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    };

    var response = await HttpClient().delete(
      'https://api.sheety.co/35d19ef70a919d2cd590129f12c3899b/cyborgsForm/cyborgsForm/'+rowIndex.toString(),
      headers: header,
    );


  }
}
