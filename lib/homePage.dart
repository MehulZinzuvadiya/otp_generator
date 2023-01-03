import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController c1 = TextEditingController();
  List rndnumlist = [];
  List otplist = [];
  int length = 0;
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff15172b),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "OTP Generator",
                style: TextStyle(fontSize: 30, color: Color(0xfff6db87)),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: c1,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Enter OTP Length.",
                    focusColor: Colors.white),
              ),
              SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: () {
                  var v1 = c1.text;
                  int n = int.parse(v1);
                  rndnumlist.clear();
                  setState(() {
                    for (int i = 0; i < n; i++) {
                      var rnd = Random();
                      int rnd_no = rnd.nextInt(9);
                      rndnumlist.add(rnd_no);
                    }
                  });
                  print(n);
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color(0xffffe8b8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xfff6db87),
                          spreadRadius: 2,
                          blurRadius: 5,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Generate OTP",
                      style: TextStyle(color: Color(0xff15172b), fontSize: 28),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 65,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xfff6db87),
                  borderRadius: BorderRadius.circular(20),
                ),
                //use map loop here
                // child: Text(
                //   "$rndnumlist",
                //   style: TextStyle(fontSize: 30, letterSpacing: 2),
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: rndnumlist
                      .asMap()
                      .entries
                      .map((e) => otplist[rndnumlist[e.key]].toList()),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Color(0xffffe8b8),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xfff6db87),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Reset",
                    style: TextStyle(color: Color(0xff15172b), fontSize: 28),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
