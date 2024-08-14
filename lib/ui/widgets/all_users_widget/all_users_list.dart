import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/font_style/font_styles.dart';
import 'package:admin_app_real_estate/provider/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllUsersList extends StatefulWidget {
  const AllUsersList({super.key});

  @override
  State<AllUsersList> createState() => _AllUsersListState();
}

class _AllUsersListState extends State<AllUsersList> {
  @override
  void dispose() {
    UserProvider.searchData = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          height: MediaQuery.of(context).size.height * 0.04,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: themeColor.withOpacity(0.4), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 7, // Blur radius
                offset: const Offset(0, 3), // Offset
              ),
            ],
          ),
          child: TextFormField(
            style: poppins(
                fontSize: 20, fontWeight: FontWeight.w300, color: themeColor),
            textAlign: TextAlign.center,
            onChanged: (value) {
              setState(() {
                UserProvider.searchData = value;
              });
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(0, 5, 80, 0),
              hintText: 'Search users',
              hintStyle: poppins(
                  fontSize: 19, fontWeight: FontWeight.w300, color: themeColor),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Icon(
                  Icons.search,
                  color: themeColor,
                  size: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
              stream: userProvider.getAllUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(color: themeColor));
                }
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    'Error: ${snapshot.error}',
                    style: poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: errorColor),
                  ));
                }
                final searchData = UserProvider.searchData.toLowerCase();

                final userDocs = snapshot.data?.docs ?? [];
                var filteredUsers = userDocs.where((user) {
                  final userData = user.data() as Map<String, dynamic>;
                  final userName =
                      userData['userName'].toString().toLowerCase();
                  return userName.contains(searchData);
                }).toList();
                userProvider.getUsersCount();
                userProvider.getPropertiesCount();
                return ListView.builder(
                  itemCount:
                      filteredUsers.length >= 10 ? 10 : filteredUsers.length,
                  itemBuilder: (context, index) {
                    final userDoc = filteredUsers[index];
                    final userData = userDoc.data() as Map<String, dynamic>;

                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: themeColor,
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
              }),
        ),
      ],
    );
  }
}
