import 'package:cyborgs/GUI/listFormScreen.dart';
import 'package:cyborgs/Provider/postForm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class RegisterFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<PostFormProvider>(
        create: (_) => PostFormProvider(),
        child: _RegisterFormScreenProviderBody(),
      ),
    );
  }
}

class _RegisterFormScreenProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormScreenProviderBodyState();
  }
}

class _RegisterFormScreenProviderBodyState extends State<_RegisterFormScreenProviderBody> {
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<PostFormProvider>(
        builder: (_, PostFormProvider myProvider, child) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///logo
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fill,
                        width: 130,
                        height: 130,
                      ),
                    ),
                    ///register form
                    Text(
                      'Register Form',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                        fontSize: 27,
                      )),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ///Full Name
                    Padding(
                      padding: const EdgeInsets.only(left: 20 , right: 20),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,color:Colors.green[100],
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              border: Border.all(width: 2,color:Colors.green[100])),
                          child: new TextFormField(
                            controller: myProvider.nameController ,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: new InputDecoration(
                              hintText: ('Full Name'),
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,

                            ),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    ///Model Number
                    Padding(
                      padding: const EdgeInsets.only(left: 20 , right: 20),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,color:Colors.green[100],
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              border: Border.all(width: 2,color:Colors.green[100])),
                          child: new TextFormField(
                            controller: myProvider.modelNumberController ,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            decoration: new InputDecoration(
                              hintText: ('Model Number'),
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,

                            ),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    ///Email
                    Padding(
                      padding: const EdgeInsets.only(left: 20 , right: 20),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,color:Colors.green[100],
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              border: Border.all(width: 2,color:Colors.green[100])),
                          child: new TextFormField(
                            controller: myProvider.emailController ,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            autovalidate: true,
                            maxLengthEnforced: true,
                            validator: (value) {
                              if (value == null || value == '') {
                              } else {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (!(value.contains(regex))) {
                                  return "Invalid Email";
                                }
                              }
                              return null;
                            },
                            decoration: new InputDecoration(
                              prefixIcon: IconButton(
                                icon: Icon(Icons.mail,color:Color.fromARGB(250, 81, 182, 136) ,) ,
                              ),
                              hintText: ('Email'),
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,

                            ),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    ///Mobile
                    Padding(
                      padding: const EdgeInsets.only(left: 20 , right: 20),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,color:Colors.green[100],
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              border: Border.all(width: 2,color:Colors.green[100])),
                          child: new TextFormField(
                            controller: myProvider.mobileController ,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            autovalidate: true,
                            maxLengthEnforced: true,
                            validator: (value) {
                              if (value.trim().length != 10) {
                                return 'Enter 10 Digit Mobile Number';
                              }
                              return null;
                            },
                            decoration: new InputDecoration(
                              prefixIcon: IconButton(
                                icon: Icon(Icons.phone_android,color:Color.fromARGB(250, 81, 182, 136) ,) ,
                              ),
                              hintText: ('Mobile'),
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,

                            ),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    ///Purchase Date
                    Padding(
                      padding: const EdgeInsets.only(left: 20 , right: 20),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,color:Colors.green[100],
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              border: Border.all(width: 2,color:Colors.green[100])),
                          child: new TextFormField(
                              controller: myProvider.purchaseDateController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^[0-9\-]+$')),
                              ],
                              enabled: true,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              onChanged: (value) {
                                setState(
                                      () {
                                    if (myProvider.checkDate(value)) {
                                      myProvider.typeBirthName = true;
                                      _controller.animateTo(
                                        _controller
                                            .position.maxScrollExtent,
                                        curve: Curves.easeOut,
                                        duration: const Duration(
                                            milliseconds: 250),
                                      );
                                    }
                                  },
                                );
                              },
                              decoration: new InputDecoration(
                                errorText: myProvider.birthDateValidation(myProvider.purchaseDateController.text),
                                suffixIcon: Icon(Icons.edit,color:Color.fromARGB(250, 81, 182, 136) ,),
                                prefixIcon: IconButton(
                                  icon: Icon(Icons.calendar_today,color:Color.fromARGB(250, 81, 182, 136) ,) ,
                                  onPressed: () {
                                    myProvider.selectDate(context).then(
                                          (value) {
                                        setState(
                                              () {
                                            myProvider.typeBirthName = true;
                                            Future.delayed(
                                              Duration(seconds: 1),
                                            ).then(
                                                  (value) =>
                                                  _controller.animateTo(
                                                    _controller.position
                                                        .maxScrollExtent,
                                                    curve:
                                                    Curves.decelerate,
                                                    duration:
                                                    const Duration(
                                                        milliseconds:
                                                        259),
                                                  ),
                                            );
                                            myProvider.purchaseDateController.text = (value.day < 10)
                                                ? "0" +
                                                value.day.toString()
                                                : value.day.toString();
                                            myProvider.purchaseDateController.text += (value.month <
                                                10)
                                                ? "-0" +
                                                value.month
                                                    .toString() +
                                                "-" +
                                                value.year
                                                    .toString()
                                                : "-" +
                                                value.month
                                                    .toString() +
                                                "-" +
                                                value.year
                                                    .toString();
                                            myProvider.purchaseDateController.selection =
                                                TextSelection
                                                    .fromPosition(
                                                  TextPosition(
                                                      offset:
                                                      myProvider.purchaseDateController.text.length),
                                                );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                hintText: ('Purchase Date'),
                                contentPadding: EdgeInsets.all(10.0),
                                hintStyle: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[800],
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w400,
                              ))
                      ),
                    ),
                    SizedBox(height:50),
                    ///submit button
                    Container(
                      width:
                          MediaQuery.of(context).size.width / 1.13,
                      height: 60,
                      child: MaterialButton(
                        color: Color.fromARGB(250, 81, 182, 136),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: new BorderRadius.all(
                              Radius.circular(15)),
                        ),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                        myProvider.fetchPostForm(
                                  myProvider
                                      .nameController.text,
                                  myProvider.modelNumberController
                                      .text,myProvider.emailController.text,
                        myProvider.mobileController.text,myProvider.purchaseDateController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ListFormScreen()));
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ));
    });
  }
}
