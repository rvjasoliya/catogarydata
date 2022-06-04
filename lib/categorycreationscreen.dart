
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'model/categorydatamodel.dart';

class CategoryCreationScreen extends StatefulWidget {
  const CategoryCreationScreen({Key? key}) : super(key: key);

  @override
  State<CategoryCreationScreen> createState() => _CategoryCreationScreenState();
}


List<Data>? categoryListData = [];

class _CategoryCreationScreenState extends State<CategoryCreationScreen> {
  TextEditingController description = TextEditingController();
  TextEditingController nameEng = TextEditingController();
  TextEditingController nameHin = TextEditingController();
  File? _image;
  File? get imageFile => _image;
  final ImagePicker _picker = ImagePicker();
  String? Value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Category Create',
              style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold,),
            ),
            actions:  [
              InkWell(
                onTap: (){
                  Data categoryData = Data();
                  categoryData.name![0].value = nameEng.text;
                  categoryData.name![1].value = nameHin.text;
                  categoryData.description =description.text;
                  //categoryData.featured =  Value;
                  //categoryData.image = imageFile ;
                  categoryListData?.add(categoryData);
                  if (kDebugMode) {
                    print(categoryListData);
                  }
                },
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: Text(
                      'Done',
                      textAlign: TextAlign.start,
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
           body: SingleChildScrollView(child: Container(
             margin: const EdgeInsets.only(),
             child: Column(children: [
               const SizedBox(
                 height: 20,
               ),
               Center(
                 child: InkWell(
                   onTap: (){
                     _selectDialog(context);
                   },
                   child:  Container(
                     height: 150,
                     width: 150,
                     margin: const EdgeInsets.only(top: 7,bottom: 10 ),
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
                 height: 15,
               ),
               const Text(
                 'Name(English)',
                 style: TextStyle(
                     color: Colors.black,
                     fontSize: 13,
                     fontWeight: FontWeight.bold),
               ),
               const SizedBox(height: 7),
               Container(
                 margin: const EdgeInsets.only(left: 15,right: 15),
                 child: TextField(
                   controller: nameEng,
                   maxLines: 8,
                   minLines: 1,
                   textAlign: TextAlign.start,
                   decoration:   InputDecoration(
                     label: const Text('Name(English)'),
                     labelStyle: TextStyle(
                       color: Colors.grey.shade600,
                       fontSize: 12,
                       height: 1.5,
                     ),
                     hintText: 'Name(English)',
                     hintStyle:  const TextStyle(
                       color: Colors.black,
                       fontSize: 12,
                       height: 1.5,
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide:
                       BorderSide(color: Colors.grey.shade900, width: 0.1),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderSide:
                       BorderSide(color: Colors.grey.shade900, width: 0.1),
                     ),
                     contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                   ),
                   onSubmitted: (value) async {
                     FocusScope.of(context).unfocus();
                   },
                 ),
               ),
               const SizedBox(height: 10),
               const Text(
                 'Name(Hindi)',
                 style: TextStyle(
                     color: Colors.black,
                     fontSize: 13,
                     fontWeight: FontWeight.bold),
               ),
               const SizedBox(height: 7),
               Container(
                 margin: const EdgeInsets.only(left: 15,right: 15),
                 child: TextField(
                   controller: nameHin,
                   maxLines: 8,
                   minLines: 1,
                   textAlign: TextAlign.start,
                   decoration:   InputDecoration(
                     label: const Text('Name(Hindi)'),
                     labelStyle: TextStyle(
                       color: Colors.grey.shade600,
                       fontSize: 12,
                       height: 1.5,
                     ),
                     hintText: 'Name(Hindi)',
                     hintStyle:  const TextStyle(
                       color: Colors.black,
                       fontSize: 12,
                       height: 1.5,
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide:
                       BorderSide(color: Colors.grey.shade900, width: 0.1),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderSide:
                       BorderSide(color: Colors.grey.shade900, width: 0.1),
                     ),
                     contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                   ),
                   onSubmitted: (value) async {
                     FocusScope.of(context).unfocus();
                   },
                 ),
               ),
               const SizedBox(height: 10),
               const Text(
                 'Description',
                 style: TextStyle(
                     color: Colors.black,
                     fontSize: 13,
                     fontWeight: FontWeight.bold),
               ),
               const SizedBox(height: 7),
               Container(
                 margin: const EdgeInsets.only(left: 15,right: 15),
                 child: TextField(
                   controller: description,
                   maxLines: 8,
                   minLines: 1,
                   textAlign: TextAlign.start,
                   decoration:   InputDecoration(
                     label: const Text('Description'),
                     labelStyle: TextStyle(
                       color: Colors.grey.shade600,
                       fontSize: 12,
                       height: 1.5,
                     ),
                     hintText: 'Description',
                     hintStyle:  const TextStyle(
                       color: Colors.black,
                       fontSize: 12,
                       height: 1.5,
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide:
                       BorderSide(color: Colors.grey.shade900, width: 0.1),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderSide:
                       BorderSide(color: Colors.grey.shade900, width: 0.1),
                     ),
                     contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                   ),
                   onSubmitted: (value) async {
                     FocusScope.of(context).unfocus();
                   },
                 ),
               ),
               const SizedBox(height: 10),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
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
                     child: ListTile(
                       title: const Text("YES"),
                       leading: Radio(
                           value: "YES",
                           activeColor: Colors.green.shade600,
                           groupValue: Value,
                           onChanged: (value){
                             setState(() {
                               Value = value.toString();
                             });
                           }),
                     ),
                   ),
                   Expanded(
                     child: ListTile(
                       title: const Text("No"),
                       leading: Radio(
                           value: "NO",
                           activeColor: Colors.red.shade600,
                           groupValue: Value,
                           onChanged: (value){
                             setState(() {
                               Value = value.toString();
                             });
                           }),
                     ),
                   ),
                 ],
               ),
             ]),
           ),),

        )
    );
  }
  _selectDialog(BuildContext context) async {
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

  }
}
