import 'package:flutter/material.dart';
import 'package:housepetall/src/common/constants/constants.dart' as cons;
import 'package:housepetall/src/presentation/layouts/layouts.dart';
import 'package:housepetall/src/presentation/screen/review/routes.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<String> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, ReviewRoutes.root);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Clean(
      child: Column(
        children: [
          Spacer(),
          SvgPicture.asset(cons.Assets.images.splash, width: 300),
          CircularProgressIndicator(color: Colors.deepOrange),
          Spacer(),
          Paragraph(
            '© 2025 Hardwhy Apps. \n All rights reserved.',
            align: TextAlign.center,
            color: Colors.black38,
          ),
          FutureBuilder(
            future: _getAppVersion(),
            builder: (context, snapshot) {
              return Paragraph(
                'Version ${snapshot.data ?? '0.0.1'}',
                align: TextAlign.center,
                color: Colors.black38,
              );
            },
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
