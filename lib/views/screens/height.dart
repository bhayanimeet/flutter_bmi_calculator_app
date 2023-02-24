import 'package:bmi_calculator_app/views/res/global.dart';
import 'package:flutter/material.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({Key? key}) : super(key: key);

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  @override
  void dispose() {
    Global.value = 50;
    super.dispose();
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
                duration: const Duration(seconds: 2),
                tween: Tween<double>(begin: -400, end: 0),
                curve: Curves.easeInOut,
                builder: (context, val, widget) {
                  return Transform.translate(
                    offset: Offset(0, val),
                    child: Theme(
                      data: ThemeData(
                        sliderTheme: SliderThemeData(
                          activeTrackColor: Colors.indigo,
                          thumbColor: Colors.indigo.shade300,
                          trackHeight: 2,
                        ),
                      ),
                      child: Slider(
                        min: 50,
                        max: 250,
                        value: Global.value.toDouble(),
                        divisions: 200,
                        label: "${Global.value.toInt()}",
                        onChanged: (val) {
                          setState(() {
                            Global.value = val.toInt();
                          });
                        },
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 10),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: -200, end: 0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                builder: (context, val, widget) {
                  return Transform.translate(
                    offset: Offset(val, 0),
                    child: Image.asset(
                      (Global.isSelected1 == true)
                          ? 'assets/images/girl2.png'
                          : 'assets/images/boy2.png',
                      height: Global.value + 70,
                    ),
                  );
                }),
            const SizedBox(height: 30),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: -200, end: 0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                builder: (context, val, widget) {
                  return Transform.translate(
                    offset: Offset(val, 0),
                    child: Text(
                      "Height : ${Global.value.toInt()} cm",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 40),
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, 'weight');
                    });
                  },
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 300, end: 0),
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    builder: (context, offset, widget) => Transform.translate(
                      offset: Offset(0, offset),
                      child: TweenAnimationBuilder(
                          curve: Curves.easeInOut,
                          tween: ColorTween(begin: Colors.white, end: Colors.indigo.shade400),
                          duration: const Duration(seconds: 2),
                          builder: (context, color, widget) {
                            return ColorFiltered(
                              colorFilter:
                                  ColorFilter.mode(color!, BlendMode.modulate),
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                  tween: Tween<double>(begin: 300, end: 0),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  builder: (context, val, widget) {
                    return Transform.translate(
                      offset: Offset(0, val),
                      child: const Text(
                        "Next",
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
