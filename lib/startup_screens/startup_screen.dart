import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:sunilkulhadiya/startup_screens/terms_conditions.dart';
import 'package:sunilkulhadiya/login/countrylist.dart';

class StartupScreen extends StatefulWidget {

  const StartupScreen({
    super.key,
  });
  @override
  State<StartupScreen> createState() => CreateSList();
}

class CreateSList extends State<StartupScreen>{

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final double DW = MediaQuery.of(context).size.width;
    final double DH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
          child: SafeArea(
            child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Container(
                      height: DH,
                      width: DW,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/yuktidea.gif'),
                          // image: NetworkImage("https://s3-alpha-sig.figma.com/img/a732/57f8/2d5405a39fc1b02dfaa354b050d74e01?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=A8rwAX56hmGmkTvaUE82dlpvrLjdjnIpw~V5sgiJciGGL5hcXyLQioPQPmpLrrdQ6CSqHOfapj9nTx05s9AJLHcc7JocwSto-GzfeLmtuItyOZUJco6aWgO6dKRTaoOqHlz-7pa4wpe084msbOZY~T0tUSrLRphOseov7cMRUUxnFzpHMisU-1um1DO4ZktSOmu~kP6-VK32Fj9PKi9CdI73-aC4PDrj-WYrC-nXypWcXXdoNK722hlYs~x8qZqR5yhvERifWXBRrEHXHaRD64ER6BrP0RyNkw7zCueTMgWTk2fBD1PFLUhw~sYWL0QafCrwK5f5tnvqVXVLMi-3qg__"),
                          fit: BoxFit.fill,
                        )
                      ),
                      margin: EdgeInsets.all(0.0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, DH/1.8, 0, 0),
                        decoration: BoxDecoration(
                          color: HexColor("#292929"),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text("Welcome to Study Lancer",
                                style: TextStyle(color: Colors.white, fontSize: 24,
                                  fontWeight: FontWeight.w600),),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text("Please select your role to get registered",
                                style: TextStyle(color: Colors.white, fontSize: 14,),
                              ),
                            ),
                            Container(
                              width: DW * 0.93,
                              alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.fromLTRB(29, 5, 0, 0),
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: HexColor("#272727"),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        CountryList(UsetType: "Student",
                                                            context: context)
                                                ));
                                              },
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: SizedBox.fromSize(
                                                    size: Size.fromRadius(68), // Image radius
                                                    child: Image.asset('assets/images/student.png', fit: BoxFit.cover),
                                                  ),
                                                )
                                            )
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                          child: Text("Student", style: (
                                              TextStyle(fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)),),
                                        ),
                                      ],
                                    )
                                  ),

                                  Container(
                                      child: Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.fromLTRB(29, 5, 0, 0),
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: HexColor("#272727"),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: GestureDetector(
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          CountryList(UsetType: "Agent",
                                                              context: context)));                                              },
                                               child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: SizedBox.fromSize(
                                                  size: Size.fromRadius(68), // Image radius
                                                  child: Image.asset('assets/images/image1.jpg', fit: BoxFit.cover),
                                                ),
                                              ),
                                              ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                            child: Text("Agent", style: (
                                                TextStyle(fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white)),),
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              )
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text("By continuing you agree to our ", style: (
                                        TextStyle(fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),),
                                  ),
                                  Container(
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) =>
                                                Terms_Conditions(
                                                    WebUrl: "https://studylancer.yuktidea.com/api/terms-conditions",
                                                    Title: "Terms & Conditions", context: context)
                                        ));
                                      },
                                      child: Text("Terms and Conditions", style: (
                                          TextStyle(fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: HexColor("#D9896A"))),),
                                    ),
                                  ),
                                ],
                              )
                            ),

                          ],
                        )
                      ),

                    ),
                  ),
                  SliverToBoxAdapter(
                  ),

                  //---------------
                ]
            ),
          ),
        ),
    );
  }
//------------------------------------------
} //CreateSList