import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;
  bool _showLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 3000,
      ),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastLinearToSlowEaseIn,
    );
    _animationController.forward();
    Future.delayed(Duration(milliseconds: 2800), () {
      setState(() {
        _showLoading = true;
      });
    });
    _startTime();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        color: Colors.white,
        child: ScaleTransition(
          scale: _animation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: height / 3,
                  width: width,
                ),
                Container(
                  width: 280,
                  height: 90,
                  margin: EdgeInsets.only(right: 60),
                  alignment: Alignment.bottomRight,
                  child: _showLoading
                      ? Text(
                          'Pick a random Winner!',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Container(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/splash_screen.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  height: height / 3,
                  width: width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Timer> _startTime() async {
    var _duration = new Duration(milliseconds: 4000);
    return Timer(_duration, _navigationPage);
  }

  void _navigationPage() {
    Navigator.of(context).pushReplacementNamed('home-screen');
  }
}
