import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDrawerOpen = false;
  int currentPageIndex = 0;
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: currentPageIndex, keepPage: false, viewportFraction: 0.9);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24.0),
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xff4A4A58),
      child: Stack(
        children: <Widget>[
//          _buildMenu(),
          _buildMainScreen(),
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
    return Column(
      children: <Widget>[
        _buildTopBar(),
        _buildPageCarousel(),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.sort,
              color: Colors.white,
            ),
            Text(
              'My Cards',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.add_circle_outline,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  _buildPageCarousel() {
    return Container(
        height: 250.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 10.0),
                height: 180.0,
                child: PageView.builder(
                    itemCount: 3,
                    onPageChanged: (page) {
                      setState(() {
                        currentPageIndex = page;
                      });
                    },
                    physics: BouncingScrollPhysics(),
                    controller: _controller,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildCarouselContainer(index);
                    })),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildSingleDot(currentPageIndex == 0 ? Colors.blue : Colors.blue.withOpacity(0.4)),
                  SizedBox(
                    width: 5.0,
                  ),
                  _buildSingleDot(currentPageIndex == 1 ? Colors.blue : Colors.blue.withOpacity(0.4)),
                  SizedBox(
                    width: 5.0,
                  ),
                  _buildSingleDot(currentPageIndex == 2 ? Colors.blue : Colors.blue.withOpacity(0.4)),
                ],
              ),
            )
          ],
        ));
  }

  _buildCarouselContainer(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        double val = 1.0;
        if (_controller.position.haveDimensions) {
          val = _controller.page - index;
          val = (1 - (val.abs() * 0.1)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: val * 150.0,
            child: child,
          ),
        );
      },
      child: Container(
          margin: (index != 0 || index != 2) ? EdgeInsets.only(right: 10.0) : EdgeInsets.all(0.0),
          decoration: BoxDecoration(color: Colors.deepPurpleAccent, borderRadius: BorderRadius.all(Radius.circular(20.0)))),
    );
  }
}

_buildSingleDot(Color color) {
  return Container(
    width: 10.0,
    height: 10.0,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );
}
