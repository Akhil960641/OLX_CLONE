import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  ProductList(
      {Key? key,
      required String this.productName,
      required String this.price,
      required String this.imageUrl})
      : super(key: key);
  String imageUrl;
  String productName;

  String price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          bottom: size.height * .01,
          top: size.height * .01,
          left: size.width * .03,
          right: size.width * .03),
      child: Container(
        height: size.height * .23,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: size.width * .4,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * .02),
                      child: Text(
                        productName.toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * .05, left: size.height * .01),
                    child: Row(
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          color: Colors.black,
                          size: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.height * .01),
                          child: Text(
                            price,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       top: size.height * .014,
                  //       left: size.height * .01,
                  //       right: size.height * .01),
                  //   child: Text(
                  //     description,
                  //     style: TextStyle(fontSize: 15, color: Colors.black),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
