import 'package:driver_app/Modules/Register/Address/addressForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'addressController.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('Register Address'),
        ),
        body: SingleChildScrollView(
          child: addressForm(),
        ),
      ),
    );
  }
}
