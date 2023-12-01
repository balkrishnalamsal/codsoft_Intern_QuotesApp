import 'package:flutter/material.dart';
import 'package:quotesapp/QuotesProvider.dart/quotesProvider.dart';
import 'NavigationScreen/NavigationPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => quotesprovider(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  context.read<quotesprovider>().Refresh();
                },
                child: Icon(Icons.refresh)),
          )
        ],
        centerTitle: true,
        title: Text("Quotes"),
        backgroundColor: Colors.purple,
      ),
      body: NavigationPage(),
    );
  }
}
