import 'package:bookings_africa/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  final String email;
  final int id;
  final String imagePath;
  final String avatar;
  final String firstName;
  final String lastName;
  final GestureTapCallback onTap;

  UserCard({
    this.email,
    this.id,
    this.imagePath,
    this.avatar,
    this.firstName,
    this.lastName,
    this.onTap,
  });

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 220,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: ksecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                height: 110,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("${widget.imagePath}"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
              ),
              Positioned(
                left: 20,
                top: 60,
                // bottom: 8,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 37.0,
                        width: 37.0,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: kprimaryColor.withOpacity(1.0)),
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage(
                              "${widget.avatar}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.034,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${widget.firstName}' + ' ${widget.lastName}',
                            style: TextStyle(
                                letterSpacing: 0.3,
                                color: Colors.white,
                                fontFamily: 'HelveticaM',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text('${widget.email}',
                              style: TextStyle(
                                  letterSpacing: 0.3,
                                  color: Colors.white,
                                  fontFamily: 'Helvetica',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 25,
                  top: 12,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1.0,
                                offset: Offset(0, 1.0),
                                color: Color(0xFFCACACA).withOpacity(0.5)),
                          ],
                        ),
                        child: Text(
                          '5.0',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'HelveticaB',
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(width: 4),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1.0,
                                offset: Offset(0, 1.0),
                                color: Color(0xFFCACACA).withOpacity(0.5)),
                          ],
                        ),
                        child: Image.asset(
                          'assets/star_icon.png',
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(
              top: 10,
              left: 20,
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${widget.email}',
                    style: TextStyle(
                        letterSpacing: 0.3,
                        color: Colors.black87,
                        fontFamily: 'HelveticaM',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
                Text('${widget.id}',
                    style: TextStyle(
                        fontFamily: 'HelveticaB',
                        fontStyle: FontStyle.normal,
                        color: Color(0x38BA64).withOpacity(1.0),
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Divider(
            height: 7,
            thickness: 2,
            color: ksecondaryColor.withOpacity(0.2),
          ),
          Container(
            height: 32,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )),
            child: GestureDetector(
              onTap: widget.onTap,
              child: Center(
                  child: Text('View Profile',
                      style: TextStyle(
                          letterSpacing: 0.3,
                          color: Colors.black54,
                          fontFamily: 'HelveticaM',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 14))),
            ),
          ),
        ],
      ),
    );
  }
}
