import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home:MyHomePage()
   );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  String text='';
  String? error;
  String converted='';

  Widget build(BuildContext context){
    return Scaffold(
        appBar:AppBar(
            title: const Text(
                'Currency convertor',
                style:TextStyle(color: Colors.white)
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
        body:Container(
            height:400,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                      "https://media.istockphoto.com/id/1171301437/ro/fotografie/unele-bancnote-de-leu-rom%C3%A2ne%C8%99ti-mixte-indic%C3%A2nd-economie-%C3%AEn-cre%C8%99tere-cu-copyspace.jpg?s=612x612&w=is&k=20&c=9ohR4Pfn9sEQNJ6d1z4oYyuRt-gxcVDV2aBdSGevZjs="
                      ,fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20,left: 20,bottom: 20),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: "enter the amount in EUR",
                      errorText:error,
                      contentPadding: const EdgeInsets.all(5),
                    ),
                    onChanged: (String value){
                      setState(() {
                        text=value;
                      });
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    final double? number=double.tryParse(text);
                    setState(() {
                      if(number==null){
                        error="please enter a number";
                        converted='';
                      }
                      else{
                        error=null;
                        converted=(number*0.2).toStringAsFixed(2);
                      }
                    });
                  },
                  child:const Text(
                      "CONVERT!",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  converted!=''?'$converted RON':'',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                )
              ],
            ),
        )
    );
  }
}
