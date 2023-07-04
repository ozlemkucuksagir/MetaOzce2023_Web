import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../const/constant.dart';

class GeriDonutler extends StatefulWidget {
  const GeriDonutler({super.key});

  @override
  State<GeriDonutler> createState() => _GeriDonutlerState();
}

class _GeriDonutlerState extends State<GeriDonutler> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 150.0),
        child: Expanded(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Padding(
                padding: const EdgeInsets.only(left: 80.0),
                child: Column(children: [buildTabloOlusturma()]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildTabloOlusturma() {
    late final _firestore = FirebaseFirestore.instance;

    CollectionReference geriDonutlerRef = _firestore.collection("feedbacks");
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Geri Dönütler",
                  style: TextStyle(fontSize: 42, color: kPrimaryColor),
                ),
              ],
            ),
          ),
          new Divider(
            color: kPrimaryColor,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: geriDonutlerRef.snapshots(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                if (asyncSnapshot.hasData) {
                  List<DocumentSnapshot> listOfDocumentSnap =
                      asyncSnapshot.data.docs;
                  // print(listOfDocumentSnap[0].get('mobil'));

                  return Column(
                    children: [
                      DataTable(
                        columnSpacing: 30.0,
                        headingRowColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.grey.shade200),
                        columns: [
                          const DataColumn(
                              label: Text(
                            "Yorum Sayısı",
                          )),
                          const DataColumn(label: Text("Otel Puanı (0-5)")),
                          const DataColumn(
                              label: Text("Otel Değerlendirme Notu")),
                          const DataColumn(label: Text("Uygulama Puanı (0-5)")),
                          const DataColumn(
                              label: Text("Uygulama Değerlendirme Notu")),
                        ],
                        rows: [],
                        // rows: _createRows(asyncSnapshot.data),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 125.0),
                            child: Container(
                              width: 124,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: listOfDocumentSnap.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${index + 1}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          )
                                        ]);
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 00.0),
                            child: Container(
                              width: 135,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: listOfDocumentSnap.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            listOfDocumentSnap[index]
                                                .get('rating')
                                                .toString(),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                        ]);
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 00.0),
                            child: Container(
                              width: 184,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: listOfDocumentSnap.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            listOfDocumentSnap[index]
                                                .get('otelDegerlendirme'),
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          )
                                        ]);
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 00.0),
                            child: Container(
                              width: 175,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: listOfDocumentSnap.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            listOfDocumentSnap[index]
                                                .get('otelPuan')
                                                .toString(),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          )
                                        ]);
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 00.0),
                            child: Container(
                              width: 200,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: listOfDocumentSnap.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            listOfDocumentSnap[index]
                                                .get('mobil'),
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                        ]);
                                  }),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                } else if (asyncSnapshot.hasError) {
                  Text("Veri alınamadı.");
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              }),

          const SizedBox(
            height: 40.0,
          ),

          //Now let's set the pagination

          // Row(
          //   children: [
          //     TextButton(
          //       onPressed: () {},
          //       child: const Text(
          //         "1",
          //         style: TextStyle(color: Colors.deepPurple),
          //       ),
          //     ),
          //     TextButton(
          //       onPressed: () {},
          //       child: const Text(
          //         "2",
          //         style: TextStyle(color: Colors.deepPurple),
          //       ),
          //     ),
          //     TextButton(
          //       onPressed: () {},
          //       child: const Text(
          //         "3",
          //         style: TextStyle(color: Colors.deepPurple),
          //       ),
          //     ),
          //     TextButton(
          //       onPressed: () {},
          //       child: const Text(
          //         "See All",
          //         style: TextStyle(color: Colors.deepPurple),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }

  List<DataRow> _createRows(QuerySnapshot snapshot) {
    List<DataRow> newList =
        snapshot.docs.map((DocumentSnapshot documentSnapshot) {
      return new DataRow(cells: [
        DataCell(Text(documentSnapshot.get('mobil').toString())),
      ]);
    }).toList();

    return newList;
  }
}
