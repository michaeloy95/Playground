import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HatShopMainPage extends StatelessWidget {
  static const _activeColor = const Color(0xffd3b184);
  static const _backgroundColor = const Color(0xfffaf6f3);
  static const _bottomSheetHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    
    final appBar = SliverAppBar(
      backgroundColor: _activeColor,
      expandedHeight: 220.0,
      floating: false,
      pinned: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: (){},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.star, size: 30),
          onPressed: (){},
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network('https://www.lulus.com/images/product/xlarge/4690290_974982.jpg', fit: BoxFit.cover),
        title: Text(
          "Rag & Bone Collection",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );

    final scaffold = Scaffold(
      backgroundColor: _backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => <Widget>[appBar],
        body: _buildBody(context),
      ),
      bottomSheet: _buildBottomSheet(context),
    );

    return scaffold;
  }

  Widget _buildBody(BuildContext context) {
    Widget _buildHatCard(Hat hat) => Card(
        elevation: 0,
        color: Colors.white,
        margin: const EdgeInsets.all(7.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HatShopDetailPage(hat))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 150,
                  child: Image.network(hat.imageUrl, fit: BoxFit.contain),
                ),
                Flexible(child: Container()),
                Text(hat.name, style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
                Container(height: 5),
                Text("\$${hat.price}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
              ],
            ),
          ),
        ),
      );

    final hats = <Hat>[
      Hat(
        "https://images-na.ssl-images-amazon.com/images/I/714Mb3E8KgL._UL1500_.jpg",
        "Black Satin Top",
        84.0,
      ),
      Hat(
        "https://cdn11.bigcommerce.com/s-a4990/products/437/images/6149/Kooringal_Arlo_Unisex_Snap_Brim_Fedora_Hats_Unlimited_HatsUnlimited.com_KU1_A_Black___60689.1556075889.640.640.jpg?c=2",
        "Snap Brim Fedora",
        138.0,
      ),
      Hat(
        "https://images-na.ssl-images-amazon.com/images/I/71tLvlFO5yL._UX679_.jpg",
        "Cannabis Leaf",
        129.0,
      ),
      Hat(
        "https://cdn.shopify.com/s/files/1/0013/8615/2051/products/hat-old-snake-fedora-hat-1.jpeg?v=1543900659",
        "Old Snake Fedora",
        199.0,
      ),
      Hat(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsLQBLh6IT2ecb97rehZUVo0ikQr9tXSv3-RY24rtqn_fKlXbn&s",
        "Henschel Pinstripe",
        154.0,
      ),
      Hat(
        "https://images-na.ssl-images-amazon.com/images/I/61LcnG0T3RL._UX679_.jpg",
        "Lisianthus Buckle",
        79.0,
      ),
    ];

    final extraPadding = EdgeInsets.only(bottom: _bottomSheetHeight);

    final grid = GridView.count(
      addRepaintBoundaries: true,
      crossAxisCount: 2,
      childAspectRatio: 0.72,
      padding: const EdgeInsets.all(10).add(extraPadding),
      children: hats.map((hat) => _buildHatCard(hat)).toList(),
    );

    return grid;
  }

  Widget _buildBottomSheet(BuildContext context) {
    final cart = Text(
      "Cart",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );

    final items = Text(
      "Items",
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    );

    final totalItems = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: _activeColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        "2",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );

    final row = Row(
      children: <Widget>[
        cart,
        Flexible(child: Container()),
        items,
        Container(width: 20),
        totalItems,
      ],
    );

    final container = Container(
      height: _bottomSheetHeight,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      color: Colors.black,
      child: row,
    );

    return container;
  }
}

class HatShopDetailPage extends StatelessWidget {
  static const _activeColor = const Color(0xffd3b184);

  HatShopDetailPage(this.hat);

  final Hat hat;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
    );

    final scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );

    return scaffold;
  }

  Widget _buildBody(BuildContext context) {
    final image = Container(
      height: 150,
      margin: const EdgeInsets.only(bottom: 25.0),
      child: Image.network(this.hat.imageUrl),
    );

    final images = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(4, (_) =>
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(this.hat.imageUrl),
          ),
        ),
      ),
    );

    final title = Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        this.hat.name,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        textAlign: TextAlign.left,
        maxLines: 2,
      ),
    );

    final price = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "\$${this.hat.price}",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        textAlign: TextAlign.left,
      ),
    );

    final description = Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        "Featured on several of the runway looks, the high-domed hat is" +
        "made from straw effect fabric interwoven with shiny lame threads.",
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          height: 1.6,
        ),
        textAlign: TextAlign.left,
      ),
    );

    final variations = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "VARIATIONS",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),
        textAlign: TextAlign.left,
      ),
    );

    final colors = <Color>[
      const Color(0xffd4a879),
      const Color(0xff3c4b33),
      const Color(0xff343b4b),
    ];

    final colorChoices = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List<Widget>.generate(colors.length, (index) =>
        Container(
          margin: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: index == 2 ? Colors.grey : Colors.transparent),
          ),
          height: 33,
          width: 33,
          child: Container(
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: colors[index],
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );

    final likeButton = InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(Icons.star, color: Colors.black, size: 30),
      ),
    );

    final addToCartButton = InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: (){},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _activeColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(left: 10),
        child: Text(
          "Add to cart",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );

    final bottomRow = Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          likeButton,
          Expanded(child: addToCartButton),
        ],
      ),
    );

    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        image,
        images,
        Container(height: 25),
        title,
        price,
        description,
        Container(height: 25),
        variations,
        colorChoices,
        Expanded(child: Container()),
        bottomRow,
      ],
    );

    final body = SafeArea(
      child: Center(
        child: column,
      ),
    );

    return body;
  }
}

class Hat {
  Hat(this.imageUrl, this.name, this.price);

  final String imageUrl;
  final String name;
  final double price;
}