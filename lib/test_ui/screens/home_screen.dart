import 'package:flutter/material.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PakWheels'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Navigation Buttons
              Container(
                height: 50, // Adjust the height as needed
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryButton(text: 'Used Cars', isSelected: true),
                      CategoryButton(text: 'New Cars'),
                      CategoryButton(text: 'Bikes'),
                      CategoryButton(text: 'Autostore'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Search Bar with Navigation
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search used cars',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Browse Used Cars Section
              Text(
                'Browse Used Cars',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BrowseButton(text: 'Category', isSelected: true),
                  BrowseButton(text: 'Budget'),
                  BrowseButton(text: 'Brand'),
                  BrowseButton(text: 'Model'),
                ],
              ),
              SizedBox(height: 20),
              // Car Categories
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  CarCategory(icon: Icons.settings, text: 'Automatic cars'),
                  CarCategory(icon: Icons.family_restroom, text: 'Family Cars'),
                  CarCategory(icon: Icons.airline_seat_recline_normal, text: '5 Seater'),
                  CarCategory(icon: Icons.car_rental, text: 'Big cars'),
                  CarCategory(icon: Icons.directions_car, text: 'Small cars'),
                  CarCategory(icon: Icons.import_export, text: 'Imported cars'),
                  CarCategory(icon: Icons.door_back_door, text: '4 Door'),
                  CarCategory(icon: Icons.history, text: 'Old Cars'),
                ],
              ),
              SizedBox(height: 30),
              // PakWheels Offerings Section
              Text(
                'PakWheels Offerings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 400, // Adjust the height as needed
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    OfferCard(image: 'assets/sell_it.png', title: 'SELL IT FOR ME'),
                    OfferCard(image: 'assets/car_inspection.png', title: 'CAR INSPECTION'),
                    OfferCard(image: 'assets/certified_cars.png', title: 'CERTIFIED CARS'),
                    OfferCard(image: 'assets/imported_cars.png', title: 'IMPORTED CARS'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'My Ads'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 40), label: 'Sell Now'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CategoryButton({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Action for category button (if needed)
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: isSelected ? Colors.blue : Colors.white,
        onPrimary: isSelected ? Colors.white : Colors.black,
        shape: StadiumBorder(),
      ),
    );
  }
}

class BrowseButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const BrowseButton({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Action for browse button (if needed)
      },
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class CarCategory extends StatelessWidget {
  final IconData icon;
  final String text;

  const CarCategory({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          SizedBox(height: 8),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String image;
  final String title;

  const OfferCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}