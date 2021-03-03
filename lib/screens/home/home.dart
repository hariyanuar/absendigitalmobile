import 'package:absendigital/widget/bottom_navbar_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [purpleColor, Colors.purple],
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Agung prasetio',
                              style: whiteTextStyle.copyWith(fontSize: 25),
                            ),
                            Text(
                              '11806479',
                              style: whiteTextStyle.copyWith(fontSize: 15),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(Icons.logout, color: whiteColor),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width - (2 * edge),
                    height: 100,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.send_rounded,
                                    color: purpleColor,
                                  )),
                              SizedBox(height: 15),
                              Text(
                                'Lakukan Absen',
                                style: purpleTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.book_rounded,
                                    color: purpleColor,
                                  )),
                              SizedBox(height: 15),
                              Text(
                                'Lihat Laporan',
                                style: purpleTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      //buttom navigation navbar
      floatingActionButton: Container(
          width: MediaQuery.of(context).size.width - (2 * edge),
          height: 65,
          margin: EdgeInsets.symmetric(horizontal: edge),
          decoration: BoxDecoration(
            color: Color(0xfff6f7f8),
            borderRadius: BorderRadius.circular(23),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_home_ungu.png',
                isActive: true,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_card.png',
                isActive: false,
              ),
            ],
          )),
    );
  }
}
