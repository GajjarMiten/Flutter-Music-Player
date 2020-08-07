import 'package:flutter/material.dart';
import 'package:mantra/helpers/Theme.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Mantra",
            style: headingTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   CupertinoPageRoute(
                //     builder: (context) {
                //       return MyProfile();
                //     },
                //   ),
                // );
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: Image.asset("assets/profile.jpg").image),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
