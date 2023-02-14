import 'package:CashManager/database/db_helper.dart';
import 'package:CashManager/model/cart_model.dart';
import 'package:CashManager/model/item_model.dart';
import 'package:CashManager/provider/appstore.dart';
import 'package:CashManager/screen/cart_screen.dart';
import 'package:CashManager/screen/menu/menu%20screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  DBHelper dbHelper = DBHelper();

  List<Item> products = [
    Item(
        name: 'Mango',
        unit: 'Doz',
        price: 3000,
        image: 'assets/images/mango.png'),
    Item(
        name: 'Banana',
        unit: 'Doz',
        price: 1000,
        image: 'assets/images/banana.png'),
    Item(
        name: 'Grapes',
        unit: 'Kg',
        price: 8000,
        image: 'assets/images/grapes.png'),
    Item(
        name: 'Water Melon',
        unit: 'Kg',
        price: 2500,
        image: 'assets/images/watermelon.png'),
    Item(name: 'Kiwi', unit: 'Pc', price: 4000, image: 'assets/images/kiwi.png'),
    Item(
        name: 'Apple', unit: 'Kg', price: 2000, image: 'assets/images/apple.png'),
    Item(
        name: 'Orange',
        unit: 'Doz',
        price: 1500,
        image: 'assets/images/orange.png'),
    Item(name: 'Peach', unit: 'Pc', price: 8000, image: 'assets/images/peach.png'),
    Item(
        name: 'Strawberry',
        unit: 'Box',
        price: 1200,
        image: 'assets/images/strawberry.png'),
    Item(
        name: 'Fruit Basket',
        unit: 'Kg',
        price: 5500,
        image: 'assets/images/fruitBasket.png'),
  ];

  //List<bool> clicked = List.generate(10, (index) => false, growable: true);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<AppState>(context);
    void saveData(int index) {
      dbHelper
          .insert(
        Cart(
          id: index,
          productId: index.toString(),
          productName: products[index].name,
          initialPrice: products[index].price,
          productPrice: products[index].price,
          quantity: ValueNotifier(1),
          unitTag: products[index].unit,
          image: products[index].image,
        ),
      )
          .then((value) {
        cart.addTotalPrice(products[index].price.toDouble());
        cart.addCounter();
        if (kDebugMode) {
          print('Product Added to cart');
        }
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print(error.toString());
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xff184098),
                ),
                onPressed: () {
                  showAlerte(
                      context, (MediaQuery.of(context).size.width / 3) * 2);
                },
                iconSize: 50,
              ),
            ),
          ],
        ),
        actions: [
          Badge(
            badgeContent: Consumer<AppState>(
              builder: (context, value, child) {
                return Text(
                  value.getCounter().toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                );
              },
            ),
            position: const BadgePosition(start: 30, bottom: 30),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blueGrey.shade200,
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image(
                          height: 80,
                          width: 80,
                          image: AssetImage(products[index].image.toString()),
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5.0,
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: TextSpan(
                                    text: 'Nom: ',
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontSize: 16.0),
                                    children: [
                                      TextSpan(
                                          text:
                                              '${products[index].name.toString()}\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                              RichText(
                                maxLines: 1,
                                text: TextSpan(
                                    text: 'Quantité: ',
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontSize: 16.0),
                                    children: [
                                      TextSpan(
                                          text:
                                              '${products[index].unit.toString()}\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                              RichText(
                                maxLines: 1,
                                text: TextSpan(
                                    text: 'Prix: ',
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontSize: 16.0),
                                    children: [
                                      TextSpan(
                                          text:
                                              '${products[index].price.toString()} FCFA\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey.shade900),
                            onPressed: () {
                              saveData(index);
                            },
                            child: const Text('Ajouter au panier')),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
