import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Bitcoin extends StatefulWidget {

  Bitcoin({super.key});
  @override
  State<Bitcoin> createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {

  String _preco = "0";

  void _recuperarPreco() async{
  var url = Uri.parse("https://blockchain.info/ticker");

  http.Response reponse = await http.get(url);
  Map<String, dynamic> retorno = json.decode(reponse.body);
  setState((){
    _preco = retorno["BRL"]["buy"].toString();
  });

}

  @override
  Widget build(BuildContext context) {
  return Scaffold(
     body: Container(
      padding: EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Image.asset("images/bitcoin.png"),
             SizedBox(height: 40,),
             Text("R\$ $_preco", style: TextStyle(fontSize: 35),),
              SizedBox(height: 20,),
             TextButton(onPressed: (){_recuperarPreco();},
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
              child: const Text("Atualizar", style: TextStyle(fontSize: 20,color: Colors.white),),
              )
          ],
        )
      ),

    ),
  );
}
}