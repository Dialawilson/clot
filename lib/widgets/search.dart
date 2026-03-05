import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Search", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search, color: Colors.black54, size: 20),
              hintText: 'Search for products, brands and more',
              elevation: const WidgetStatePropertyAll<double>(2),
              backgroundColor: const WidgetStatePropertyAll<Color>(Colors.white),
            );
          },
          suggestionsBuilder: (BuildContext context, SearchController controller) {
            // ✅ Wrap suggestions in a ListView so they have bounded constraints
            return ListView.builder(
              shrinkWrap: true, // prevents infinite height
              itemCount: 5,
              itemBuilder: (context, index) {
                final String item = 'Search suggestion $index';
                return ListTile(
                  leading: const Icon(Icons.history, color: Colors.black54, size: 20),
                  title: Text(item),
                  trailing: const Icon(Icons.north_west, size: 16),
                  onTap: () {
                    controller.closeView(item);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
