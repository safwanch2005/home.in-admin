import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/font_style/font_styles.dart';
import 'package:admin_app_real_estate/provider/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentUsersList extends StatelessWidget {
  const RecentUsersList({super.key});
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return StreamBuilder<QuerySnapshot>(
        stream: userProvider.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: themeColor));
          }
          if (snapshot.hasError) {
            return Center(
                child: Text(
              'Error: ${snapshot.error}',
              style: poppins(
                  fontSize: 20, fontWeight: FontWeight.w300, color: errorColor),
            ));
          }
          final userDocs = snapshot.data?.docs ?? [];
          userProvider.getUsersCount();
          userProvider.getPropertiesCount();
          return ListView.builder(
            itemCount: userDocs.length >= 10 ? 10 : userDocs.length,
            itemBuilder: (context, index) {
              final userDoc = userDocs[index];
              final userData = userDoc.data() as Map<String, dynamic>;

              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: themeColor,
                  // // Use user data for avatar if available
                  // backgroundImage: userData['profilePictureUrl'] != null
                  //     ? NetworkImage(userData['profilePictureUrl'])
                  //     : null,
                ),
                title: Text(
                  userData['userName'] ?? 'No name',
                  style: poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: themeColor),
                ),
                subtitle: Text(
                  userData['email'] ?? 'No email',
                  style: poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: themeColorShade),
                ),
              );
            },
          );
        });
  }
}
