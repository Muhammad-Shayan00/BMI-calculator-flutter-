import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController height_controller_feet = TextEditingController();
  final TextEditingController height_controller_inch = TextEditingController();
  final TextEditingController weight_controller = TextEditingController();
  String mesage='';
  late Color bgcolor=Colors.white70;

  Bmi_calculate(){

    double height_feet = double.tryParse(height_controller_feet.text) ?? 0;
    double height_inch = double.tryParse(height_controller_inch.text) ?? 0;
    double weight = double.tryParse(weight_controller.text) ?? 0;
    double? bmi;


    if (height_feet<=0  || weight<=0){
      mesage = "please enter valid height and weight";
      setState(() {});
      return;
    }

    double totalheightininches=(height_feet * 12) + height_inch;
    double totalheight= totalheightininches * 0.0254;
    bmi= weight / (totalheight * totalheight);


    if(bmi<18.8){mesage="you are underweight";bgcolor=Colors.yellowAccent;}
    else if (bmi<24.999){mesage="you are normal";bgcolor=Colors.green;}
    else if (bmi<29.999){mesage="you are overweight";bgcolor=Colors.orangeAccent;}
    else {mesage="you have Obesity";bgcolor=Colors.red;}

    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),

      body: Center(
        child: Container(
          width: 390,
          color: bgcolor,

          child: Column(
            children: [
              SizedBox(height: 200),
              Container(
                height: 60,
                width: 270,
                child: TextField(
                  controller: height_controller_feet,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    hintText: "height in feet",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2
                      )
                  ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 3
                        )
                    ),
                    suffixText: "feet",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 60,
                width: 270,
                child: TextField(
                  controller: height_controller_inch,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    hintText: "height in inch",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2
                      )
                  ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 3
                        )
                    ),
                    suffixText: "inch",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 60,
                width: 270,
                child: TextField(
                  controller: weight_controller,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    hintText: "weight in kg",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2
                      )
                  ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 3
                        )
                    ),
                    suffixText: "kg",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                print(Bmi_calculate());
              }, child: Text("Calculate BMI")),
              SizedBox(height: 20,),
              Text(mesage,style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20),)

              
              
            ],
          ),
        ),
      ),
    );
  }
}

