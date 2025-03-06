import 'dart:developer';

import 'package:elite_assist/common_ui/custom_snackbar.dart';
import 'package:elite_assist/generated/const_data.dart';
import 'package:elite_assist/generated/pref_manager.dart';
import 'package:elite_assist/model/address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddressController extends GetxController {
  PrefManager manager = PrefManager();
  AddressModel? model;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  String addressType = 'Home';
  RxString addressData = ''.obs;
  List<String> addressList = [];
  final houseNoController = TextEditingController();
  final streetController = TextEditingController();
  final landmarkController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pinCodeController = TextEditingController();

  RxBool isAddressAdd = false.obs;

  Future<void> addAddress() async {
    try {
      isAddressAdd.value = true;
      final url = Uri.parse(ConstantData.ADD_ADDRESS_API);
      var response = await http.post(
        url,
        body: {
          "houseno": houseNoController.text.trim(),
          "street": streetController.text.trim(),
          "landmark": landmarkController.text.trim(),
          "area": areaController.text.trim(),
          "city": cityController.text.trim(),
          "state": stateController.text.trim(),
          "pincode": pinCodeController.text.trim(),
          "type": addressType,
          "uid": manager.getUserId()
        },
      );
      if (response.statusCode == 200) {
        //log(response.body, name: "ADDRESS ADD");
        model = addressModelFromJson(response.body);
        isAddressAdd.value = false;
        clear();
        Get.back();
        getAddress();
        CustomSnackBar(
          message: "New Address Will Registered",
          title: "Address Added",
        );
      }
    } catch (e) {
      log(e.toString(), name: "ADDRESS ADD ERROR");
      isAddressAdd.value = false;
    }
  }

  RxBool isAddressGet = false.obs;

  Future<void> getAddress() async {
    try {
      isAddressGet.value = true;
      final url = Uri.parse(ConstantData.GET_ADDRESS_API);
      var response = await http.post(
        url,
        body: {"uid": manager.getUserId()},
      );
      if (response.statusCode == 200) {
        //log(response.body, name: "GET ADDRESS");
        model = addressModelFromJson(response.body);

        addressList.clear();
        for (var address in model!.address) {
          String formattedAddress =
              '${address.houseno}, ${address.street}, ${address.landmark}, ${address.area}, ${address.city}, ${address.state} - ${address.pincode}';
          addressList.add(formattedAddress);
        }

        if (addressList.isNotEmpty) {
          addressList = addressList.toSet().toList();
          addressData.value = addressList[0];
        }

        isAddressGet.value = false;
      }
    } catch (e) {
      log(e.toString(), name: "ADDRESS GET ERROR");
      isAddressGet.value = false;
    }
  }

  Future<void> updateAddress({required String id}) async {
    try {
      isAddressAdd.value = true;
      final url = Uri.parse(ConstantData.EDIT_ADDRESS_API);
      var response = await http.post(
        url,
        body: {
          "id": id,
          "houseno": houseNoController.text.trim(),
          "street": streetController.text.trim(),
          "landmark": landmarkController.text.trim(),
          "area": areaController.text.trim(),
          "city": cityController.text.trim(),
          "state": stateController.text.trim(),
          "pincode": pinCodeController.text.trim(),
          "type": addressType,
        },
      );
      if (response.statusCode == 200) {
        //log(response.body, name: "ADDRESS ADD");
        model = addressModelFromJson(response.body);
        isAddressAdd.value = false;
        clear();
        Get.back();
        getAddress();
        CustomSnackBar(
          message: "Updated Address Will Registered",
          title: "Address Updated",
        );
      }
    } catch (e) {
      log(e.toString(), name: "ADDRESS UPDATE ERROR");
      isAddressAdd.value = false;
    }
  }

  Future<void> deleteAddress({required String id}) async {
    try {
      final url = Uri.parse(ConstantData.DELETE_ADDRESS_API);
      var response = await http.post(
        url,
        body: {
          'id': id,
        },
      );
      if (response.statusCode == 200) {
        Get.back();
        getAddress();
        CustomSnackBar(
          title: 'Address Deletion Successful',
          message: 'Your address has been successfully removed',
        );
      }
    } catch (e) {
      log(e.toString(), name: "ADDRESS DELETE ERROR");
    }
  }

  void clear() {
    addressType = 'Home';
    houseNoController.clear();
    streetController.clear();
    landmarkController.clear();
    areaController.clear();
    cityController.clear();
    stateController.clear();
    pinCodeController.clear();
  }

  @override
  void onClose() {
    clear();
    super.onClose();
  }
}
