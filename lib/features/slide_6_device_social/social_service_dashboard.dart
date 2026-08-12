// lib/features/home/presentation/widgets/social_device_dashboard.dart
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/color_manager.dart';
import 'package:my_portfolio/config/theme/font_manager.dart';

class SocialDeviceDashboard extends StatelessWidget {
  const SocialDeviceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.9, // Set height constraint for DeviceFrame
      child: DeviceFrame(
        device: Devices.ios.iPhone13,
        isFrameVisible: true,
        orientation: Orientation.portrait,
        screen: Scaffold(
          backgroundColor: const Color(0xFF0F172A), // Dark slate background
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  // Avatar / Profile Pic
                  const CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.indigoAccent,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Kyla Baliao',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontManager.fontFamily,
                      fontSize: FontSize.s18,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Mobile Developer • Flutter & iOS',
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: FontManager.fontFamily,
                      fontSize: FontSize.s12,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Colors.white12),
                  const SizedBox(height: 12),

                  // Social Links List inside iPhone Screen
                  Expanded(
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildSocialCard(
                          icon: Icons.code,
                          title: 'GitHub',
                          subtitle: '@github_username',
                          color: ColorManager.primaryPurle,
                          onTap: () {},
                        ),
                        _buildSocialCard(
                          icon: Icons.work,
                          title: 'LinkedIn',
                          subtitle: 'Connect on LinkedIn',
                          color: Colors.blueAccent,
                          onTap: () {},
                        ),
                        _buildSocialCard(
                          icon: Icons.camera_alt,
                          title: 'Instagram',
                          subtitle: 'Personal & Dev Journey',
                          color: Colors.pinkAccent,
                          onTap: () {},
                        ),
                        _buildSocialCard(
                          icon: Icons.email,
                          title: 'Email',
                          subtitle: 'getintouch@domain.com',
                          color: Colors.tealAccent,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Material(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias, //
        child: ListTile(
          dense: true,
          leading: CircleAvatar(
            radius: 16,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, size: 18, color: color),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontManager.fontFamily,
              fontWeight: FontWeightManager.medium,
              fontSize: FontSize.s14,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.white54,
              fontFamily: FontManager.fontFamily,
              fontSize: FontSize.s12,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: Colors.white38,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
