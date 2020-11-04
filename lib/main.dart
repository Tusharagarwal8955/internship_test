import 'package:flutter/material.dart';
import 'package:learn_pageview/slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landing(),
    );
  }
}

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
      pageNo: 'Page 1',
    ),
    SliderPage(
      pageNo: 'Page 2',
    ),
    SliderPage(
      pageNo: 'Page 3',
    ),
    SliderPage(
      pageNo: 'Page 4',
    ),
    SliderPage(
      pageNo: 'Page 5',
    ),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.arrow_back),
      ),
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(_pages.length, (int index) {
                return AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: 50,
                    // padding: EdgeInsets.all(5),
                    width: 50,
                    child: (index <= _currentPage)
                        ? Icon(
                            Icons.check_circle_outlined,
                            color: Colors.black,
                            size: 40,
                          )
                        : null,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 5),
                    ));
              })),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOutQuint);
                },
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
