import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xff4A4A58),
      child: Stack(
        children: <Widget>[
          _buildMenu(),
//          _buildMainScreen(),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Center(
              child: Text('A', style: TextStyle(color: Color(0xff4A4A58), fontWeight: FontWeight.w900, fontSize: 24.0)),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Alex Benjaminn',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 5.0),
          Text(
            'San Francisco, CA',
            style: TextStyle(color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 35.0),
          Row(
            children: <Widget>[
              Icon(Icons.account_balance_wallet, color: Colors.white, size: 16.0),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Dashboard',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            children: <Widget>[
              Icon(Icons.library_books, color: Colors.white, size: 16.0),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Utility Bills',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.swap_horiz,
                color: Colors.white,
                size: 16.0,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Funds Transfer',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.business,
                color: Colors.white,
                size: 16.0,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Branches',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainScreen() {
    return Container();
  }
}
