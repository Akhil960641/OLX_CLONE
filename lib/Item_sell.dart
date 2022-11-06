import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ItemSell extends StatefulWidget {
  const ItemSell({Key? key}) : super(key: key);

  @override
  State<ItemSell> createState() => _ItemSellState();
}

class _ItemSellState extends State<ItemSell> {
  TextEditingController ProductName = TextEditingController();
  TextEditingController Price = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? imageurl;

  final ImagePicker _picker = ImagePicker();

  File? imageFile;
  bool _uploading=false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height * .05),
              GestureDetector(
                  onTap: () async {


                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Choose one...'),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () async {
                                      final XFile? photo =
                                          await _picker.pickImage(
                                              source: ImageSource.camera);
                                      setState(() {
                                        if (photo != null) {
                                          imageFile = File(photo.path);
                                        }
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Camera',
                                      style: TextStyle(fontSize: 18),
                                    )),
                                ElevatedButton(
                                    onPressed: () async {
                                      final XFile? image =
                                          await _picker.pickImage(
                                              source: ImageSource.gallery);
                                      Navigator.pop(context);

                                      setState(() {
                                        if (image != null) {
                                          imageFile = File(image.path);
                                        }
                                      });
                                    },
                                    child: Text('Gallery',
                                        style: TextStyle(fontSize: 18))),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: size.height * .07,
                    width: size.width * .7,
                    child: Center(child: Text("Upload Image")),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(4, 4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                //color: Colors.transparent,
                height: size.height * .3,
                width: size.width * .7,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: imageFile == null
                              ? const Center(
                                  child: Text(
                                  'no image',
                                ))
                              : Image.file(imageFile!))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Container(
                width: size.width * .79,
                height: size.height * .1,
                color: Colors.grey.shade100,
                child: TextFormField(
                  controller: ProductName,
                  decoration: InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 95)),
                      hintText: 'Product name'),
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Container(
                width: size.width * .79,
                color: Colors.grey.shade100,
                child: TextFormField(
                  controller: Price,
                  decoration: InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 95)),
                      hintText: 'price'),
                ),
              ),
              SizedBox(height: size.height * .07),
              InkWell(
                  onTap: () async {

                    if (ProductName.text != '' && Price.text != '') {
                      var imageStorage = FirebaseStorage.instance.ref().child('images$ProductName.text');
                      var uploadimage = imageStorage.putFile(imageFile!);
                      imageurl = await imageStorage.getDownloadURL();
                      print(imageurl);


                      FirebaseFirestore.instance.collection('name').add({
                        'product name': ProductName.text,
                        'price': Price.text,
                        'imageUrl':imageurl,
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Successfully'),
                          backgroundColor: Colors.grey));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Enter details'),
                        backgroundColor: Colors.grey,
                      ));
                    }
                  },
                  child: Container(
                    width: size.width * .35,
                    height: size.width * .14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      // color: Colors.yellow,
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(4, 4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text('UPLOAD'),
                    ),
                  )),

                          ],
          ),
        ),
      ),
    );
  }


}
