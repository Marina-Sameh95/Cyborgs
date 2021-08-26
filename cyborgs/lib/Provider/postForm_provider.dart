import 'package:cyborgs/Data_Access_Layer/Repository/postForm_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';


class PostFormProvider extends ChangeNotifier{

  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController modelNumberController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController purchaseDateController = new TextEditingController();

  bool typeBirthName = false;
  String birthDateValidation(String value){
    if (value == null || value == '') {
      return null;
    }
    if (!checkDate(value))
      return "    inValid Date";
    return null;

  }

  bool checkDate(String date) {
    bool a=true;
    try{
      if(date.length!=10) {
        a = false;
      }
      if(!date.contains("-")){
        a = false;
      }
      if(DateTime.parse(date.split("-").reversed.join("-")).isAfter(DateTime.now())){
        a = false;
      }
    }catch(_){
      a= false;
      print(date);
    }
    print(a);
    return a;

  }

  Future<DateTime> selectDate(BuildContext context) async {
    DateTime picked = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      borderRadius: 20,
      theme: ThemeData(
        primaryColor: Color.fromARGB(250, 81, 182, 136),
        accentColor: Colors.green[100],
        buttonColor: Color.fromARGB(250, 81, 182, 136),
      ),
    );
    return picked;
  }
  bool isFetching = false;
   fetchPostForm(String name,
       String modelNumber,
       String email,
       String mobile,
       String purchaseDate) async {
    isFetching = true;
     await PostFormRepository().postForm(name,modelNumber,email,mobile,purchaseDate);
    isFetching = false;
    notifyListeners();
  }
}