import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertask/carousel_slider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedButton = 'Categories';
  int orderCount = 0;
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      setState(() {
        users = List<User>.from(json.decode(response.body).map((dynamic user) => User.fromJson(user)));
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildAppBar(),
          _buildProfileContainer(),
          _buildCarouselSlider(),
          _buildButtonBar(),
          _buildSelectedButtonContent(),
          SizedBox(height: 40),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildAppBar() {
    return ListTile(
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
    );
  }

  Widget _buildProfileContainer() {
    return ListTile(
      title: Container(
        color: Colors.white,
        height: 150,
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(width: 10),
            Column(
              children: [
                Icon(Icons.person, color: Colors.blue),
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
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
      items: [
        buildSlide('management platform real estate', 'Request', 'assets/Request.jpg', Colors.red),
        buildSlide('multi service for real estate', 'Order', 'assets/Order.jpg', Colors.red),
        buildSlide('Leassing, Mintaince and mange your properties with ease', 'My Asset', 'assets/MyAsset.jpg', Colors.red),
      ],
    );
  }

  Widget _buildButtonBar() {
    return ListTile(
      title: Container(
        color: Colors.white,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildElevatedButton('Categories'),
            _buildElevatedButton('Service'),
            _buildElevatedButton('Order ($orderCount)'),
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton(String buttonText) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedButton = buttonText;
        });
      },
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(
        primary: selectedButton == buttonText ? Colors.red : null,
      ),
    );
  }

  Widget _buildSelectedButtonContent() {
    if (selectedButton == 'Categories') {
      return ListTile(
        title: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (User user in users)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      Text('${user.id}.'),
                      SizedBox(width: 12, height: 20),
                      Text('${user.name}'),
                      Spacer(),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    } else if (selectedButton == 'Order') {
      return ListTile(
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
      );
    } else if (selectedButton == 'Service') {
      return ListTile(
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
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
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
    );
  }
}
