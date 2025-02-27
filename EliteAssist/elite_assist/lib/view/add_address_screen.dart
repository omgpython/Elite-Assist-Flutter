import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:elite_assist/controller/address_controller.dart';
import 'package:elite_assist/generated/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({super.key});

  final controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Address',
          style: TextStyle(
            fontFamily: Fonts.BebasNeue,
          ),
        ),
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
                  defaultSelected: 'Home',
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
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'House No. / Office No.',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.streetController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Street Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.landmarkController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Landmark',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.areaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Area',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.cityController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.stateController,
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
                            controller.addAddress();
                          },
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.black,
                          ),
                          child: Text('Add Address'),
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
}
