import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool isDrawerOpen = false;
  int currentPageIndex = 0;
  PageController _controller;
  AnimationController _animationController;
  Animation<Offset> _menuScreenAnimation;
  Animation<double> _mainScreenAnimation;
  Size size;

  @override
  void initState() {
    _controller = PageController(initialPage: currentPageIndex, keepPage: false, viewportFraction: 0.8);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _mainScreenAnimation = Tween<double>(begin: 1.0, end: 0.6).animate(_animationController);
    _menuScreenAnimation = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 24.0),
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xff4A4A58),
      child: Stack(
        children: <Widget>[
          _buildMenu(),
          _buildMainScreen(),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return SlideTransition(
      position: _menuScreenAnimation,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
        ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(),
            Column(
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
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.assignment_return,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Log out',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainScreen() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 600),
      left: isDrawerOpen ? size.width * 0.5 : 0,
      right: isDrawerOpen ? size.width * -0.4 : 0,
      top: 0.0,
      bottom: 0.0,
      child: ScaleTransition(
        scale: _mainScreenAnimation,
        child: Material(
          borderRadius: isDrawerOpen ? BorderRadius.all(Radius.circular(20.0)) : BorderRadius.all(Radius.circular(0)),
          color: const Color(0xff4A4A58),
          elevation: 6.0,
          child: Column(
            children: <Widget>[
              _buildTopBar(),
              _buildPageCarousel(),
              _buildTransactionList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  if (!isDrawerOpen) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  isDrawerOpen = !isDrawerOpen;
                });
              },
              child: Icon(
                Icons.sort,
                color: Colors.white,
              ),
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

  Widget _buildPageCarousel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // carousel container
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
        // three dots indicator
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
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  Widget _buildTransactionList() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Transactions',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18.0),
                ),
                Icon(Icons.swap_horiz, color: Colors.white.withOpacity(0.75)),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          // listView
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 0.0, right: 0.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return _buildListItem(index);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: _buildDateTime(index),
        ),
        // list row item
        Container(
          height: 60.0,
          margin: EdgeInsets.only(left: 10.0, bottom: 15.0, right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xff4A4A58),
              boxShadow: [BoxShadow(offset: Offset(0, 3), blurRadius: 4, color: Color(0xff3e3e4a))]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  // icon
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff3e3e4a)),
                    child: Icon(
                      Icons.confirmation_number,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Text(
                    'Apple',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text('+120 ₹', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w900)),
              )
            ],
          ),
        )
      ],
    );
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

  /// dummy
  Widget _buildDateTime(int index){
    if(index % 5 == 0){
      return Text('18-Nov-19 ', style: TextStyle(color: Colors.white.withOpacity(0.75), fontWeight: FontWeight.w600, fontSize: 14.0),);
    }else{
      return SizedBox();
    }
  }

  _buildSingleDot(Color color) {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
