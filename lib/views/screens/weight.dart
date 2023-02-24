import 'package:flutter/material.dart';
import '../res/global.dart';

class Weight extends StatefulWidget {
  const Weight({Key? key}) : super(key: key);

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 23,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: -200, end: 0),
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 2),
                      builder: (context, val, child) {
                        return Transform.translate(
                          offset: Offset(val, 0),
                          child: TextFormField(
                            onSaved: (val) {
                              setState(() {
                                Global.weight = int.parse(val!);
                              });
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            maxLength: 3,
                            enableSuggestions: true,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter your weight";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(10)),
                              enabled: true,
                              counterText: "",
                              // ignore: prefer_const_constructors
                              labelStyle: const TextStyle(color: Colors.black),
                              hintText: "Enter weight in KGs",
                              hintStyle: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                              label: const Text("Weight"),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    TweenAnimationBuilder(
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      tween: Tween<double>(begin: 200, end: 0),
                      builder: (context, val, widget) {
                        return Transform.translate(
                          offset: Offset(val, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            enableSuggestions: true,
                            onSaved: (val) {
                              setState(() {
                                Global.age = int.parse(val!);
                              });
                            },
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter your age";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(10)),
                              enabled: true,
                              hintText: "Enter age in Year",
                              counterText: "",
                              hintStyle: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                              label: const Text("Age"),
                              labelStyle: const TextStyle(color: Colors.black),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Global.answer = (Global.weight /Global.value /Global.value) * 10000;
                        if (Global.answer <= 18.5) Global.answer1 = "Underweight";
                        if (Global.answer > 18.5 && Global.answer <= 25) Global.answer1 = "Healthy";
                        if (Global.answer > 24.9 && Global.answer <= 30) Global.answer1 = "Overweight";
                        if (Global.answer > 30) Global.answer1 = "Obese";
                        Navigator.pushNamed(context, 'answer');
                      }
                    });
                  },
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 300, end: 0),
                    curve: Curves.easeInOut,
                    duration: const Duration(seconds: 2),
                    builder: (context, offset, widget) => Transform.translate(
                      offset: Offset(0, offset),
                      child: TweenAnimationBuilder(
                        tween: ColorTween(
                            begin: Colors.white, end: Colors.indigo.shade400),
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                        builder: (context, color, widget) {
                          return ColorFiltered(
                            colorFilter:
                                ColorFilter.mode(color!, BlendMode.modulate),
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 300, end: 0),
                  curve: Curves.easeInOut,
                  duration: const Duration(seconds: 2),
                  builder: (context, val, widget) {
                    return Transform.translate(
                      offset: Offset(0, val),
                      child: const Text(
                        "Calculate",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
