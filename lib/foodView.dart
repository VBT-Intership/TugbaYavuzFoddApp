import 'package:flutter/material.dart';

class FoodView extends StatefulWidget {
  FoodView({Key key}) : super(key: key);

  @override
  _FoodViewState createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  String get image =>
      "https://images.unsplash.com/photo-1551404973-7dec6ee9bba7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=120&q=80";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: bodyColumn,
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {},
          color: Colors.black),
      actions: [
        IconButton(
            icon: Icon(Icons.menu), onPressed: () {}, color: Colors.black)
      ],
    );
  }

  Widget get bodyColumn {
    return ListView(
      children: [
        searchBar,
        cards,
        SizedBox(height: 20),
        buildPopular,
        buildPopulerItem,
      ],
    );
  }

  ListView get buildPopulerItem {
    return ListView.builder(
      shrinkWrap: true, // 1st add
      physics: ClampingScrollPhysics(), // 2nd add
      itemCount: 10,
      itemBuilder: (_, index) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: ListTile(
            leading: ClipRRect(
                borderRadius: borderRadius10,
                child: Image.network(
                  image,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width * 0.2,
                )),
            title: Text('Banana Goreng'),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    buildCategory('Gorengan', Colors.blue[200]),
                    SizedBox(width: 20),
                    buildCategory('Makanan', Colors.pink[200]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Warung Buyakruk '),
                    Text(
                      'Rp.2500',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }

  Widget buildCategory(String category, Color color) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius10,
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(category),
        ));
  }

  Row get buildPopular {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:20),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)),
            child: Icon(Icons.favorite, color: Colors.white),
          ),
        ),
        Column(
          children: [
            Text("Popular",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)
            ),
            Text("  Monggo, entekno duwemkul",
                style: TextStyle(fontSize: 15, color: Colors.grey)),
          ],
        ),
        Spacer(),
        Icon(Icons.arrow_forward)
      ],
    );
  }

  Row get searchBar {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "What do you want to eat today ?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        IconButton(onPressed: null, icon: Icon(Icons.search))
      ],
    );
  }

  Widget get cards {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.3,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 13,
        padding: EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Expanded(flex: 9, child: buildCard),
                Expanded(flex: 1, child: Text("Sweets $index")),
              ],
            ),
          );
        },
      ),
    );
  }

  Card get buildCard {
    return Card(
      elevation: 5,
      color: Colors.black38,
      shape: RoundedRectangleBorder(borderRadius: borderRadius10),
      child: ClipRRect(
          borderRadius: borderRadius10,
          child: Image.network(image, fit: BoxFit.cover)),
    );
  }

  BorderRadius get borderRadius10 => BorderRadius.circular(10);
}
