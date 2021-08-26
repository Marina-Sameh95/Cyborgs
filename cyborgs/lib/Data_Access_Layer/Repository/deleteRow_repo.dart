import 'package:cyborgs/Data_Access_Layer/Api/deleteRow_api.dart';


class DeleteRowRepository {
   deleteRow (int rowIndex) async {
    return await DeleteRowApi().deleteRow(rowIndex);
  }
}
