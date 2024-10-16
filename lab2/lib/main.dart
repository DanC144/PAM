import 'package:flutter/material.dart';

void main() {
  runApp(BarbershopApp());
}

class BarbershopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarberHomeScreen(),
    );
  }
}

class BarberHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(
                      'Yogyakarta',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 4), // Space between location and name
                Text(
                  'Joe Samanta',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
            CircleAvatar(
              backgroundImage: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixlr.com%2Fimage-generator%2F&psig=AOvVaw2m0UpMRcRCgTFtCuAeamzd&ust=1729108406012000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLjzwvSUkYkDFQAAAAAdAAAAABAJ'), // Use a profile image URL
              radius: 20,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Booking Banner
            Container(
              height: 300, // Set height to 300 pixels
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  // Background content
                  Positioned.fill(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8),
                              SizedBox(width: 30),// Space at the top
                            ],
                          ),
                        ),
                        Container(
                          width: 140, // Adjust the width as needed
                          height: 200, // Set the height for the image
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://www.shutterstock.com/image-photo/amazed-screaming-young-bearded-man-260nw-1151947016.jpg', // Placeholder barber image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Booking Now Button at the bottom left
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add booking action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Updated button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'Booking Now',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Search bar with filter button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search barber’s, haircut services...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8), // Add space between the TextField and the button
                Container(
                  width: 48, // Square size for the button
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add filter action here
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(), // Square shape for the button
                      padding: EdgeInsets.zero, // No padding to center the icon
                      backgroundColor: Colors.blue, // Button color
                    ),
                    child: Icon(Icons.tune, color: Colors.white), // Filter icon
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Nearest Barbershop Section
            Text('Nearest Barbershop',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                barbershopCard('Alana Barbershop', 'Haircut massage & Spa',
                    'Banguntapan', '5 km', 4.5),
                barbershopCard('Hercha Barbershop', 'Haircut & Styling',
                    'Jalan Kaliurang', '6 km', 5.0),
                barbershopCard('Barberking', 'Haircut styling & massage',
                    'Jogja Expo Centre', '12 km', 4.5),
              ],
            ),
            SizedBox(height: 16),

            // "See All" Button above Most recommended section
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add action to see all recommended barbershops
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Background color
                  foregroundColor: Colors.blue, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.blue), // Blue border
                  ),
                ),
                child: Text('See All'),
              ),
            ),
            SizedBox(height: 24),

            // Most recommended section
            Text('Most recommended',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

            // Large Barber Card
            largeBarberCard('Masterpiece Barbershop', 'Haircut styling',
                'Jogja Expo Centre', '2 km', 5.0),
            SizedBox(height: 16),

            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                barbershopCard('Varcity Barbershop Jogja', 'The Varcher',
                    'Condongcatur', '10 km', 4.5),
                barbershopCard('Barberman', 'Haircut styling & massage',
                    'J-Walk Centre', '17 km', 4.5),
                barbershopCard('Barberman', 'Haircut styling & massage',
                    'J-Walk Centre', '17 km', 4.5),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget barbershopCard(String title, String description, String location,
      String distance, double rating) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Container(
          width: 80, // Fixed width for the image
          height: 80, // Fixed height for the image
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://images.newrepublic.com/9bba0e56c589fb3e06191969202abb446327a86a.jpeg?auto=format&fit=crop&crop=faces&q=65&w=1000&h=undefined&ar=3%3A2&ixlib=react-9.0.2&w=1000', // Placeholder image for barbershop
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            SizedBox(height: 4),
            Text('$location • $distance'),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 16),
                SizedBox(width: 4),
                Text(rating.toString(), style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget largeBarberCard(String title, String description, String location,
      String distance, double rating) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200, // Fixed height for the large image
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                'https://plus.unsplash.com/premium_photo-1661381038438-a1eb0348be72?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFyYmVyJTIwc2hvcHxlbnwwfHwwfHx8MA%3D%3D', // Placeholder image for large barbershop
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(description),
                SizedBox(height: 4),
                Text('$location • $distance'),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 4),
                    Text(rating.toString(), style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
