import 'package:flutter/material.dart';
import 'package:untitled/api/authentication.dart';

import 'customer/user.dart';

void main() {
  runApp(GneralShop());
}

class GneralShop extends StatelessWidget {
  const GneralShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "General  Shop",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Authentication authentication =  Authentication() ;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Genral Shop"),

      ),

    body: Container
      (

        child: FutureBuilder(
          future:     authentication.login('mostafaasey25@gmail.com', '1122334455'),
          builder: (BuildContext context  ,  AsyncSnapshot snapshot  )
          {
            return Center()  ;

          } ,


        )
           ,
    )  ,
    );
  }
}
