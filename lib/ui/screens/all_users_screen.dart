import 'package:admin_app_real_estate/ui/widgets/all_users_widget/all_users_list.dart';
import 'package:flutter/material.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AllUsersList(),
    );
  }
}
