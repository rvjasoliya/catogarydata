import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'categorycreationscreen.dart';
import 'categorydetails.dart';
import 'model/categorydatamodel.dart';


class ListingScreen extends StatefulWidget {
  const ListingScreen({Key? key}) : super(key: key);

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  final TextEditingController editingController = TextEditingController();
  List<Data> categorySearch = [];
  bool isVisible =  false;
  String _searchText = "";
  CategoryDataModel? userList;//aama to akhu list che ha to ae thodu ave ae to data mate che apde parent ne subcategory alag kari che
  List<Data> parentCategoryList = [];//ama apde parent store karavya che ha 0 val;a ne ha
  Map<String,List<Data>> map= Map();//string,list string_>category id,list apde ae category na child

  Future<List<Data>?> fetchData() async {
    if(userList == null)
      {
        String data =
        await DefaultAssetBundle.of(context).loadString("assets/CategoryData.json");
        final jsonResult = json.decode(data);
        userList = CategoryDataModel.fromJson(jsonResult);
        if (kDebugMode) {
          print(jsonResult);
          print(userList);
        }
        parentCategory();
        //setState(() {});
      }
    return userList!.data;
  }

   parentCategory() async {
    for(int i =0; i< userList!.data!.length; i++) {
      if (userList!.data![i].parentID == "0") {
        Data listItem = userList!.data![i];
        parentCategoryList.add(listItem);
        /*if (kDebugMode) {
          print(parentCategoryList);
        }*/
      }
    }
      for(int j=0;j< parentCategoryList.length; j++){
        List<Data>? list=map['${parentCategoryList[j].categoryId}'];
        for(int k =0; k < userList!.data!.length; k++){
          if(parentCategoryList[j].categoryId == userList!.data![k].parentID){
            if(list!=null && list.length>0)
            {
              list.add(userList!.data![k]);
              map['${parentCategoryList[j].categoryId}']=list;
            }
            else{
              list = [];
              list.addAll(List.filled(1,userList!.data![k]));
              map['${parentCategoryList[j].categoryId}']= list;

            }
          }
        }
      }
  }



  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    parentCategoryList = categorySearch;
    editingController.addListener(() {
      if (editingController.text.isEmpty) {
        setState(() {
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          _searchText = editingController.text;
          _buildSearchList();
        });
      }
    });
  }
  Object _buildSearchList() {
    if (_searchText.isEmpty) {
      return parentCategoryList = categorySearch;
    } else {
      parentCategoryList = categorySearch
          .where((element) => element.name![0].value!.toLowerCase().contains(_searchText
          .toLowerCase()) /*element.city.toLowerCase().contains(_searchText.toLowerCase())*/)
          .toList();
      if (kDebugMode) {
        print('${parentCategoryList.length}');
      }
      return parentCategoryList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white12,
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.only(
                  left: 8.0, right: 10.0, top: 10.0, bottom: 10.0),
              child: TextField(
                onChanged: (value) {
                  userList!.data!.length;
                },
                controller: editingController,
                decoration: const InputDecoration(
                  labelText: 'Search Category',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Robot',
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'Search Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  contentPadding:
                  EdgeInsets.only(top: 10, left: 20, bottom: 10),
                ),
              ),
            ),
            const SizedBox(height: 5),
           /* Expanded(
              child: userList!.data != null
                  ? ListView.builder(
                itemCount: userList!.data == null ? 0  : userList!.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Text(
                        '${userList!.data![index].name![index].value}',
                        style: const TextStyle(color: Colors.black,fontSize: 11),

                      ),
                      const Divider(),
                      Text(
                        '${userList!.data![index].description}',
                        style: const TextStyle(color: Colors.black,fontSize: 11),

                      ),
                    ],
                  );
                },
              )
                  :const CircularProgressIndicator(),
            ),*/
            FutureBuilder<List<Data>?>(
              future: fetchData(),
              builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData)
                    {
                      return Expanded(
                        child: ListView.builder(//ama pan click vadu avse aae ma to kya screen aave che
                          itemCount: parentCategoryList == null ? 0 :parentCategoryList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14.0),//main category to parent mathiavse ne ha to
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  CategoryDetails(data: parentCategoryList[index],name: '',)));
                                      },
                                      child: Text(
                                        '${parentCategoryList[index].name![0].value}',//ok aarite ne ha
                                        style: const TextStyle(color: Colors.black,fontSize: 11),

                                      ),
                                    ),
                                  ),
                                  Padding (
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: (){
                                        setState(() {
                                          isVisible = !isVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ],),
                                /*Text(
                                  '${parentCategoryList[index].description}',
                                  style: const TextStyle(color: Colors.black,fontSize: 11),

                                ),*/
                                const Divider(thickness: 1.5),
                                Visibility(
                                  visible: isVisible,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                        physics: ClampingScrollPhysics(),
                                    itemCount: map[parentCategoryList[index].categoryId] == null ? 0 :map[parentCategoryList[index].categoryId]!.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context , i){
                                        Data data = map[parentCategoryList[index].categoryId]![i];
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: (){//aya pan userlist mathi na ave
                                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  CategoryDetails(data: data,name: parentCategoryList[index].name![0].value,)));
                                            },
                                            child: Text(
                                              '${data.name![0].value}',
                                              style: const TextStyle(color: Colors.green,fontSize: 11),

                                            ),
                                          ),
                                          const Divider(),
                                          /*Text(
                                            '${data.description}',
                                            style: const TextStyle(color: Colors.green,fontSize: 11),

                                          ),*/
                                        ],
                                      );
                                    }
                                )
                                )

                              ],
                            );
                          },
                        ),
                      );
                    }
                    else
                    {
                      return const Center(child: CircularProgressIndicator());
                    }
              },
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black87,
                    primary: Colors.blue[500],
                    minimumSize: Size(110, 40),
                   /* padding: EdgeInsets.symmetric(horizontal: 0),
                    shape: ElevatedButton.styleFrom(
                      primary: ThemeColors.darkBg,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.black)),
                    ),*/
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryCreationScreen()));
                  },
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* listView() async{
    return ListView.builder(
      itemCount: userList!.data == null ? 0 : userList!.data!.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Text(
              '${userList!.data![index].name![index].value}',
              style: const TextStyle(color: Colors.black,fontSize: 11),

        ),
            const Divider(),
            Text(
              '${userList!.data![index].description}',
              style: const TextStyle(color: Colors.black,fontSize: 11),

            ),
          ],
        );
      },
    );
  }*/