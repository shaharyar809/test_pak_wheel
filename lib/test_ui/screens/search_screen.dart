import 'package:flutter/material.dart';
// import 'package:your_project_name/screens/advanced_search_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> popularCars = [
    'Daihatsu Mira',
    'Honda City',
    'Honda Civic',
    'Suzuki Alto',
    'Suzuki Cultus',
    'Suzuki Mehran',
    'Toyota Corolla',
    'Toyota Land Cruiser',
    'Toyota Prado',
    'Toyota Vitz',
  ];
  List<String> filteredCars = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCars = popularCars;
    searchController.addListener(_filterCars);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterCars() {
    setState(() {
      filteredCars = popularCars
          .where((car) => car.toLowerCase().contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _showAdvancedSearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdvancedSearchScreen()),
    );
  }

  void _showCarDetails(BuildContext context, String car) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selected car: $car')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search used cars',
            border: InputBorder.none,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextButton(
                onPressed: () => _showAdvancedSearch(context),
                child: Text(
                  'Advanced Search',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Popular Used Cars',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCars.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      title: Text(filteredCars[index]),
                      onTap: () => _showCarDetails(context, filteredCars[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdvancedSearchScreen extends StatelessWidget {
  const AdvancedSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advanced Search"),
      ),
      body: Center(
        child: Text("Advanced search options go here."),
      ),
    );
  }
}