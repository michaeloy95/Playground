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
        fontSize: 32,
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

class Hat {
  Hat(this.imageUrl, this.name, this.price);

  final String imageUrl;
  final String name;
  final double price;
}