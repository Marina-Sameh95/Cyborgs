import 'package:cyborgs/Data_Access_Layer/Api/postForm_api.dart';

class PostFormRepository {
  postForm(String name,
      String modelNumber,
      String email,
      String mobile,
      String purchaseDate) async {
    return await PostFormApi().postForm(name,modelNumber,email,mobile,purchaseDate);
  }
}
