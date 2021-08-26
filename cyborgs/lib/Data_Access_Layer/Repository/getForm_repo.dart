import 'package:cyborgs/Data_Access_Layer/Api/getForm_api.dart';
import 'package:cyborgs/Data_Access_Layer/Model/getForm_model.dart';

class GetFormRepository {
  Future<GetFormResponse> getForm() async {
    return await GetFormApi().getForm();
  }
}
