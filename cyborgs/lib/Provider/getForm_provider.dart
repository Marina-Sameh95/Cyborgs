import 'package:cyborgs/Data_Access_Layer/Model/getForm_model.dart';
import 'package:cyborgs/Data_Access_Layer/Repository/deleteRow_repo.dart';
import 'package:cyborgs/Data_Access_Layer/Repository/getForm_repo.dart';
import 'package:flutter/cupertino.dart';

class GetFormProvider extends ChangeNotifier{
  GetFormProvider(){
    fetchGetFormData();
  }
  bool isFetching = false;
  List<FormData> getFormData = [];
  Future<GetFormResponse> fetchGetFormData() async {
    isFetching = true;
    notifyListeners();
    GetFormResponse res = await GetFormRepository().getForm();
    getFormData = res.formData ;
    isFetching = false;
    notifyListeners();
    return res;

  }

  bool isFetching1 = false;
  fetchDeleteRow(int rowIndex) async {
    isFetching1 = true;
    notifyListeners();
  await DeleteRowRepository().deleteRow(rowIndex);
    isFetching1 = false;
    fetchGetFormData();
    notifyListeners();
  }
}