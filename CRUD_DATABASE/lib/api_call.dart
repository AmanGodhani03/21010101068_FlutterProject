import 'package:crud_database/database/my_database.dart';
import 'package:crud_database/inser_user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApiCallState extends StatefulWidget {
  const ApiCallState({Key? key}) : super(key: key);

  @override
  State<ApiCallState> createState() => _ApiCallStateState();
}

class _ApiCallStateState extends State<ApiCallState> {
  void initState() {
    super.initState();
    MyDatabase().copyPasteAssetFileToRoot();
  }

  @override
  Widget build(BuildContext context) {
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
        body: FutureBuilder<bool>(
          builder: (context, snapshot1) {
            if (snapshot1.hasData) {
              return FutureBuilder<List<Map<String, Object?>>>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return insert_page(snapshot.data![index]);
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            (snapshot.data![index]['UserName'])
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            snapshot.data![index]['City']
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey)),
                                        Text(
                                            convertdate((snapshot.data![index]
                                                    ['DOB']
                                                .toString())),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black)),
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
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title:
                                                      Text("delete user data"),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text("No")),
                                                    TextButton(
                                                        onPressed: () {
                                                          deletedb((snapshot
                                                                          .data![
                                                                      index]
                                                                  ['UserId']))
                                                              .then((value) {
                                                            setState(() {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            });
                                                          });
                                                        },
                                                        child: Text("Yes")),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
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
                future: MyDatabase().getDatafromUserList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                    color: Colors.blue, backgroundColor: Colors.grey),
              );
            }
          },
          future: MyDatabase().copyPasteAssetFileToRoot(),
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

Future<int> deletedb(id) async {
  int userid = await MyDatabase().deletedb(id);
  return userid;
}
