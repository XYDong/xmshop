class OrderModel {
  bool? success;
  String? message;
  List<OrderInfoModel>? result;

  OrderModel({this.success, this.message, this.result});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['result'] != null) {
      result = <OrderInfoModel>[];
      json['result'].forEach((v) {
        result!.add(OrderInfoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderInfoModel {
  String? sId;
  String? uid;
  String? name;
  String? phone;
  String? address;
  String? allPrice;
  String? orderId;
  int? addTime;
  int? payStatus;
  int? orderStatus;
  List<OrderItemModel>? orderItem;

  OrderInfoModel(
      {this.sId,
      this.uid,
      this.name,
      this.phone,
      this.address,
      this.allPrice,
      this.orderId,
      this.addTime,
      this.payStatus,
      this.orderStatus,
      this.orderItem});

  OrderInfoModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uid = json['uid'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    allPrice = json['all_price'];
    orderId = json['order_id'];
    addTime = json['add_time'];
    payStatus = json['pay_status'];
    orderStatus = json['order_status'];
    if (json['order_item'] != null) {
      orderItem = <OrderItemModel>[];
      json['order_item'].forEach((v) {
        orderItem!.add(OrderItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['uid'] = uid;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['all_price'] = this.allPrice;
    data['order_id'] = this.orderId;
    data['add_time'] = this.addTime;
    data['pay_status'] = this.payStatus;
    data['order_status'] = this.orderStatus;
    if (this.orderItem != null) {
      data['order_item'] = this.orderItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItemModel {
  String? sId;
  String? orderId;
  String? productTitle;
  String? productId;
  int? productPrice;
  String? productImg;
  int? productCount;
  String? selectedAttr;
  int? addTime;

  OrderItemModel(
      {this.sId,
      this.orderId,
      this.productTitle,
      this.productId,
      this.productPrice,
      this.productImg,
      this.productCount,
      this.selectedAttr,
      this.addTime});

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderId = json['order_id'];
    productTitle = json['product_title'];
    productId = json['product_id'];
    productPrice = json['product_price'];
    productImg = json['product_img'];
    productCount = json['product_count'];
    selectedAttr = json['selected_attr'];
    addTime = json['add_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['order_id'] = this.orderId;
    data['product_title'] = this.productTitle;
    data['product_id'] = this.productId;
    data['product_price'] = this.productPrice;
    data['product_img'] = this.productImg;
    data['product_count'] = this.productCount;
    data['selected_attr'] = this.selectedAttr;
    data['add_time'] = this.addTime;
    return data;
  }
}
