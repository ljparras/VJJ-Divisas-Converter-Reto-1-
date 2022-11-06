import 'package:flutter/material.dart';
import "package:get/get.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'VJJ DIVISAS',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: ' VJJ-Divisas Converter '),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
final text_origen = TextEditingController();
final text_destino = TextEditingController();
class objetos{
  final titulo;
  final Icon1;
  final color;

  objetos(this.titulo,  this.Icon1,  this.color);
  
}
//var modena=["USD", "EUR", "COP"];
String op1 = "COP";
String op2 = "USD";

List <String> moneda = <String>["USD", "EUR", "COP"];
List <DropdownMenuItem<String>> moneda2 = <DropdownMenuItem<String>> [
  DropdownMenuItem(
    child: Text("USD"), 
    value: "USD",
    ),
  DropdownMenuItem(
    child: Text("EUR"), 
    value: "EUR",
    ),
  DropdownMenuItem(
    child: Text("COP"), 
    value: "COP",
    ),
];


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
List <objetos> info = <objetos>[
 objetos("1", Icon(Icons.abc), Colors.grey), 
 objetos("2", Icon(Icons.abc), Colors.grey), 
 objetos("3", Icon(Icons.abc), Colors.grey), 
 objetos("4", Icon(Icons.abc), Colors.grey), 
 objetos("5", Icon(Icons.abc), Colors.grey), 
 objetos("6", Icon(Icons.abc), Colors.grey), 
 objetos("7", Icon(Icons.abc), Colors.grey), 
 objetos("8", Icon(Icons.abc), Colors.grey), 
 objetos("9", Icon(Icons.abc), Colors.grey), 
 objetos("0", Icon(Icons.abc), Colors.grey), 
 objetos("Limpiar", Icon(Icons.clear_rounded), Colors.blueAccent), 
 objetos("Calcular", Icon(Icons.calculate), Colors.blueAccent), 
];




  void _incrementCounter() {
    setState(() {
   
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
     
        title: Text(widget.title),
      ),
     body: Padding(padding: EdgeInsets.all(18),
     child: Column(
      children:[
        Row(children: [Text("   De    "),
        //esta es la lista de monedas >> Lista de doble convercion de manera iterativa
        DropdownButton
        (value: op1, items: moneda.map((e) {

          return DropdownMenuItem( value:e, child: Text(e));
        }).toList(),
         onChanged: (String? x){
            setState(() {
              op1 = x.toString();
            });
        }),

        Text("   a   "),
        DropdownButton
        // esta es la lista 2 de monedas  
        (value:  op2, items: moneda2,
         onChanged: (String? x){
          setState(() {
              op2 = x.toString();
            });
        
        }),
        ],),
        TextField(
          controller: text_origen,
          decoration:  InputDecoration(labelText: "De ", hintText: "0"),
        ),
        TextField(
          controller: text_destino,
          decoration:  InputDecoration(labelText: "a ", hintText: "0"),
        ),
        Divider(),
     
        Expanded(child:  GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //Aqui van las columnas
         crossAxisCount: 3,
       ),
       itemCount: info.length,
    
       itemBuilder: (BuildContext context, int index) {
         return Container(
          width: 10,
      
          child: Card(
          color: info[index].color,
          child: ListTile(
            title: Center(
              child: index == 10 || index == 11
              ?info[index].Icon1
              :Text(info[index].titulo, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ), 
            onTap: () {
              print(info[index].titulo);

              if (index < 10 ) {
                  text_origen.text = text_origen.text + info[index].titulo; 
              } else if (index == 10 ){
                text_origen.text = "";
                text_destino.text = "";
              } else {

                if (op1 == "USD" && op2 == "COP"){
                text_destino.text = 
                (double.parse(text_origen.text) * 4.974).toString();

              } 
              else if (op1 == "COP" && op2 == "USD") {
                text_destino.text = 
                (double.parse(text_origen.text) / 4.974).toString();
              }  
              else if (op1 == "EUR" && op2 == "COP") {
                text_destino.text = 
                (double.parse(text_origen.text) * 5074).toString();
              }
              else if (op1 == "COP" && op2 == "EUR") {
                text_destino.text = 
                (double.parse(text_origen.text) / 5074).toString();
              }  
              
               else if (op1 == "EUR" && op2 == "USD") {
                text_destino.text = 
                (double.parse(text_origen.text) * 0.99).toString();
              }

                else if (op1 == "USD" && op2 == "EUR") {
                text_destino.text = 
                (double.parse(text_origen.text) / 0.99).toString();
              }else {
                  text_destino.text = text_origen.text;
              }

              }

              
            },
          ),
          
         ),
       ); 
     },

     ),)

     ],)
     ),
    );
  }
}
