import 'package:flutter/material.dart';
import 'package:quotesapp/QuotesProvider.dart/quotesProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<quotesprovider>().FetchQuotesApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<quotesprovider>(builder: (context, quotess, child) {
      return (quotess.qouteslist.length == 0)
          ? Container(
              child: Center(child: Text("Loading...")),
            )
          : Container(
              color: Color(0xFFEEEFF5),
              child: ListView.builder(
                  itemCount: quotess.qouteslist.length,
                  itemBuilder: (BuildContext, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Center(
                                  child: Column(
                                children: [
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          quotess.qouteslist[index]!.q,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))),
                                  Text("- " + quotess.qouteslist[index].a!),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          quotess.FavouriteQuotes(
                                              quotess.qouteslist[index].q);
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
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          quotess.share(
                                              quotess.qouteslist[index].q);
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
                                ],
                              ))),
                        ),
                      ),
                    );
                  }),
            );
    });
  }
}
