import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Card_Page extends StatelessWidget {
  const Card_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: const [
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.more_vert_outlined))
        ],
      ),
      body: FutureBuilder<http.Response>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Text(
                                  "Your Card",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                )),
                                Container(
                                    child: Text(
                                  (jsonDecode(snapshot.data!.body.toString())[
                                      0]['Active_Card']),
                                  style: TextStyle(color: Colors.white),
                                )),
                              ],
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.orange),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.blueAccent.shade400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Image.network(
                                        (jsonDecode(snapshot.data!.body
                                                .toString())[0]
                                            ['Card_Chip_IMG']),
                                        width: 40),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                child: Text(
                                    (jsonDecode(snapshot.data!.body
                                        .toString())[0]['Card_Number']),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                (jsonDecode(snapshot.data!.body
                                                        .toString())[0]
                                                    ['User_Name']),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Text("Expiry Date",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white)),
                                          Text(
                                            (jsonDecode(snapshot.data!.body
                                                    .toString())[0]
                                                ['Credite_Date']),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Image.network(
                                              (jsonDecode(snapshot.data!.body
                                                      .toString())[0]
                                                  ['Card_Company']),
                                              width: 80),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Recent Transactions",
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              color: Colors.grey.shade700,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                        child: Icon(
                                      Icons.fastfood_sharp,
                                      color: Colors.grey,
                                      size: 25,
                                    )),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          child: Text(
                                        (jsonDecode(snapshot.data!.body
                                            .toString())[0]['Company1']),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      Container(
                                          child: Text(
                                        (jsonDecode(snapshot.data!.body
                                                .toString())[0]
                                            ['Company1_Date']),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                        child: Text(
                                      (jsonDecode(snapshot.data!.body
                                              .toString())[0]
                                          ['Company1_Amount']),
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              color: Colors.grey.shade700,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                        child: Icon(
                                      Icons.paypal,
                                      color: Colors.grey,
                                      size: 25,
                                    )),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          child: Text(
                                        (jsonDecode(snapshot.data!.body
                                            .toString())[0]['Company2']),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      Container(
                                          child: Text(
                                        (jsonDecode(snapshot.data!.body
                                                .toString())[0]
                                            ['Company2_Date']),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                        child: Text(
                                      (jsonDecode(snapshot.data!.body
                                              .toString())[0]
                                          ['Company2_Amount']),
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              color: Colors.grey.shade700,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                        child: Icon(
                                      Icons.settings_outlined,
                                      color: Colors.grey,
                                      size: 25,
                                    )),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          child: Text(
                                        (jsonDecode(snapshot.data!.body
                                            .toString())[0]['Company3']),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      Container(
                                          child: Text(
                                        (jsonDecode(snapshot.data!.body
                                                .toString())[0]
                                            ['Company3_Date']),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                        child: Text(
                                      (jsonDecode(snapshot.data!.body
                                              .toString())[0]
                                          ['Company3_Amount']),
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ],
                  );

          } else {
            return Center(
              child: CircularProgressIndicator(
                  color: Colors.blue, backgroundColor: Colors.grey),
            );
          }
        },
        future: getDataFromServer(),
      ),
    );
  }
}

Future<http.Response> getDataFromServer() async {
  var response = await http.get(
      Uri.parse("https://6315e12c5b85ba9b11e9d5c5.mockapi.io/Account_Project"));
  return response;
}
