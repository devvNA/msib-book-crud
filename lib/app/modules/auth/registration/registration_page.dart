import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'registration_controller.dart';

class RegistrationPage extends GetView<RegistrationController> {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegistrationPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegistrationPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
