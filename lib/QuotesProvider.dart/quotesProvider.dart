import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:quotesapp/Model/model.dart';

class quotesprovider extends ChangeNotifier {
  Map quotesmap = {};

  List<model> qouteslist=[];

  FetchQuotesApi() async {
    http.get(Uri.parse("https://zenquotes.io/api/quotes")).then((value) {
      List list = jsonDecode(value.body);

      list.forEach((element) {
        quotesmap.addAll(element);


      qouteslist.add(model(element["q"], element["a"]));

    
      });

      notifyListeners();
    });
  }
}
