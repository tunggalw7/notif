import 'package:flutter/material.dart';
import 'hotel.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var safearea = MediaQuery.of(context).padding.top;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 245, 252),
        resizeToAvoidBottomInset: false, // set it to false
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: safearea,
              ),
              SizedBox(
                height: 60,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Botejyu App",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(27, 57, 110, 65)
                        ),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.notifications_none_rounded,
                        color: Color.fromRGBO(27, 57, 110, 65),
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.only(left: 15),
              //   child: Text(
              //     "Do you want to find hotels?",
              //     style: TextStyle(
              //         fontSize: 17,
              //         fontWeight: FontWeight.w100,
              //         color: Color.fromARGB(143, 0, 0, 0)),
              //   ),
              // ),
              // SizedBox(
              //   child: Padding(
              //       padding: const EdgeInsets.only(left: 15, top: 15),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           SizedBox(
              //             height: 50,
              //             width: 300,
              //             child: TextField(
              //               decoration: InputDecoration(
              //                 filled: true,
              //                 fillColor:
              //                 const Color.fromRGBO(213, 225, 243, 50),
              //                 border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(10),
              //                   borderSide: BorderSide.none,
              //                 ),
              //                 hintText: "Search hotels...",
              //                 hintStyle: const TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.w100,
              //                   color: Color.fromARGB(143, 0, 0, 0),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(right: 10),
              //             child: SizedBox(
              //               height: 50,
              //               width: 50,
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   color: const Color.fromRGBO(3, 100, 176, 65),
              //                   borderRadius: BorderRadius.circular(10),
              //                 ),
              //                 child: const Icon(
              //                   Icons.search,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       )),
              // ),
              SizedBox(
                height: 60,
                width: width,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        "新作登場 ”ピアスとイヤーカフをもっ\nと手軽に 楽しみたい方へ”",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(27, 57, 110, 65)),
                      ),
                    ),
                    // Padding(
                    //     padding: EdgeInsets.only(right: 15),
                    //     child: Text("view all",
                    //         style: TextStyle(
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.w100,
                    //             color: Color.fromARGB(143, 0, 0, 0)))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 25, bottom: 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        child: const Hotels(
                            title: "Archipel Mansion",
                            image: "assets/images/image2.jpg",
                            location: "【４℃ LIVE Channel】"),
                        onTap: () {
                          Navigator.pushNamed(context, '/archipel');
                        },
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/finika');
                        },
                        child: const Hotels(
                            title: "Finika Residence",
                            image: "assets/images/image1.PNG",
                            location: "【４℃ LIVE Channel】"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/archipel');
                        },
                        child: const Hotels(
                            title: "Archipel Mansion",
                            image: "assets/images/image3.jpg",
                            location: "【CLASSY.8月号掲載】"),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 60,
              //   width: width,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: const [
              //       // Padding(
              //       //   padding: EdgeInsets.only(left: 15),
              //       //   child: Text(
              //       //     "Information",
              //       //     style: TextStyle(
              //       //         fontSize: 18,
              //       //         fontWeight: FontWeight.bold,
              //       //         color: Color.fromARGB(143, 0, 0, 0)),
              //       //   ),
              //       // ),
              //       // Padding(
              //       //     padding: EdgeInsets.only(right: 15),
              //       //     child: Text("view all",
              //       //         style: TextStyle(
              //       //             fontSize: 15,
              //       //             fontWeight: FontWeight.w100,
              //       //             color: Color.fromARGB(143, 0, 0, 0)))),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 310,
                width: width,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // children: [
                  //     Flexible(
                  //       child: Text('2022年6月30日(木)19:30より\n、４℃LIVE Channelを配信いたします。\n今回は、公式オンラインショップ\nでは6月30日(木) 16:00より、\n店舗では7月1日(金)より発売の、\n４℃誕生50周年を記念した「50th Anniversary Collection」第2弾をご紹介。\n「Aqua Link ～過去から未来へ\n～」をコンセプトに、\n1989年当時のデザインを時\n代に合わせて蘇らせたア\nーカイブコレクションが登場します。\n配信中、コメントやご\n質問も受け付けておりますので\nぜひこの機会にご覧ください。',
                  //         maxLines: 1,
                  //         softWrap: false,
                  //         overflow: TextOverflow.fade,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  children: [
                    Flexible(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                              child: Text(
                                "2022年6月30日(木)19:30より、４℃LIVE Channelを配信いたします。今回は、公式オンラインショップでは6月30日(木) 16:00より\n\n店舗では7月1日(金)より発売の、４℃誕生50周年を記念した「50th Anniversary Collection」第2弾をご紹介。\n\n「Aqua Link ～過去から未来へ～」\nをコンセプトに、1989年当時のデザインを時代に合わせて蘇らせたアーカイブコレクションが登場します。配信中、コメントやご質問も受け付けておりますので、ぜひこの機会にご覧ください。",
                                style:  TextStyle(
                                  color: HexColor("#1b396e"),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //     padding: EdgeInsets.only(right: 15),
                    //     child: Text("view all",
                    //         style: TextStyle(
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.w100,
                    //             color: Color.fromARGB(143, 0, 0, 0)))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      //recommendation(
                      // name: "pina Caldera Residence",
                      // location: "Oia Santorini,Greece",
                      // image: "assets/hotels/recom1.png"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded,
                  color: Colors.white, size: 25),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_rounded,
                  color: Colors.white, size: 30),
              label: "Favourites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded,
                  color: Colors.white, size: 30),
              label: "Profile",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromRGBO(255, 255, 255, 200),
          backgroundColor: const Color.fromRGBO(27, 57, 110, 65),
        ));
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

