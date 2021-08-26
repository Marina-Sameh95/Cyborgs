import 'package:cyborgs/Provider/getForm_provider.dart';
import 'package:cyborgs/Provider/postForm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class ListFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<GetFormProvider>(
        create: (_) => GetFormProvider(),
        child: _ListFormScreenProviderBody(),
      ),
    );
  }
}

class _ListFormScreenProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListFormScreenProviderBodyState();
  }
}

class _ListFormScreenProviderBodyState extends State<_ListFormScreenProviderBody> {
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<GetFormProvider>(
        builder: (_, GetFormProvider myProvider, child) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: myProvider.isFetching
                ? Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(250, 81, 182, 136),
                )):
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ClipPath(
                          clipper:
                          CustomShape(), // this is my own class which extendsCustomClipper
                          child: Container(
                            height: 150,
                            color: Color.fromARGB(250, 81, 182, 136),
                          ),
                        ),
                        Positioned(
                            left: 20,
                            top: 30,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.grey[700],
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30))),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Container(
                                  child: Text(
                                    'My cards',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20),
                      child:
                      SizedBox(
                        height: MediaQuery.of(context).size.height/1.3,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: myProvider.getFormData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width/1.12,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          border: Border.all(
                                              width: 2, color: Colors.grey)),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 10),
                                          ///name
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.person,size: 20,color:Color.fromARGB(250, 81, 182, 136)),
                                                SizedBox(width: 5,),
                                                Text(
                                                  myProvider.getFormData[index].name,
                                                  style: GoogleFonts.roboto(
                                                      textStyle:TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w500)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          ///number
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.format_list_numbered,size: 20,color:Color.fromARGB(250, 81, 182, 136)),
                                                SizedBox(width: 5,),
                                                Text(
                                                  myProvider.getFormData[index].modelNumber.toString(),
                                                  style: GoogleFonts.roboto(
                                                      textStyle:TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w500)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          ///email
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.email_outlined,size: 20,color:Color.fromARGB(250, 81, 182, 136)),
                                                SizedBox(width: 5,),
                                                Text(
                                                  myProvider.getFormData[index].email,
                                                  style: GoogleFonts.roboto(
                                                      textStyle:TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w500)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          ///mobile
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.phone_android,size: 20,color:Color.fromARGB(250, 81, 182, 136)),
                                                SizedBox(width: 5,),
                                                Text(
                                                 '+20 '+ myProvider.getFormData[index].mobile.toString(),
                                                  style: GoogleFonts.roboto(
                                                      textStyle:TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w500)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ///date
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.calendar_today_outlined,size: 20,color:Color.fromARGB(250, 81, 182, 136)),
                                                    SizedBox(width: 5,),
                                                    Text(
                                                      myProvider.getFormData[index].purchaseDate,
                                                      style: GoogleFonts.roboto(
                                                          textStyle:TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w500)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ///delete
                                              Container(
                                                width:
                                                MediaQuery.of(context).size.width /4,
                                                height: 30,
                                                child: MaterialButton(
                                                  color: Colors.red[400],
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                    borderRadius: new BorderRadius.all(
                                                        Radius.circular(10)),
                                                  ),
                                                  onPressed: () async {
                                                    myProvider.fetchDeleteRow(myProvider.getFormData[index].id);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.delete_outline_outlined,size: 20,color:Colors.white),
                                                      SizedBox(width: 5,),
                                                      Text(
                                                        'Delete',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),

                                        ],
                                      )),
                                  SizedBox(height: 20),
                                ],
                              );
                            }),
                      ),
                    )

                  ],
                )),
          ));
    });
  }
}
class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}