import 'package:flutter/material.dart';
class ViewList extends StatelessWidget {
  ViewList({Key? key,required this.imageUrl,required this.price,required this.productName
    }) : super(key: key);
  String imageUrl;
  String productName;

  String price;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return
       Container(
        width: size.width,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueGrey.shade900, Colors.indigo.shade400]),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(imageUrl,fit: BoxFit.fill,)),
              ),
            ),

            // SizedBox(
            //   height: size.height*.1,
            // ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: size.height*.07
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      productName.toUpperCase(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(price,
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                  )
                ],
              ),
            ),
          ],
        ),
      );


  }
}

