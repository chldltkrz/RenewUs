import 'package:flutter/material.dart';

class CustomAppBarSearch extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBarSearch(this.title);

  @override
  State<CustomAppBarSearch> createState() => _CustomAppBarSearchState();

  @override
  Size get preferredSize => Size.fromHeight(80);
}

class _CustomAppBarSearchState extends State<CustomAppBarSearch> {
  final searchTextFieldController = TextEditingController();

  @override
  void dispose() {
    searchTextFieldController.dispose();
    super.dispose();
  }

  // Function to handle the search logic
  void _performSearch(String query) {
    // Perform your search logic here.
    // For example, you can print the query or filter a list of items.
    print("Search query: $query");

    // Example: Clear the search bar after search (optional)
    searchTextFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFD9DDE7),
      toolbarHeight: 60, // Set AppBar height
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchTextFieldController,
                onSubmitted: (value) {
                  // Handle the search action when the user presses "Enter"
                  _performSearch(value);
                },
                decoration: InputDecoration(
                  hintText: '키워드 검색',
                  hintStyle: TextStyle(
                    color: Color(0xFF182233),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: Color(0xFF182233)),
                    onPressed: () {
                      // Handle the search action when the user presses the search icon
                      _performSearch(
                          searchTextFieldController.value.text.trim());
                    },
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.notifications_none_rounded,
                  color: Color(0xFF182233)),
              onPressed: () {
                print("Notifications button pressed");
              },
            ),
          ],
        ),
      ),
    );
  }
}
