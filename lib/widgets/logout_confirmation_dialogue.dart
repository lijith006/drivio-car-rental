import 'package:drivio_car_rental/utils/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../core/constants/app_dimens.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
      ),
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),

      title: Row(
        children: const [
          Icon(Icons.logout, color: Colors.redAccent),
          SizedBox(width: 10),
          Text('Logout', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),

      content: const Text(
        'Are you sure you want to logout?\nYou will need to login again.',
        style: TextStyle(height: 1.4),
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.radius),
            ),
          ),
          onPressed: () {
            final parentContext = Navigator.of(context).context;

            Navigator.pop(context);

            parentContext.read<AuthProvider>().logout();

            Future.delayed(const Duration(milliseconds: 300), () {
              AppSnackBar.show(
                parentContext,
                'Logged out successfully',
                backgroundColor: Colors.green.shade700,
              );
            });
          },

          child: const Text('Logout'),
        ),
      ],
    );
  }
}
