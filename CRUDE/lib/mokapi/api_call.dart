import 'dart:convert';
import 'package:api_project/mokapi/insert_user/insert_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ApiCallState extends StatefulWidget {
  const ApiCallState({Key? key}) : super(key: key);

  @override
  State<ApiCallState> createState() => _ApiCallStateState();
}

class _ApiCallStateState extends State<ApiCallState> {
  @override
  Widget build(BuildContext context) {
    print("called");
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            actions: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return insert_page(null);
                      },
                    )).then((value) {
                      if (value == true) {
                        setState(() {});
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ))
            ],
            title: Text("Users",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
            backgroundColor: Colors.black),
        body: FutureBuilder<http.Response>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: jsonDecode(snapshot.data!.body.toString()).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return insert_page(jsonDecode(
                                snapshot.data!.body.toString())[index]);
                          },
                        )).then((value) {
                          if (value == true) {
                            setState(() {});
                          }
                        });
                      },
                      child: Card(
                        color: index % 2 == 0
                            ? Colors.blue.shade200
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                      child: Image.network(jsonDecode(snapshot
                                          .data!.body
                                          .toString())[index]['avatar']),
                                      radius: 20),
                                  Text(
                                      (jsonDecode(snapshot.data!.body
                                              .toString())[index]['name'])
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      (jsonDecode(snapshot.data!.body
                                              .toString())[index]['city'])
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                  Text(
                                      convertdate((jsonDecode(snapshot
                                              .data!.body
                                              .toString())[index]['dob'])
                                          .toString()),
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.only(right: 12.0),
                                  //   child: Icon(Icons.favorite_border,
                                  //       size: 25, color: Colors.pink),
                                  // ),

                                  InkWell(
                                    onTap: () {
                                      showDialog(context: context, builder: (context) {
                                        return AlertDialog(title: Text("delete user data"),actions: [
                                          TextButton(onPressed: (){
                                            Navigator.of(context).pop();
                                          }, child: Text("No")),TextButton(onPressed: (){
                                            DeletUser(jsonDecode(snapshot.data!.body
                                                        .toString())[index]['id'])
                                                    .then((value) {
                                                  setState(() {
                                                    Navigator.of(context).pop();
                                                  });

                                                });
                                          }, child: Text("Yes")),
                                        ],);
                                      },);
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 12.0),
                                      child: Icon(Icons.delete,
                                          color: Colors.red, size: 25),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    size: 20,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                    color: Colors.blue, backgroundColor: Colors.grey),
              );
            }
          },
          future: getDataFromServer(),
        ));
  }
}

String convertdate(savedDateString) {
  try {
    DateTime date =
        DateFormat("yyyy-MM-dd'T'hh:mm:ss.SSS'Z'").parse(savedDateString);
    return DateFormat("dd-mm-yyyy").format(date);
  } catch (e) {
    try {
      DateTime date = DateFormat("dd/mm/yyyy").parse(savedDateString);
      return DateFormat("dd-mm-yyyy").format(date);
    } catch (e) {
      return '';
    }
  }
}

Future<http.Response> getDataFromServer() async {
  var response = await http
      .get(Uri.parse("https://63133fbdb466aa9b0395c1ab.mockapi.io/Users"));
  return response;
}

Future<http.Response> DeletUser(id) async {
  var response1 = await http.delete(
    Uri.parse("https://63133fbdb466aa9b0395c1ab.mockapi.io/Users/$id"),
  );
  return response1;
}

