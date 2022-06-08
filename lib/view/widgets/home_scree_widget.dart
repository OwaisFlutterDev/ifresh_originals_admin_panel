// -=-=-   App Bar Widget -=-=-
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';

AppBar appBarWidget() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leadingWidth: 200,
    leading:  Container(
      height: 65,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.transparent,
        // image: DecorationImage(image: AssetImage("assets/Asset 150.png"),fit: BoxFit.fill)
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40,
          ),
          Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/Asset 150.png"),fit: BoxFit.fill)
              )
          )
        ],
      ),
    ),
    actions: [
      Icon(
        CupertinoIcons.bell,
        color: Colors.black,
        size: 22,
      ),
      SizedBox(
        width: 25,
      ),
      Row(
        children: [
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage("https://previews.123rf.com/images/racorn/racorn1307/racorn130706490/21205452-profile-portrait-of-a-smiling-young-man-in-front-of-the-bookshelf-.jpg"),fit: BoxFit.cover)
              )
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              smallText(
                  title: "Hello, Muhammad",
                  color: Colors.black,
                  fontWeight: FontWeight.w500
              ),

              commonText(
                  title: "Admin",
                  textStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black
                  )
              )
            ],
          ),
          SizedBox(
            width: 30,
          ),
        ],
      )
    ],
  );
}