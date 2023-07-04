import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../const/constant.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 60.0, left: 60.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //let's add the navigation menu for this project
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
              const SizedBox(
                height: 20.0,
              ),
              //Now let's start with the dashboard main rapports
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.article,
                                  size: 26.0,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                const Text(
                                  "Personeller",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "820 Personel",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.comment,
                                  size: 26.0,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                const Text(
                                  "Geri Dönütler",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "+850 Değerlendirme",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.people,
                                  size: 26.0,
                                  color: Colors.amber,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                const Text(
                                  "Aylık Müşteri Sayısı",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "65.142 Müşteri",
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.monetization_on_outlined,
                                  size: 26.0,
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                const Text(
                                  "Aylık Kazanç Yüzdesi",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "%+16.24",
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Now let's set the article section
              const SizedBox(
                height: 30.0,
              ),

              const SizedBox(
                height: 40.0,
              ),

              //let's set the filter section

              const SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularPercentIndicator(
                      radius: 150.0,
                      lineWidth: 20.0,
                      animation: true,
                      animationDuration: 3000,
                      percent: 0.6,
                      // percent: double.parse(double.parse(
                      //             widget.favoriDoctor['yildizOrtalamasi'])
                      //         .toStringAsFixed(2)) *
                      //     0.2,
                      //userModel.rating,
                      center: new Text(
                        "2.744",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      footer: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new Text(
                          "Günlük Müşteri",
                          style: new TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14.0),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: kPrimaryLightColor,
                    ),
                    CircularPercentIndicator(
                      radius: 150.0,
                      lineWidth: 20.0,
                      animation: true,
                      animationDuration: 3000,
                      percent: 0.5,
                      //cerokozi widget.favoriDoctor['baktigiHastaSayisi'] / 100,
                      //userModel.rating,
                      center: new Text(
                        "₺28.230",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      footer: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new Text(
                          "Günlük Gelir",
                          style: new TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14.0),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: kPrimaryLightColor,
                    ),
                    CircularPercentIndicator(
                      radius: 150.0,
                      lineWidth: 20.0,
                      animation: true,
                      animationDuration: 3000,
                      percent: 0.6,
                      // percent: double.parse(double.parse(
                      //             widget.favoriDoctor['yildizOrtalamasi'])
                      //         .toStringAsFixed(2)) *
                      //     0.2,
                      //userModel.rating,
                      center: new Text(
                        "625",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      footer: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new Text(
                          "Aktif Personel Sayısı",
                          style: new TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14.0),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: kPrimaryLightColor,
                    ),
                  ],
                ),
              ),
              //Now let's add the Table
            ],
          ),
        ),
      ),
    );
  }
}

//  DropdownButton(
//                           hint: const Text("Order by"),
//                           items: [
//                             const DropdownMenuItem(
//                               value: "Date",
//                               child: Text("Date"),
//                             ),
//                             const DropdownMenuItem(
//                               value: "Comments",
//                               child: Text("Comments"),
//                             ),
//                             const DropdownMenuItem(
//                               value: "Views",
//                               child: Text("Views"),
//                             ),
//                           ],
//                           onChanged: (value) {}),