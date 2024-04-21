import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:sunilkulhadiya/screens/select_country.dart';
import 'package:sunilkulhadiya/screens/welcome_screen.dart';

class OTP_Verfy extends StatefulWidget {
  final String UsetType;
  final String SelectedCountryId;
  final String UserMobile;
  final String SelectedCountryCode;
  final BuildContext context;

  const OTP_Verfy({super.key,
    required this.UsetType,
    required this.SelectedCountryId,
    required this.UserMobile,
    required this.SelectedCountryCode,
    required this.context});

  @override
  State<OTP_Verfy> createState() => CreateSList();
}

class CreateSList extends State<OTP_Verfy>{
  var OTPV = false;
  var OTPText = "";

  //--------------------------
  Future<void> ResendOTP() async {
    var body = {
      "phone": widget.UserMobile,
    };
    var jsonBody = json.encode(body);

    // you can replace your api link with this link
    var response = await
    http.post(Uri.parse("https://studylancer.yuktidea.com/api/resend-otp"),
        body: jsonBody,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }
    );
    print("------------------response.body : ${response.body}");
    if (response.statusCode == 200) {
    }
  }
  //--------------------------
  Future<void> OtpVerification() async {
    var body = {
      "code": "4301",
      "phone": "+919876543210",
    };
    var jsonBody = json.encode(body);

    // you can replace your api link with this link
    var response = await
    http.post(Uri.parse("https://studylancer.yuktidea.com/api/verify-otp"),
        body: jsonBody,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }
    );
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            Select_Country(UsetType: "",
              SelectedCountryCode: "",
              SelectedCountryFlage: "",
              SelectedCountryId: "",
              context: context,)
    ));

    print("------------------response.body : ${response.body}");
    if (response.statusCode == 200) {
    }
  }
  //--------------------------
  @override
  Widget build(BuildContext context) {
    final double DW = MediaQuery.of(context).size.width;
    final double DH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: DW,
        color: HexColor("#292929"),
        child: CustomScrollView(
        slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, DH * 0.05, DW * 0.86, 0),
          child: GestureDetector(
          onTap: (){
          Navigator.of(context).pop();
          },
          child: Container(
            width: DW / 10,
            height: DW / 9,
          alignment: Alignment.center,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black,
          boxShadow: [
          BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 6.0,
          ),
          ],
          ),
          child: Icon(Icons.arrow_back_ios, size: 30, color: Colors.white,),
          ),
        ),
        ),
        ),
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            child: Text("Verify Number",
            style: TextStyle(color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400),),
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              child: Text("Please enter the OTP received to",
              style: TextStyle(color: HexColor("#D9896A"),
              fontSize: 14,
              fontWeight: FontWeight.w400),),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              child: Text("verify your number",
              style: TextStyle(color: HexColor("#D9896A"),
              fontSize: 14,
              fontWeight: FontWeight.w400),),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: DW,
              margin: EdgeInsets.fromLTRB(0, DH * 0.2, 0, 0),
              child: OtpTextField(
                textStyle: TextStyle(color: Colors.white),
                numberOfFields: 6,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: false,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                 setState(() {
                   OTPText = OTPText+code;
                   print("----------------OTP : ${OTPText}");
                 });
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, DH * 0.1, 0, 0),
              child: Text("Didn’t receive OTP?", style: TextStyle(
              color: HexColor("#F9D3B4"),
              fontWeight: FontWeight.w400,
              fontSize: 14),),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: GestureDetector(
              onTap: (){
                ResendOTP();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Again send otp on Mobile"),
                    elevation: 10,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(5),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, DH * 0.02, 0, 0),
                alignment: Alignment.center,
                child: Text("Resend OTP", style: TextStyle(
                color: HexColor("#F9D3B4"),
                fontWeight: FontWeight.w600,
                fontSize: 18
                ),),
              ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: GestureDetector(
                onTap: (){
                  if(OTPText.length == 6) {
                    OtpVerification();
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter correct OTP"),
                        elevation: 10,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(5),
                      ),
                    );
                  }
                },
                child: Container(
                  height: DW / 8,
                  margin: EdgeInsets.fromLTRB(DW * 0.3, DH * 0.05, DW * 0.3, 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: HexColor("#212426"),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  ),
                  child: Text("Verify", style: TextStyle(
                  color: HexColor("#F9D3B4"),
                  fontWeight: FontWeight.w400,
                  fontSize: 18
                  ),),
                ),
              ),
            ),
          ),

        ]
        ),
      ),
    );
  }
} //CreateSList