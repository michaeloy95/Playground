import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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

    final info = _buildInfo(context);
    
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

  Widget _buildInfo(BuildContext context) {
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
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HboMaxDetailPage())),
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
        borderRadius: BorderRadius.circular(2),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(5),
      child: content,
    );
}

class HboMaxDetailPage extends StatelessWidget {
  static const _backgroundColor = const Color(0xff000000);
  static const _activeItemColor = const Color(0xffe11333);
  static const _inactiveItemColor = const Color(0xff414247);
  static const _secondaryTextColor = const Color(0xff98979d);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: _backgroundColor,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        "The Handmaid's Tale",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.4,
        ),
      ),
    );
    
    final bottomPanel = _buildBottomPanel();

    final scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: _backgroundColor,
      body: SlidingUpPanel(
        minHeight: 45,
        maxHeight: 185,
        borderRadius: BorderRadius.circular(20),
        body: _buildBody(context),
        panel: bottomPanel,
      ),
    );

    return scaffold;
  }

  Widget _buildBottomPanel() {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: <Color>[
          const Color(0xff242631),
          const Color(0xff15151e),
        ],
      ),
    );

    final arrowUp = Transform(
      transform: Matrix4.identity()
        ..scale(2.0, 1.0)
        ..translate(-5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Icon(Icons.keyboard_arrow_up, color: _secondaryTextColor),
      ),
    );

    const controlsColor = const Color(0xff2c2f38);
    
    final controls = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: controlsColor,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.skip_previous, color: Colors.white),
          ),
          Icon(Icons.replay_10, color: Colors.white),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xffe11333),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.play_arrow, color: Colors.white),
          ),
          Icon(Icons.forward_10, color: Colors.white),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: controlsColor,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.skip_next, color: Colors.white),
          ),
        ],
      ),
    );

    final progressBar = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: LinearProgressIndicator(
        backgroundColor: Colors.black,
        value: 0.6,
        valueColor: AlwaysStoppedAnimation(_secondaryTextColor),
      ),
    );

    final timing = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "28:50",
            style: TextStyle(
              color: _secondaryTextColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "-22:30",
            style: TextStyle(
              color: _secondaryTextColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

    final container = Container(
      decoration: decoration,
      child: Column(
        children: <Widget>[
          arrowUp,
          controls,
          progressBar,
          timing,
        ],
      ),
    );

    return container;
  }

  Widget _buildBody(BuildContext context) {
    final musicTrackHeader = _createSectionTitle("Music track");
    final musicTrackContent = _buildMusicTrackContent();

    final inTheShotHeader = _createSectionTitle("In the shot");
    final inTheShotContent = _buildInTheShotContent(context);

    final filmingLocationHeader = _createSectionTitle("Filming location");
    final filmingLocationContent = _buildFilmingLocationContent();

    final listView = ListView(
      children: <Widget>[
        musicTrackHeader,
        musicTrackContent,
        inTheShotHeader,
        inTheShotContent,
        filmingLocationHeader,
        filmingLocationContent,
        Container(height: 50),
      ],
    );

    return listView;
  }

  Widget _buildMusicTrackContent() {
    final albumImage = Transform(
      transform: Matrix4.identity()
        ..rotateY(0.5),
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 8.0,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network("https://images-na.ssl-images-amazon.com/images/I/41U5PSVZgLL._SY355_.jpg"),
        ),
      ),
    );

    final title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Chased",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: const Color(0xffcac9cc),
          ),
          textAlign: TextAlign.left,
        ),
        Container(height: 5),
        Text(
          "by Adam Taylor",
          style: TextStyle(
            fontSize: 14,
            color: _secondaryTextColor,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );

    final space = Flexible(child: Container());

    final playButton = Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Ink(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff747379),
              width: 1.0,
            ),
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: () {},
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );

    final card = _createCard(
      child: Row(
        children: <Widget>[
          albumImage,
          title,
          space,
          playButton,
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: card,
    );
  }

  Widget _buildInTheShotContent(BuildContext context) {
    Widget _createItem(
      String imageUrl,
      String title,
      String description,
      double price,
    ) {
      final image = Container(
        height: 60,
        margin: const EdgeInsets.only(right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(imageUrl),
        ),
      );

      final header = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: const Color(0xffcac9cc),
            ),
            textAlign: TextAlign.left,
          ),
          Container(height: 5),
          Text(
            "\$$price",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _secondaryTextColor,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      );

      final buyButton = Container(
        decoration: BoxDecoration(
          color: const Color(0xff32383e),
          borderRadius: BorderRadius.circular(2),
        ),
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Text(
          "BUY",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
      );

      final row = Row(
        children: <Widget>[
          image,
          header,
          Flexible(child: Container()),
          buyButton,
        ],
      );

      final desc = Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
          description,
          style: TextStyle(
            fontSize: 12,
            color: _secondaryTextColor,
            height: 1.5,
          ),
          maxLines: 2,
        ),
      );

      final column = Column(
        children: <Widget>[
          row,
          desc,
        ],
      );

      final container = Container(
        width: MediaQuery.of(context).size.width - 75,
        child: column,
      );
      
      return container;
    }

    final item1 = _createCard(
      child: _createItem(
        "https://cdn11.bigcommerce.com/s-mk8mgl5/images/stencil/500x659/products/1294/7152/flow_whiskey_stones__64699.1559657653.jpg?c=2",
        "Whiskey Stones",
        "This set of 9 x Granite Whiskey Stones in a wooden gift box will make a great gift for whisky lovers.",
        29.99,
      ),
    );

    final item2 = _createCard(
      child: _createItem(
        "https://cdn11.bigcommerce.com/s-mk8mgl5/images/stencil/500x659/products/1294/7152/flow_whiskey_stones__64699.1559657653.jpg?c=2",
        "Whiskey Stones",
        "This set of 9 x Granite Whiskey Stones in a wooden gift box will make a great gift for whisky lovers.",
        29.99,
      ),
    );

    final listView = ListView(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: <Widget>[
        item1,
        Container(width: 25),
        item2,
      ],
    );

    return Container(
      height: 175,
      child: listView,
    );
  }

  Widget _buildFilmingLocationContent() {
    final image = Container(
      height: 170,
      width: 500,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network("https://i.pinimg.com/originals/44/49/70/444970aae7ff8804aba4c24126f40534.jpg", fit: BoxFit.cover),
      ),
    );

    final title = Text(
      "The Grand Durand",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white70,
      ),
    );

    final description = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        "South Durand is home to one of the best and most architecturally diverse collections of pre-war residential architecture in Canada. ",
        style: TextStyle(
          fontSize: 14,
          color: Colors.white70,
        ),
      ),
    );

    final gradientContent = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        description,
      ],
    );
    
    final gradient = Container(
      height: 170,
      width: 500,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            const Color(0xf015151e),
            const Color(0x70242631),
          ],
        ),
      ),
      child: gradientContent,
    );

    final theGrandDurand = Stack(
      children: <Widget>[
        image,
        gradient,
      ],
    );

    final column = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: <Widget>[
          theGrandDurand,
        ],
      ),
    );

    return column;
  }

  Widget _createSectionTitle(String title) => Padding(
      padding: const EdgeInsets.only(left: 30, right: 25, top: 20),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

  Widget _createCard({Widget child}) => Card(
      margin: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: <Color>[
              const Color(0xff242631),
              const Color(0xff15151e),
            ],
          ),
        ),
        child: child,
      ),
    );
}