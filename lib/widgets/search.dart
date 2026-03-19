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
            final keyword = controller.value.text;
            return List <ListTile>.generate(5,(int index){
              final String item = 'Result $index for "$keyword"';
              return ListTile(
                leading:const Icon(Icons.history, size: 20),
                title: Text(item, style: const TextStyle(fontSize: 14)),
                onTap: (){
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
