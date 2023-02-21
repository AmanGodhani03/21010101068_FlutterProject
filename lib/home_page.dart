import 'package:account_project/card_page.dart';
import 'package:account_project/profile_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Home_pahge extends StatefulWidget {
  const Home_pahge({Key? key}) : super(key: key);

  @override
  State<Home_pahge> createState() => _Home_pahgeState();
}

class _Home_pahgeState extends State<Home_pahge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Colors.black,
        child:
        Row(children: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Profile();
                  },
                )).then((value) {
                  setState(() {});
                });
              },
              child: Icon(Icons.person,color: Colors.grey,size: 50)),
          Text("View Profile",style: TextStyle(color: Colors.white,fontSize: 20),)

        ]),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/boy.jfif"),
              radius: 20,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 5,left: 15),
            child: Text(
              "Your Balance",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return Card_Page();
                },
              )).then((value) {
                setState(() {});
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                color: Colors.grey.shade800,
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jun 14, 2020 \n",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$27,802.05",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Row(children: [
                          Text(
                            "15%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Icon(
                            Icons.arrow_upward_outlined,
                            color: Colors.white,
                          )
                        ]),
                      ),
                    ]),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade800,),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                              Icons.arrow_upward_outlined,
                              color: Colors.pink,
                              size: 40,
                            ),
                                )),
                            Container(
                                child: Text("Send",
                                    style: TextStyle(color: Colors.white)))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade800,),
                      child: Column(
                        children: [
                          Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                            Icons.arrow_downward_outlined,
                            color: Colors.green,
                            size: 40,
                          ),
                              )),
                          Container(
                            child: Text("Receive",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade800,),
                      child: Column(
                        children: [
                          Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                            Icons.local_atm,
                            color: Colors.orangeAccent,
                            size: 40,
                          ),
                              )),
                          Container(
                              child: Text("Loan",
                                  style: TextStyle(color: Colors.white)))
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade800,),
                      child: Column(
                        children: [
                          Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                            Icons.cloud_upload,
                            color: Colors.blueAccent,
                            size: 40,
                          ),
                              )),
                          Container(
                              child: Text(
                            "Topup",
                            style: TextStyle(color: Colors.white),
                          ))
                        ],
                      ),
                    )
                  ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    child: Text(
                  "Activityes",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                    color: Colors.grey.shade800,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          "This Week",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    )),
              )
            ],
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(child: Padding(
                  padding: const EdgeInsets.only(left:60.0,right: 60),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    Text("Jan",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("Fab",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("Mar",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("Apr",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("May",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("Jun",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                  ]),
                ),),
                Container(child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ChartSection(),
                  ],
                ),
                )
          ]),

        ],
      ),
    );
  }
}

class ChartSection extends StatelessWidget {
  const ChartSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 250,
      width: 350,
      child:
        BarChart(BarChartData(backgroundColor: Colors.black,barGroups: [
          BarChartGroupData(
            x:1,barsSpace: 20.15,
            barRods: [
              BarChartRodData(
                toY: 480,
                color: Colors.blue.shade900,
                width: 4,
                borderRadius: BorderRadius.circular(10),
              )
            ],
          ),
          BarChartGroupData(
            x:2,
            barRods: [
              BarChartRodData(
                toY: 901,
                color: Colors.blue.shade900,
                width: 4,
                borderRadius: BorderRadius.circular(10),
              )
            ],
          ),
          BarChartGroupData(
            x:3,
            barRods: [
              BarChartRodData(
                toY: 150,
                color: Colors.blue.shade900,
                width: 4,
                borderRadius: BorderRadius.circular(10),
              )
            ],
          ),
          BarChartGroupData(
            x:4,
            barRods: [
              BarChartRodData(
                toY: 632,
                color: Colors.blue.shade900,
                width: 4,
                borderRadius: BorderRadius.circular(10),
              )
            ],
          ),
          BarChartGroupData(
            x:5,
            barRods: [
              BarChartRodData(
                toY: 745,
                color: Colors.blue.shade900,
                width: 4,
                borderRadius: BorderRadius.circular(10),
              )
            ],
          ),
          BarChartGroupData(
            x:6,
            barRods: [
              BarChartRodData(
                toY: 800,
                color: Colors.blue.shade900,
                width: 4,
                borderRadius: BorderRadius.circular(10),
              )
            ],
          ),
        ],)),
      );
  }
}

