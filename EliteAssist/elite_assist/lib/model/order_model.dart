import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  bool status;
  String message;
  Order order;

  OrderModel({
    required this.status,
    required this.message,
    required this.order,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        status: json["status"],
        message: json["message"],
        order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "order": order.toJson(),
      };
}

class Order {
  String uid;
  String uname;
  String ucontact;
  String pid;
  String pname;
  String ppic;
  String amount;
  String gstAmt;
  String discountAmt;
  String fees;
  String totalAmount;
  String couponCode;
  String orderDate;
  String orderTime;
  String date;
  String time;
  String paymentType;
  String address;
  int status;
  int isAasign;
  DateTime updatedAt;
  DateTime createdAt;
  String id;

  Order({
    required this.uid,
    required this.uname,
    required this.ucontact,
    required this.pid,
    required this.pname,
    required this.ppic,
    required this.amount,
    required this.gstAmt,
    required this.discountAmt,
    required this.fees,
    required this.totalAmount,
    required this.couponCode,
    required this.orderDate,
    required this.orderTime,
    required this.date,
    required this.time,
    required this.paymentType,
    required this.address,
    required this.status,
    required this.isAasign,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        uid: json["uid"],
        uname: json["uname"],
        ucontact: json["ucontact"],
        pid: json["pid"],
        pname: json["pname"],
        ppic: json["ppic"],
        amount: json["amount"],
        gstAmt: json["gst_amt"],
        discountAmt: json["discount_amt"],
        fees: json["fees"],
        totalAmount: json["total_amount"],
        couponCode: json["coupon_code"],
        orderDate: json["order_date"],
        orderTime: json["order_time"],
        date: json["date"],
        time: json["time"],
        paymentType: json["payment_type"],
        address: json["address"],
        status: json["status"],
        isAasign: json["is_aasign"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "uname": uname,
        "ucontact": ucontact,
        "pid": pid,
        "pname": pname,
        "ppic": ppic,
        "amount": amount,
        "gst_amt": gstAmt,
        "discount_amt": discountAmt,
        "fees": fees,
        "total_amount": totalAmount,
        "coupon_code": couponCode,
        "order_date": orderDate,
        "order_time": orderTime,
        "date": date,
        "time": time,
        "payment_type": paymentType,
        "address": address,
        "status": status,
        "is_aasign": isAasign,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
