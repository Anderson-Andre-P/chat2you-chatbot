import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSettingsItem extends StatelessWidget {
  final String name;
  final String email;
  final IconData icon;
  final VoidCallback onPressed;

  const UserSettingsItem({
    required this.name,
    required this.email,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Get.theme.colorScheme.background,
            child: const Icon(
              Icons.person,
              size: 48,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  email,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Icon(icon),
        ],
      ),
    );
  }
}
