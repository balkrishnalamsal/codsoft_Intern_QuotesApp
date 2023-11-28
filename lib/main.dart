import 'package:flutter/material.dart';
import 'package:quotesapp/QuotesProvider.dart/quotesProvider.dart';
import 'NavigationScreen/NavigationPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  
ChangeNotifierProvider(create: (_)=>quotesprovider(),
child: MaterialApp(
  debugShowCheckedModeBanner: false,
  
  home: MyApp()),

)

 );
  

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Quotes"),
        backgroundColor: Colors.purple,
      ),
        body: NavigationPage(),
      );
  
  }
}