import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ykapay/app/screens/settings/lottery/payment.dart';

class LotteryScreen extends StatefulWidget {
  const LotteryScreen({Key? key}) : super(key: key);

  @override
  State<LotteryScreen> createState() => _LotteryScreenState();
}

class _LotteryScreenState extends State<LotteryScreen> {
  List listPicked = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        leading: Icon(Icons.menu_sharp),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '5 numbers',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        5,
                        (index) {
                          return InkWell(
                            onTap: () {
                              listPicked.removeAt(index);
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              height: size.height * 0.14,
                              width: size.width * 0.14,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: listPicked.length > index ? Colors.white : Color.fromARGB(100, 0, 0, 0),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                //listPicked.sort((a, b) => a.listPicked.compareTo(b.listPicked));
                                listPicked.length > index ? listPicked[index].toString() : '',
                                style: TextStyle(
                                  color: Colors.indigoAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '02:41',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          int random(min, max) {
                            return min + Random().nextInt(max - min);
                          }

                          listPicked.clear();
                          for (var i = 0; i < 5; i++) {
                            var ran = random(1, 30);
                            if (listPicked.contains(ran)) {
                              ran = random(1, 30);
                            }
                            listPicked.add(ran);
                          }
                          setState(() {});
                        },
                        child: Icon(
                          Icons.filter_list,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          listPicked.clear();
                          setState(() {});
                        },
                        child: Icon(
                          Icons.zoom_out_map_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: size.width * 0.03,
                    runSpacing: 15,
                    children: [
                      ...List<Widget>.generate(
                        30,
                        (index) {
                          return InkWell(
                            onTap: () {
                              if (listPicked.contains(index + 1)) {
                                listPicked.remove(index + 1);
                              } else if (listPicked.length < 5) {
                                listPicked.add(index + 1);
                              }
                              print(listPicked.length);
                              listPicked.sort((a, b) => a.compareTo(b));
                              setState(() {});
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: listPicked.contains(index + 1) ? Colors.amber : Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  // color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (listPicked.length == 5) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Payment(
                                  list: listPicked,
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: size.height * 0.08,
                          width: size.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: listPicked.length < 5 ? Colors.grey : Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Make a Payment',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
