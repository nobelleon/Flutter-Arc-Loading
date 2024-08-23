import 'package:flutter/material.dart';

import 'arcs_loading.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 183, 229),
      body: Center(
        child: ArcsLoading(),
      ),
    );
  }
}
