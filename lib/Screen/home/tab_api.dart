import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<String>> fetchCategories() async {
  final response = await http.get(
    Uri.parse('https://fakestoreapi.com/products/categories'),
  );
  if (response.statusCode == 200) {
    return List<String>.from(json.decode(response.body));
  } else {
    throw Exception('Failed to load categories');
  }
}

// API Service to fetch products in a category
Future<List<dynamic>> fetchProductsByCategory(String category) async {
  final response = await http.get(
    Uri.parse('https://fakestoreapi.com/products/category/$category'),
  );
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load products for $category');
  }
}

class ApiTabBarExamole extends StatelessWidget {
  const ApiTabBarExamole({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API TabBar Example'),
      ),
      body: FutureBuilder(
        future: fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final categories = snapshot.data!;
            return DefaultTabController(
              length: categories.length,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 0,
                  bottom: TabBar(
                    tabs: categories.map((c) => Tab(text: c)).toList(),
                  ),
                ),
                body: TabBarView(
                  children: categories
                      .map((c) => CategoryProductsView(category: c))
                      .toList(),
                ),
              ),
            );
          }
          return const Center(
            child: Text('No categories found.'),
          );
        },
      ),
    );
  }
}

// Main Screen with dynamic TabBar
class CategoryProductsView extends StatefulWidget {
  final String category;
  const CategoryProductsView({super.key, required this.category});

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView>
    with AutomaticKeepAliveClientMixin {
  late Future<List<dynamic>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = fetchProductsByCategory(widget.category);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          return GridView.builder(

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.75,
                mainAxisSpacing: 8.0),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        product['image'],
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        product['title'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const Center(
          child: Text('No products found'),
        );
      },
    );
  }
}
