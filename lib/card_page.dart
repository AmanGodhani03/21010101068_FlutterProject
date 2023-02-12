import 'package:flutter/material.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                      "You Have Three Active Card",
                      style: TextStyle(color: Colors.white),
                    )),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 28,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.blue.shade900,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset(
                            "assets/images/kisspng-electronic-component-electronics-integrated-circui-electronic-components-mobile-phone-chip-material-5a82d36349eb37.6089975615185232353028.png",
                            width: 100),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      child: Text("4562 1122 4595 7852",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: Column(
                              children: [
                                Text("Ghulam",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                Text("Expiry Date",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                Text(
                                  "24/2021",
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
                                Image.asset("images/mastercard-26132.png",
                                    width: 80),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
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
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Card(
              color: Colors.grey.shade700,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        "KFC",
                        style: TextStyle(color: Colors.white),
                      )),
                      Container(
                          child: Text(
                        "June 26",
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        child: Text(
                      '+\$2,010',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.grey.shade700,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        "Paypal",
                        style: TextStyle(color: Colors.white),
                      )),
                      Container(
                          child: Text(
                        "June 28",
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        child: Text(
                      '+\$12,010',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.grey.shade700,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        "Car Repair",
                        style: TextStyle(color: Colors.white),
                      )),
                      Container(
                          child: Text(
                        "Aug 12",
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        child: Text(
                      '+\$232,010',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
