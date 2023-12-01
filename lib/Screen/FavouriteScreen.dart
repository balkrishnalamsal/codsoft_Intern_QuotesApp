import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesapp/QuotesProvider.dart/quotesProvider.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEFF5),
      child: Consumer<quotesprovider>(builder: (context, quote, child) {
        return (quote.favquote.length == 0)
            ? Container(
                child: Center(
                    child: Text("No favourite quote available right now")),
              )
            : ListView.builder(
                itemCount: quote.favquote.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: (quote.favquote.length == 0)
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Favourite Quotes not available"),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(quote.favquote[index].toString()),
                                    GestureDetector(
                                        onTap: () {
                                          quote.share(
                                              quote.favquote[index]);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 2,
                                                offset: Offset(0, 0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.share_rounded,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                      ),
                    ),
                  );
                });
      }),
    );
  }
}
