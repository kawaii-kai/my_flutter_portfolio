import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/theme/color_manager.dart';
import 'package:my_portfolio/config/theme/font_manager.dart';
import 'package:my_portfolio/features/slide_6_device_social/device_icon.dart';
import 'package:my_portfolio/features/slide_6_device_social/social_device_model.dart';

class SocialDeviceDashboard extends StatelessWidget {
  final double maxWidth;

  final bool isMobile;

  const SocialDeviceDashboard({
    super.key,
    required this.maxWidth,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final SocialDeviceModel socialDeviceModel = SocialDeviceModel();
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.9,
      child: DeviceFrame(
        device: Devices.ios.iPhone13,
        isFrameVisible: true,
        orientation: Orientation.portrait,
        screen: Scaffold(
          backgroundColor: Colors.white, // Dark slate background
          body: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/iphonePic.jpg', fit: BoxFit.cover),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 12),

                      // App Grid View (Forced 4 columns wide)
                      Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            GridView.builder(
                              shrinkWrap: true, // Required inside ListView
                              physics:
                                  const NeverScrollableScrollPhysics(), // Scroll handled by ListView
                              itemCount: socialDeviceModel.apps.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        4, // Forces exactly 4 icons per row!
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio:
                                        0.85, // Adjusts height-to-width ratio for icon + label text
                                  ),
                              itemBuilder: (BuildContext context, int index) {
                                final app = socialDeviceModel.apps[index];
                                return DeviceIcons(
                                  pic: app['pic'],
                                  label: app['label'],
                                  bColor: app['backgroundColor'],
                                  onTap: () {
                                    // Handle app click action here
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      // Footer branding text
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
