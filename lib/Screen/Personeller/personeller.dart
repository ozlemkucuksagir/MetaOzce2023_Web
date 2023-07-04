import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import '../../const/constant.dart';

class Personeller extends StatefulWidget {
  const Personeller({super.key});

  @override
  State<Personeller> createState() => _PersonellerState();
}

bool isExpanded = false;

class _PersonellerState extends State<Personeller> {
  List<Map<String, dynamic>> medCat = [
    {"icon": FontAwesomeIcons.userDoctor, "category": "Ahmet Karaman"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Kerem Dadak"},
    {"icon": FontAwesomeIcons.hand, "category": "Mehmet Sakin"},
    {"icon": FontAwesomeIcons.lungs, "category": "Ayşe Yenilmez"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Kerem Dadak"},
    {"icon": FontAwesomeIcons.hand, "category": "Mehmet Sakin"},
    {"icon": FontAwesomeIcons.lungs, "category": "Ayşe Yenilmez"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Kerem Dadak"},
    {"icon": FontAwesomeIcons.hand, "category": "Mehmet Sakin"},
    {"icon": FontAwesomeIcons.lungs, "category": "Ayşe Yenilmez"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Kerem Dadak"},
    {"icon": FontAwesomeIcons.hand, "category": "Mehmet Sakin"},
    {"icon": FontAwesomeIcons.lungs, "category": "Ayşe Yenilmez"}
  ];
  List<String> cinsiyetler = ["Erkek", "Kadın"];
  List<String> kategoriler = [
    "Havuz",
    "Oda Servisi",
    "Yemek Servisi",
    "Temizlik"
  ];
  List<Map<String, dynamic>> otelListesi = [
    {
      "username": "WomeDeluxe",
      "adi": 'Wome Deluxe',
      'resmi':
          'https://cdn.halalstatic.com/2021/05/18/14/56/16/13868f41-4f24-4b5a-99f8-3ce90d962a64/15618_KFC2dYWmrebQNwkAexgEBw.jpg?fit=bounds&width=750'
    },
    {
      "userName": "StarlightOtel",
      "adi": 'Starlight Otel',
      'resmi':
          'https://www.otelfiyat.com/media/inet/3874755353/buyuk/VDGHPG1569920413.jpg'
    },
  ];

  late bool loading = true;

  String ad = "";

  int yas = 0;

  String soyad = "";

  String dogumTarihiString = "Doğum tarihi seçiniz";

  DateTime dogumTarihi = DateTime.now();

  String cinsiyet = "";

  int maas = 0;

  String kategori = "";
  String gorev = "";

  var flagWomeDeluxe = false;

  @override
  void initState() {
    // dogumTarihiString =
    //     dogumTarihiString = DateFormat("dd MMMM yyyy").format(DateTime.now());

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference testCollectionRef =
        FirebaseFirestore.instance.collection('testCollection');
    testCollectionRef.add({'test': ''});

    super.initState();
  }

  late final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // late List<dynamic> personeller = [
    //   {"adi": "ceren"}
    // ];
    getData() async {
      // var response = await babaRef.get();
      // var veri = response.data();
      // print(veri);
      // personeller = json.decode(response.data as String);
      // return personeller;

      // var response = await demoRef.get();
      // var list = response.docs;
      // print(list[1].data());
    }

    @override
    void initState() {
      getData();
      super.initState();
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 60, right: 60),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                children: [
                  buildOteller(),
                  // StreamBuilder<DocumentSnapshot>(
                  //     stream: babaRef.snapshots(),
                  //     builder:
                  //         (BuildContext context, AsyncSnapshot asyncSnapshot) {
                  //       return Text('${asyncSnapshot.data.data()['soyad']}');
                  //     }),

                  // Text("personeller as String"),
                  flagWomeDeluxe == true
                      ? buildCalisanlar()
                      : Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool flagUsertype = false;

  Widget buildOteller() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Oteller",
                style: TextStyle(fontSize: 42, color: kPrimaryColor),
              ),
            ],
          ),
        ),
        new Divider(
          color: kPrimaryColor,
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
            height: 250,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: otelListesi.length,
                itemBuilder: (context, index) {
                  var _otel = otelListesi[index];
                  return Column(
                    children: [
                      // Text("${listOfDocumentSnap[index].data()}"),
                      Container(
                        height: 150,
                        width: 200,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                  color: kPrimaryColor,
                                  blurRadius: 4,
                                  spreadRadius: 2)
                            ]),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        flagWomeDeluxe = !flagWomeDeluxe;
                                      });
                                    },
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 00),
                                          child: Image.network(
                                            _otel['resmi'],
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ]),
                      ),
                      Text(_otel['adi'],
                          style: const TextStyle(
                              fontSize: 15, color: kPrimaryColor),
                          textAlign: TextAlign.center),
                    ],
                  );
                })),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCalisanlar() {
    CollectionReference personelRef = _firestore.collection("metaOzcePersonel");

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Personeller",
                style: TextStyle(fontSize: 42, color: kPrimaryColor),
              ),
            ],
          ),
        ),
        new Divider(
          color: kPrimaryColor,
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 250,
          child: StreamBuilder<QuerySnapshot>(
            stream: personelRef.snapshots(),
            builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                List<DocumentSnapshot> listOfDocumentSnap =
                    asyncSnapshot.data.docs;
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: listOfDocumentSnap.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          // Text("${listOfDocumentSnap[index].data()}"),
                          Container(
                            height: 150,
                            width: 100,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  const BoxShadow(
                                      color: kPrimaryColor,
                                      blurRadius: 4,
                                      spreadRadius: 2)
                                ]),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            var adSoyad = "";
                                            var gorevKategorileriRef = null;
                                            adSoyad =
                                                "${listOfDocumentSnap[index].get('ad')}${listOfDocumentSnap[index].get('soyad')}";

                                            gorevKategorileriRef = personelRef
                                                .doc(adSoyad)
                                                .collection(
                                                    'gorevKategorileri'); //calisanrefadsoyad
                                            print(adSoyad);

                                            print(personelRef
                                                .doc('AliYenilmez')
                                                .collection('gorevKategorileri')
                                                .get()); //calisanrefadsoyad
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("Personel Detayı",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                  content: Container(
                                                    width: 300.0,
                                                    height: 500.0,
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "Personel Adı: ${listOfDocumentSnap[index].get('ad')} "),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "Personel Soyadı: ${listOfDocumentSnap[index].get('soyad')} "),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "Personel Yaşı: ${listOfDocumentSnap[index].get('yas')} "),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "Personel Cinsiyeti: ${listOfDocumentSnap[index].get('cinsiyet')} "),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "Personel Maaşı: ${listOfDocumentSnap[index].get('maas')} TL "),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 40,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Personele Görev Ata",
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        StreamBuilder<
                                                                QuerySnapshot>(
                                                            stream:
                                                                gorevKategorileriRef
                                                                    .snapshots(),
                                                            builder: (BuildContext
                                                                    context,
                                                                AsyncSnapshot
                                                                    asyncSnapshot) {
                                                              List<DocumentSnapshot>
                                                                  listOfGorevler =
                                                                  asyncSnapshot
                                                                      .data
                                                                      .docs;
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 20,
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                child:
                                                                    DropdownButtonFormField<
                                                                        dynamic>(
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    labelText:
                                                                        "Görevler",
                                                                    hintText:
                                                                        'Atanacak görevi seçin',
                                                                    icon: Icon(Icons
                                                                        .person_pin_circle),

                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                            //borderSide: BorderSide(color: Colors.blue, width: 2),

                                                                            ),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              35,
                                                                              35,
                                                                              35),
                                                                          width:
                                                                              0.4),
                                                                    ),
                                                                    //filled: true,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  value: null,
                                                                  items: kategoriler
                                                                      .map((kategori) => DropdownMenuItem<dynamic>(
                                                                          value: kategori,
                                                                          child: Container(
                                                                            height:
                                                                                32,
                                                                            child:
                                                                                Text(kategori.toString(), style: const TextStyle(fontSize: 15)),
                                                                          )))
                                                                      .toList(),
                                                                  onChanged:
                                                                      (value) {
                                                                    kategori =
                                                                        value;
                                                                  },
                                                                  // onChanged: (userType) {
                                                                  //   setState(() {
                                                                  //     userTypeApi = userType;
                                                                  //     if (userType == null) {
                                                                  //       flagUsertype = false;
                                                                  //     } else {
                                                                  //       flagUsertype = true;
                                                                  //     }
                                                                  //     // selectedUserType = userType;
                                                                  //   });
                                                                  // },
                                                                  validator:
                                                                      (userType) {
                                                                    if (userType ==
                                                                        null) {
                                                                      return "Select one";
                                                                    } else {
                                                                      return null;
                                                                    }
                                                                  },
                                                                ),
                                                              );
                                                            }),
                                                        buildYorum(),

                                                        // Text(
                                                        //     listOfGorevler[
                                                        //             0]
                                                        //         .get(
                                                        //             "gorev"))
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors.red),
                                                        onPressed: () {},
                                                        child: Text(
                                                            "İşten Çıkar")),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.green),
                                                      onPressed: () {
                                                        gorevKategorileriRef
                                                            .add({
                                                          'gorev': gorev,
                                                          'kategori': kategori,
                                                          'status': 'Bekleyen'
                                                          // personelRef.document(adSoyad).collection('string name').document().setData();
                                                        });

                                                        Navigator.of(context)
                                                            .pop();
                                                        gorev = "";
                                                        kategori = "";

                                                        // gorevKategorileriRef.add("gorev" : "bla")
                                                      },
                                                      child: const Text(
                                                          "Görev Ekle"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          });
                                        },
                                        child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(0),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15),
                                                        child: Image.asset(
                                                          "assets/images/rob1.png",
                                                          width: 80,
                                                          height: 100,
                                                        )),
                                                  ]),
                                            )),
                                      )
                                    ],
                                  ),
                                ]),
                          ),
                          Text('${listOfDocumentSnap[index].get('ad')}',
                              style: const TextStyle(
                                  fontSize: 15, color: kPrimaryColor),
                              textAlign: TextAlign.center),
                        ],
                      );
                    });
              } else if (asyncSnapshot.hasError) {
                const Text('Personel verisi alnamadı');
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Ekle"),
                      content: Column(
                        children: [
                          buildPersonelEklemeAd(),
                          buildPersonelEklemeSoyad(),
                          buildPersonelEklemeYas(),
                          buildPersonelEklemeCinsiyet(),
                          buildPersonelEklemeMaas(),
                          // buildBirthDate(),
                        ],
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            personelRef.add({
                              'ad': ad,
                              'soyad': soyad,
                              'cinsiyet': cinsiyet,
                              'maas': maas,
                              'yas': yas,
                            });

                            Navigator.of(context).pop();
                            ad = "";
                            soyad = "";
                            yas = 0;
                            cinsiyet = "";
                            maas = 0;
                          },
                          child: const Text("Ok"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ],
    );
  }

  buildPersonelEklemeAd() => Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Personel Adı',
            hintText: 'At least 4 charachter',
            icon: const Icon(Icons.person),
            fillColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
              borderSide: flagUsername == true
                  ? const BorderSide(color: Colors.green)
                  : const BorderSide(color: Colors.red),
            ),
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.length < 4) {
              return "At least 4 charachter";
            } else {
              return null;
            }
          },
          maxLength: 30,
          onChanged: (value) {
            setState(() {
              if (value!.length < 4) {
                flagUsername = false;
              } else {
                flagUsername = true;
              }
              ad = value;
            });
          },
        ),
      );
  buildPersonelEklemeSoyad() => Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Personel Soyadı',
            hintText: 'At least 4 charachter',
            icon: const Icon(Icons.person),
            fillColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
              borderSide: flagUsername == true
                  ? const BorderSide(color: Colors.green)
                  : const BorderSide(color: Colors.red),
            ),
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.length < 4) {
              return "At least 4 charachter";
            } else {
              return null;
            }
          },
          maxLength: 30,
          onChanged: (value) {
            setState(() {
              if (value!.length < 4) {
                flagUsername = false;
              } else {
                flagUsername = true;
              }
              soyad = value;
            });
          },
        ),
      );
  buildPersonelEklemeYas() => Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Personel Yaş',
            hintText: 'At least 4 charachter',
            icon: const Icon(Icons.person),
            fillColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
              borderSide: flagUsername == true
                  ? const BorderSide(color: Colors.green)
                  : const BorderSide(color: Colors.red),
            ),
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.length < 4) {
              return "At least 4 charachter";
            } else {
              return null;
            }
          },
          maxLength: 30,
          onChanged: (value) {
            setState(() {
              if (value!.length < 4) {
                flagUsername = false;
              } else {
                flagUsername = true;
              }
              yas = int.parse(value);
            });
          },
        ),
      );
  buildPersonelEklemeMaas() => Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Personel Maaş',
            hintText: 'Maaşı giriniz',
            icon: const Icon(Icons.person),
            fillColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
              borderSide: flagUsername == true
                  ? const BorderSide(color: Colors.green)
                  : const BorderSide(color: Colors.red),
            ),
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.length < 4) {
              return "At least 4 charachter";
            } else {
              return null;
            }
          },
          maxLength: 30,
          onChanged: (value) {
            setState(() {
              if (value!.length < 4) {
                flagUsername = false;
              } else {
                flagUsername = true;
              }
              maas = int.parse(value);
            });
          },
        ),
      );

  Widget buildPersonelEklemeCinsiyet() => Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: DropdownButtonFormField<dynamic>(
          decoration: const InputDecoration(
            labelText: "Cinsiyet",
            hintText: 'Cinsiyeti seçin',
            icon: Icon(Icons.person_pin_circle),

            enabledBorder: OutlineInputBorder(
                //borderSide: BorderSide(color: Colors.blue, width: 2),

                ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 35, 35, 35), width: 0.4),
            ),
            //filled: true,
            fillColor: Colors.white,
          ),
          value: null,
          items: cinsiyetler
              .map((cinsiyet) => DropdownMenuItem<dynamic>(
                  value: cinsiyet,
                  child: Container(
                    height: 32,
                    child: Text(cinsiyet.toString(),
                        style: const TextStyle(fontSize: 15)),
                  )))
              .toList(),
          onChanged: (value) {
            cinsiyet = value;
          },
          // onChanged: (userType) {
          //   setState(() {
          //     userTypeApi = userType;
          //     if (userType == null) {
          //       flagUsertype = false;
          //     } else {
          //       flagUsertype = true;
          //     }
          //     // selectedUserType = userType;
          //   });
          // },
          validator: (userType) {
            if (userType == null) {
              return "Select one";
            } else {
              return null;
            }
          },
        ),
      );
  Widget buildBirthDate() => Row(
        children: [
          Icon(
            Icons.cake_outlined,
            color: kPrimaryColor,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.4),
              // borderRadius: BorderRadius.circular(1),TODO
            ),

            //height: 50,
            height: MediaQuery.of(context).size.height * 0.067,
            width: MediaQuery.of(context).size.width * 0.42,

            child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        dogumTarihiString,
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: kPrimaryBackLightColor.withOpacity(1)),
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime:
                          DateTime.now().subtract(Duration(days: 365 * 90)),
                      maxTime:
                          DateTime.now().subtract(Duration(days: 365 * 15)),
                      /*  theme: DatePickerTheme(
                          headerColor: kPrimaryUltraLightColor,
                          backgroundColor: kPrimaryBackLightColor,
                          itemStyle: TextStyle(
                              color: textInfoColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: textInfoColor, fontSize: 16)),*/

                      onConfirm: (date) {
                    setState(() async {
                      var tag =
                          Localizations.maybeLocaleOf(context)?.toLanguageTag();
                      dogumTarihiString = "Doğum tarihi seçiniz";
                      print(dogumTarihiString);
                      dogumTarihiString =
                          await DateFormat("dd MMMM yyyy").format(date);
                      dogumTarihi = date;
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.tr);
                }),
          ),
        ],
      );

  bool flagUsername = false;
  Widget buildYorum() => Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Görev Detayı',
            hintText: 'At least 4 charachter',
            icon: const Icon(Icons.person),
            fillColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
              borderSide: flagUsername == true
                  ? const BorderSide(color: Colors.green)
                  : const BorderSide(color: Colors.red),
            ),
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.length < 4) {
              return "At least 4 charachter";
            } else {
              return null;
            }
          },
          maxLength: 30,
          onChanged: (value) {
            setState(() {
              if (value!.length < 4) {
                flagUsername = false;
              } else {
                flagUsername =
                    true; // TODO flagların namei değişecek hepsi red oluyor hepsi username gore
                gorev = value; //TODO bunlar atılacak
              }
            });
          },
        ),
      );

  buildTableOlusturma() => Padding(
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
                    "Görevler",
                    style: TextStyle(fontSize: 42, color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            new Divider(
              color: kPrimaryColor,
            ),
            DataTable(
                headingRowColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.grey.shade200),
                columns: [
                  const DataColumn(label: Text("ID")),
                  const DataColumn(label: Text("Article Title")),
                  const DataColumn(label: Text("Creation Date")),
                  const DataColumn(label: Text("Views")),
                  const DataColumn(label: Text("Comments")),
                ],
                rows: [
                  DataRow(cells: [
                    const DataCell(Text("0")),
                    const DataCell(Text("How to build a Flutter Web App")),
                    DataCell(Text("${DateTime.now()}")),
                    const DataCell(Text("2.3K Views")),
                    const DataCell(Text("102Comments")),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("1")),
                    const DataCell(Text("How to build a Flutter Mobile App")),
                    DataCell(Text("${DateTime.now()}")),
                    const DataCell(Text("21.3K Views")),
                    const DataCell(Text("1020Comments")),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("2")),
                    const DataCell(Text("Flutter for your first project")),
                    DataCell(Text("${DateTime.now()}")),
                    const DataCell(Text("2.3M Views")),
                    const DataCell(Text("10K Comments")),
                  ]),
                ]),
            //Now let's set the pagination
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "1",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "2",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "3",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
