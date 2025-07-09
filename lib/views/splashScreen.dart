import 'package:bookane/pages/inicio.dart';
import 'package:bookane/views/login_page.dart';
import 'package:bookane/views/overview_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart/user_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // Show loading spinner while loading token
    if (userProvider.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // After token is loaded, decide what to show
    return userProvider.isLoggedIn
        ? const OverViewPage()
        : const Inicio();
  }
}
