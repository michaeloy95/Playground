import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HboMaxMainPage extends StatelessWidget {
  static const _navigationColor = const Color(0xff000000);
  static const _activeItemColor = const Color(0xffe11333);
  static const _inactiveItemColor = const Color(0xff414247);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final bottomNavigationBar = BottomNavigationBar(
      backgroundColor: _navigationColor,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home, color: _activeItemColor),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search, color: _inactiveItemColor),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.star, color: _inactiveItemColor),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.perm_identity, color: _inactiveItemColor),
          title: Container(),
        ),
      ],
    );
    
    final scaffold = Scaffold(
      backgroundColor: _navigationColor,
      bottomNavigationBar: bottomNavigationBar,
      body: _buildBody(context),
    );

    return scaffold;
  }

  Widget _buildBody(BuildContext context) {
    const overflowWidth = 100;

    final image = FittedBox(
      fit: BoxFit.fill,
      child: Image.network("https://i.pinimg.com/736x/61/b2/40/61b2405819b924a51c210c6d05356139.jpg"),
    );

    final topLayer = Container(
      height: MediaQuery.of(context).size.height,
      child: OverflowBox(
        alignment: Alignment.topCenter,
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width + overflowWidth,
        child: Column(
          children: [
            image,
          ],
        ),
      ),
    );

    final headerBackButton = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.arrow_back_ios, color: Colors.white),
        Container(width: 5),
        Text(
          "Back",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );

    final headerToolbarItems = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.star_border, color: Colors.white),
        Container(width: 15),
        Icon(Icons.share, color: Colors.white),
      ],
    );

    final headerBar = SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                headerBackButton,
                headerToolbarItems,
              ],
            ),
          ],
        ),
      ),
    );

    final info = _buildInfo();
    
    final gradient = Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.transparent,
              Colors.black
            ],
            stops: <double>[
              0.65,
              1.0,
            ],
          ),
        ),
      ),
    );

    final stack = Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        topLayer,
        gradient,
        headerBar,
        info,
      ],
    );

    return stack;
  }

  Widget _buildInfo() {
    final popularWithFriendsTag = _createTag(
      content: Text(
        "Popular with friends",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );

    final ageTag = _createTag(
      content: Text(
        "16+",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );

    final imdbTag = _createTag(
      content: Row(
        children: [
          Container(
            height: 12,
            child: Image.network("https://icon-library.net/images/imdb-icon-png/imdb-icon-png-2.jpg"),
          ),
          Container(width: 5),
          Text(
            "7.8",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
      color: const Color(0xffefb651),
    );

    final tags = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        popularWithFriendsTag,
        ageTag,
        imdbTag,
      ],
    );

    final caption = Text(
      "2019 - Drama, Sci-fi - Dark, Dystopic",
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );

    final nextEpisodeButton = FlatButton(
      color: _activeItemColor,
      onPressed: () {},
      child: Row(
        children: <Widget>[
          Icon(Icons.play_arrow, color: Colors.white),
          Container(width: 10),
          Text(
            "Next Episode",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    final info = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: tags,
        ),
        caption,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: nextEpisodeButton,
          ),
        ),
      ],
    );

    return Center(child: info);
  }

  Widget _createTag({Widget content, Color color = Colors.white}) => Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(5),
      child: content,
    );
}