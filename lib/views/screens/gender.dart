import 'package:flutter/material.dart';

import '../res/global.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  Color myColor = Colors.white;
  Color myColor1 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          "Bmi Calculator",
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  myColor = Colors.grey.shade200;
                  myColor1 = Colors.white;
                  Global.isSelected = true;
                  Global.isSelected1 = false;
                  Global.gender = "Male";
                });
              },
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: -200, end: 0),
                curve: Curves.easeInOut,
                duration: const Duration(seconds: 1),
                builder: (context, val, child) {
                  return Transform.translate(
                    offset: Offset(val, 0),
                    child: Container(
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: myColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(1, 1),
                            blurRadius: 5,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/boy.png',
                            height: 140,
                            width: 140,
                          ),
                          const Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  myColor1 = Colors.grey.shade200;
                  myColor = Colors.white;
                  Global.isSelected1 = true;
                  Global.isSelected = false;
                  Global.gender = "Female";
                });
              },
              child: TweenAnimationBuilder(
                duration: const Duration(seconds: 1),
                tween: Tween<double>(begin: 200, end: 0),
                curve: Curves.easeInOut,
                builder: (context, val, widget) {
                  return Transform.translate(
                    offset: Offset(val, 0),
                    child: Container(
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: myColor1,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(1, 1),
                            blurRadius: 5,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/girl.png',
                            height: 140,
                            width: 140,
                          ),
                          const Text(
                            "Female",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (Global.isSelected == true ||
                          Global.isSelected1 == true) {
                        Navigator.pushNamed(context, 'height');
                      } else {
                        const snackBar = SnackBar(
                            backgroundColor: Colors.blue,
                            content: Text("Select Gender"),
                            duration: Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                  },
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 100,end: 0),
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    builder: (context,offset,widget) => Transform.translate(
                      offset: Offset(0,offset),
                      child: TweenAnimationBuilder(
                          tween: ColorTween(
                              begin: Colors.white, end: Colors.indigo.shade400),
                          duration: const Duration(seconds: 2),
                          curve: Curves.easeInOut,
                          builder: (context, color, widget) {
                            return ColorFiltered(
                              colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 100,end: 0),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  builder: (context,val, widget) {
                    return Transform.translate(
                      offset: Offset(0,val),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
