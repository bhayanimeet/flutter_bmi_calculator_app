import 'package:flutter/material.dart';

import '../res/global.dart';

class Answer extends StatefulWidget {
  const Answer({Key? key}) : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 28,
          ),
        ),
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
          children: [
            const SizedBox(height: 100),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: -400, end: 0),
              curve: Curves.easeInOut,
              duration: const Duration(seconds: 2),
              builder: (context, val, widget) => Transform.translate(
                offset: Offset(val, 0),
                child: Column(
                  children: [
                    const Text(
                      "Your body Mass Index (BMI)",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Height : ${Global.value}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Gender : ${Global.gender}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Age : ${Global.age}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Weight : ${Global.weight}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            TweenAnimationBuilder(
              tween: ColorTween(begin: Colors.white, end: Colors.black),
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 3500),
              builder: (context, val, widget) => ColorFiltered(
                colorFilter: ColorFilter.mode(val!, BlendMode.modulate),
                child: Column(
                  children: [
                    Text(
                      "BMI : ${Global.answer.toString().substring(0, 7)}",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                        color: val,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      Global.answer1,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: val,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 300, end: 0),
              curve: Curves.easeInOut,
              duration: const Duration(seconds: 2),
              builder: (context, val, widget) => Transform.translate(
                offset: Offset(0, val),
                child: SizedBox(
                  height: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Underweight          < 18.5",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Healthy                    18.5 - 25",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Overweight             25 - 30",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Obese                      > 30",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
