
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'model/categorydatamodel.dart';

class CategoryDetails extends StatefulWidget {
  Data? data;
  String? name;
  CategoryDetails({Key? key, this.data, this.name}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late bool isVisible;
  File? _image;
  File? get imageFile => _image;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Category Deatils',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(),
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            /*Center(
              child: InkWell(
                onTap: (){
                  _selectDialog(context);
                },
                child:  Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.only(top: 7,bottom: 10 ),
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: imageFile == null
                            ?  const ExactAssetImage('assets/image1.png') as ImageProvider
                            :FileImage(imageFile!),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),*/
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0, left: 17),
                  child: Text(
                    'Name(English) :-',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      widget.data!.name![0].value!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          TextStyle(color: Colors.blue.shade500, fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1.2, endIndent: 15, indent: 15),
            const SizedBox(
              height: 5,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0, left: 17),
                  child: Text(
                    'Name(Hindi) :-',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.data!.name![1].value!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue.shade500, fontSize: 13),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1.2, endIndent: 15, indent: 15),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 10),
                  child: Text(
                    'Description :-',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    ' ${widget.data!.description}',
                    overflow: TextOverflow.clip,
                    maxLines: 10,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue.shade500, fontSize: 13),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1.2, endIndent: 15, indent: 15),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 10),
                  child: Text(
                    'Featured :-',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(widget.data!.featured == false
                    ?'NO'
                    :'YES',
                    overflow: TextOverflow.clip,
                    maxLines: 10,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue.shade500, fontSize: 13),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1.2, endIndent: 15, indent: 15),
            const SizedBox(
              height: 5,
            ),
            Visibility(
              visible: widget.data!.parentID == "0" ? false : true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Parent Name :-',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${widget.name}',
                    overflow: TextOverflow.clip,
                    maxLines: 10,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue.shade500, fontSize: 13),
                  ),
                  Container(width: 25),
                ],
              ),
            ),

          ]),
        ),
      ),
    );
  }
 /* _selectDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Product '),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: ()async {
                  var pickedImage = await _picker.pickImage(source: ImageSource.camera);
                  Navigator.pop(context);
                  _image =File(pickedImage!.path);
                  setState(() {});
                },
                child: const Text('Taker Photo'),
              ),
              SimpleDialogOption(
                onPressed: () async {
                  var pickedFile = await _picker.getImage(source: ImageSource.gallery);
                  Navigator.pop(context);
                  _image = File(pickedFile!.path);
                  setState(() {});
                  //await _picker.pickImage(source: ImageSource.gallery);
                },
                child: const Text('Choose From Gallery'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context,);
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        });

  }*/
}
