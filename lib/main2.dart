import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedButton = 'Categories'; // Default selected button
  int orderCount = 0; // Initial order count

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Section 1 to Section 3 (Existing code)

          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    // Handle menu button press
                  },
                ),
                Text('HOME'),
                SizedBox(width: 50),
              ],
            ),
          ),

          // Section 2 (User Info)
          ListTile(
            title: Container(
              color: Colors.white,
              height: 150,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Icon(Icons.person,color: Colors.blue),
                    ],
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey, Ahmed',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Explore diverse real estate services for all your needs: property management, construction, insurance, and more in one place',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Section 3 (SlideView)
          // Add your SlideView widget here
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              enlargeCenterPage: true,
              viewportFraction: 1.0, // تعيينه إلى 1.0 لجعل السلايد يمتلئ بالكامل
            ),
            items: [
              buildSlide('management platform real estate', 'Request', 'assets/Request.jpg', Colors.red),
              buildSlide('multi service for real estate', 'Order', 'assets/Order.jpg',Colors.red),
              buildSlide('Leassing, Mintaince and mange your properties with ease', 'My Asset', 'assets/MyAsset.jpg',Colors.red),
            ],
          ),


          // Section 4 (Buttons)
          ListTile(
            title: Container(
              color: Colors.white,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Categories button press
                      setState(() {
                        selectedButton = 'Categories';
                      });
                    },
                    child: Text('Categories'),
                    style: ElevatedButton.styleFrom(
                      primary: selectedButton == 'Categories' ? Colors.red : null,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Service button press (same as Order button press for now)
                      setState(() {
                        selectedButton = 'Service';
                      });
                    },
                    child: Text('Service'),
                    style: ElevatedButton.styleFrom(
                      primary: selectedButton == 'Service' ? Colors.red : null,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Order button press
                      setState(() {
                        selectedButton = 'Order';
                      });
                    },
                    child: Text('Order ($orderCount)'),
                    style: ElevatedButton.styleFrom(
                      primary: selectedButton == 'Order' ? Colors.red : null,
                    ),
                  ),
                ],
              ),
            ),
          ),


          // Section 5 (Categories View)
          if (selectedButton == 'Categories')
            ListTile(
              title: Container(
                color: Colors.white,
                height: 60,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text('Categories View'),
                    SizedBox(width: 160),
                    GestureDetector(
                      onTap: () {
                        // Handle 'see all' press
                      },
                      child: Text('See All'),
                    ),
                  ],
                ),
              ),
            ),

          // Section 6 (Categories Details or No Order Found)
          if (selectedButton == 'Categories')
            ListTile(
              title: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.build, color: Colors.redAccent), // Add color property
                        SizedBox(width: 10),
                        Text('Construction'),
                        Spacer(),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.security, color: Colors.redAccent), // Add color property
                        SizedBox(width: 10),
                        Text('Insurance'),
                        Spacer(),
                        Icon(Icons.arrow_forward),
                      ],
                    ),


                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.gavel,  color: Colors.redAccent),
                        SizedBox(width: 10),
                        Text('Legal'),
                        Spacer(),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.shopping_cart, color: Colors.redAccent),
                        SizedBox(width: 10),
                        Text('Buy & Sell'),
                        Spacer(),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.account_balance, color: Colors.redAccent),
                        SizedBox(width: 10),
                        Text('Accounting Service'),
                        Spacer(),
                        Icon(Icons.arrow_forward),
                      ],
                    ),

                    // ... (other rows)
                  ],
                ),
              ),
            )
          else if (selectedButton == 'Order')
            ListTile(
              title: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/NoOrderFound.jpg',
                      fit: BoxFit.cover,
                      height: 200.0,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'No Order Found',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'You can place your needed orders to let us serve you.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            )
          else if (selectedButton == 'Service')
              ListTile(
                title: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/NoListFound.jpg',
                        fit: BoxFit.cover,
                        height: 200.0,
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'No List Found',
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'You can place your needed service to let us serve you.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
          SizedBox(
            height: 40,
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Set the type to fixed
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Assets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
      // ... (bottomNavigationBar and other parts)
    );
  }
}

Widget buildSlide(String text, String buttonText, String imagePath,Color buttonColor) {
  return Container(
    color: Colors.white,
    child: Row(
      children: [
        // Right side (text and button)
        Expanded(
          flex: 3, // Adjust the flex value as needed
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text(buttonText),
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Left side (image)
        Expanded(
          flex: 2, // Adjust the flex value as needed
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 200.0,
          ),
        ),
      ],
    ),
  );
}
