


class CategoryDataModel {
  List<Data>? data;

  CategoryDataModel({this.data});

  CategoryDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? categoryId;
  List<Name>? name;
  String? slug;
  String? description;
  String? parentID;
  int? type;
  String? attributeSet;
  int? categoryNumber;
  int? level;
  bool? featured;
  String? icon;
  List<dynamic>? image;
  bool? status;
  String? createDate;

  Data(
      {this.categoryId,
        this.name,
        this.slug,
        this.description,
        this.parentID,
        this.type,
        this.attributeSet,
        this.categoryNumber,
        this.level,
        this.featured,
        this.icon,
        this.image,
        this.status,
        this.createDate});

  Data.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    if (json['name'] != null) {
      name = <Name>[];
      json['name'].forEach((v) {
        name!.add( Name.fromJson(v));
      });
    }
    slug = json['slug'];
    description = json['description'];
    parentID = json['parentID'];
    type = json['type'];
    attributeSet = json['attributeSet'];
    categoryNumber = json['categoryNumber'];
    level = json['level'];
    featured = json['featured'];
    icon = json['icon'];
    if (json['image'] != null) {
      image = <dynamic>[];
      json['image'].forEach((v) {
        image!.add( v.fromJson(v));
      });
    }
    status = json['status'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    if (name != null) {
      data['name'] = name!.map((v) => v.toJson()).toList();
    }
    data['slug'] = slug;
    data['description'] = description;
    data['parentID'] = parentID;
    data['type'] = type;
    data['attributeSet'] = attributeSet;
    data['categoryNumber'] = categoryNumber;
    data['level'] = level;
    data['featured'] = featured;
    data['icon'] = icon;
    if (image != null) {
      data['image'] = image!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['create_date'] = createDate;
    return data;
  }
}

class Name {
  String? sId;
  String? language;
  String? value;

  Name({this.sId, this.language, this.value});

  Name.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    language = json['language'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['language'] = language;
    data['value'] = value;
    return data;
  }
}