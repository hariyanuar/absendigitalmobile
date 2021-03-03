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
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(height: edge),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Agung prasetio',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                '11806479 RPL XII-3',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Kegiatan',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Absen Sekarang',
                            style: blackTextStyle.copyWith(fontSize: 18),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Berakhir pukul 08.00',
                            style: greyTextStyle.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.chevron_right,
                          color: greyColor,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
            )
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
