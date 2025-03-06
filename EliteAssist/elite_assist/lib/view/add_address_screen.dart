import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:elite_assist/controller/address_controller.dart';
import 'package:elite_assist/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_ui/custom_appbar.dart';

class AddAddressScreen extends StatelessWidget {
  Address? address;

  AddAddressScreen({super.key, this.address});

  final controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    setValue();
    return Scaffold(
      appBar: CustomAppBar(
        title: address != null ? 'Edit Address' : 'Add New Address',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomRadioButton(
                  unSelectedColor: Colors.white,
                  selectedColor: Colors.black,
                  defaultSelected:
                      address != null ? address!.type : controller.addressType,
                  buttonLables: ['Home', 'Office', 'Other'],
                  buttonValues: ['Home', 'Office', 'Other'],
                  radioButtonValue: (value) {
                    controller.addressType = value;
                  },
                  enableShape: true,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: controller.houseNoController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'House No. / Office No.',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.streetController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Street Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.landmarkController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Landmark',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.areaController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Area',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.cityController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.stateController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'State',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.pinCodeController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    labelText: 'Pin code',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  child: Obx(
                    () {
                      if (controller.isAddressAdd.value) {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else {
                        return FilledButton(
                          onPressed: () {
                            if (address != null) {
                              controller.updateAddress(id: address!.id);
                            } else {
                              controller.addAddress();
                            }
                          },
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.black,
                          ),
                          child: Text(
                            address != null ? 'Update Address' : 'Add Address',
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setValue() {
    if (address != null) {
      controller.houseNoController.text = address!.houseno;
      controller.streetController.text = address!.street;
      controller.landmarkController.text = address!.landmark;
      controller.areaController.text = address!.area;
      controller.cityController.text = address!.city;
      controller.stateController.text = address!.state;
      controller.pinCodeController.text = address!.pincode;
      controller.addressType = address!.type;
    } else {
      controller.clear();
    }
  }
}
