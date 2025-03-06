import 'package:elite_assist/controller/address_controller.dart';
import 'package:elite_assist/generated/fonts.dart';
import 'package:elite_assist/view/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  final controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    controller.getAddress();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
        ),
        centerTitle: true,
        title: Text(
          'My Address',
          style: TextStyle(
            fontFamily: Fonts.BebasNeue,
          ),
        ),
      ),
      body: Obx(
        () {
          if (controller.isAddressGet.value) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (controller.model!.address.isEmpty) {
            return Center(
              child: Text(
                'No Address Found!!!',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: Fonts.BebasNeue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return ListView.separated(
              itemCount: controller.model!.address.length,
              itemBuilder: (context, index) {
                var address = controller.model!.address[index];
                return Slidable(
                  startActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          Get.to(
                            () => AddAddressScreen(
                              address: address,
                            ),
                          );
                        },
                        icon: Icons.edit,
                        label: 'Edit',
                        backgroundColor: Colors.green,
                      )
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          showAlertDialog(
                            context: context,
                            id: address.id,
                          );
                        },
                        icon: Icons.delete,
                        label: 'Delete',
                        backgroundColor: Colors.red,
                      )
                    ],
                  ),
                  child: ListTile(
                    leading: Text(
                      address.type,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: Fonts.BonaNovaSC,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      '${address.houseno}, ${address.street}, ${address.landmark}, ${address.area}, ${address.city}, ${address.state} - ${address.pincode}.',
                      style: TextStyle(fontFamily: Fonts.Roboto),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddAddressScreen()),
        backgroundColor: Colors.black,
        tooltip: 'Add New Address',
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void showAlertDialog({required BuildContext context, required String id}) {
    PanaraConfirmDialog.show(
      context,
      title: "Delete Address",
      message: "Are sure want to delete this address?",
      confirmButtonText: "Sure",
      cancelButtonText: "Cancel",
      onTapCancel: Get.back,
      onTapConfirm: () {
        controller.deleteAddress(id: id);
      },
      panaraDialogType: PanaraDialogType.error,
      barrierDismissible: false,
    );
  }
}
