import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:quotesapp/Model/model.dart';
import 'package:flutter_share/flutter_share.dart';
class quotesprovider extends ChangeNotifier {
  Map quotesmap = {};

  List<ModelQuotes> qouteslist = [];

  List<String> favquote = [];
  int currentIndex = 0;
  int index=0;

  FetchQuotesApi() async {
    http.get(Uri.parse("https://zenquotes.io/api/quotes")).then((value) {
      List list = jsonDecode(value.body);

      list.forEach((element) {
        quotesmap.addAll(element);

        qouteslist.add(ModelQuotes.fromMap(element));
      });

      notifyListeners();
    });
  }

  FavouriteQuotes(String? quotes) {
    favquote.add(quotes!);

    notifyListeners();
  }

  Refresh() {
    qouteslist.clear();

    FetchQuotesApi();
  }






Future<void> share(String quotes) async {
    await FlutterShare.share(
      title: quotes,
      text: quotes,
      linkUrl: 'https://github.com/balkrishnalamsal/codsoft_Intern_QuotesApp',
    
    );
  }



CurrentIndex(){

index=currentIndex;
notifyListeners();

}




}
