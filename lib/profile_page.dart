import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              (jsonDecode(snapshot.data!.body.toString())[0]
                                  ['User_Image'])),
                          radius: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          (jsonDecode(snapshot.data!.body.toString())[0]
                              ['User_Name']),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          (jsonDecode(snapshot.data!.body.toString())[0]
                              ['Person_degree']),
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                      Card(
                        color: Colors.black,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        child: Icon(
                                            Icons.corporate_fare_outlined,
                                            color: Colors.grey,
                                            size: 40),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        child: Text(
                                            (jsonDecode(snapshot.data!.body
                                                    .toString())[0]
                                                ['Profile_fild1']),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        child: Icon(Icons.local_police,
                                            color: Colors.grey, size: 40),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        child: Text(
                                            (jsonDecode(snapshot.data!.body
                                                    .toString())[0]
                                                ['Profile_fild2']),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        child: Icon(Icons.shopping_cart,
                                            color: Colors.grey, size: 40),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        child: Text(
                                            (jsonDecode(snapshot.data!.body
                                                    .toString())[0]
                                                ['Profile_fild3']),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        child: Icon(Icons.home_work,
                                            color: Colors.grey, size: 40),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        child: Text(
                                            (jsonDecode(snapshot.data!.body
                                                    .toString())[0]
                                                ['Profile_fild4']),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        child: Icon(
                                            Icons.settings_suggest_outlined,
                                            color: Colors.grey,
                                            size: 40),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        child: Text(
                                            (jsonDecode(snapshot.data!.body
                                                    .toString())[0]
                                                ['Profile_fild5']),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        child: Icon(Icons.thumb_up,
                                            color: Colors.grey, size: 40),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        child: Text(
                                            (jsonDecode(snapshot.data!.body
                                                    .toString())[0]
                                                ['Profile_fild6']),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
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
