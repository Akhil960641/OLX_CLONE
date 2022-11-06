import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olx_flutter/Item_sell.dart';

import 'Sample.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent, actions: [
        FloatingActionButton(
          heroTag: null,
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: Text('LogOut'),
          backgroundColor: Colors.grey,
        )
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Products',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Expanded(
            child: Container(
              width: size.width,

              child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection('name').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      var productList = snapshot.data!.docs;
                      return ListView.separated(
                        itemCount: productList.length,

                        itemBuilder: (context, index) {
                          return ViewList(
                            productName: productList[index]['product name'],
                            price: productList[index]['price'],
                            imageUrl: productList[index]['imageUrl'],
                          );

                        },
                        separatorBuilder:(context, index) => Divider(),
                      );
                    } else {
                      return Text(snapshot.error.toString());
                    }
                  }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ItemSell();
            },
          ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Stack(
              // mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Positioned(
                    left: 180,
                    top: 40,
                    child: Text(
                      "SELL",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )),
    );
  }
}
