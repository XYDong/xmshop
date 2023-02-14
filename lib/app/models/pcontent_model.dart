// 商品详情
class PContentModel {
  ContentModel? result;

  PContentModel({this.result});

  PContentModel.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? ContentModel?.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.toJson();
    }
    return data;
  }
}

class ContentModel {
  String? sId;
  String? title;
  String? cid;
  int? price;
  int? oldPrice;
  int? isBest;
  int? isHot;
  int? isNew;
  List<PContentAttrModel>? attr;
  int? status;
  String? pic;
  String? content;
  String? cname;
  String? subTitle;
  String? specs;

  ContentModel(
      {this.sId,
      this.title,
      this.cid,
      this.price,
      this.oldPrice,
      this.isBest,
      this.isHot,
      this.isNew,
      this.attr,
      this.status,
      this.pic,
      this.content,
      this.cname,
      this.subTitle,
      this.specs});

  ContentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    oldPrice = json['old_price'];
    isBest = json['is_best'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    if (json['attr'] != null) {
      attr = <PContentAttrModel>[];
      json['attr'].forEach((v) {
        attr?.add(PContentAttrModel.fromJson(v));
      });
    }
    status = json['status'];
    pic = json['pic'];
    content = json['content'];
    cname = json['cname'];
    subTitle = json['sub_title'];
    specs = json['specs'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['cid'] = cid;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['is_best'] = isBest;
    data['is_hot'] = isHot;
    data['is_new'] = isNew;
    if (attr != null) {
      data['attr'] = attr?.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['pic'] = pic;
    data['content'] = content;
    data['cname'] = cname;
    data['sub_title'] = subTitle;
    data['specs'] = specs;
    return data;
  }
}

class PContentAttrModel {
  String? cate;
  List<String>? list;

  PContentAttrModel({this.cate, this.list});

  PContentAttrModel.fromJson(Map<String, dynamic> json) {
    cate = json['cate'];
    list = json['list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cate'] = cate;
    data['list'] = list;
    return data;
  }
}
