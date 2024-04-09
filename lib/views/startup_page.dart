import 'package:dantia/views/invest_page.dart';
import 'package:flutter/material.dart';

class StartupListPage extends StatefulWidget {
  @override
  _StartupListPageState createState() => _StartupListPageState();
}

class _StartupListPageState extends State<StartupListPage> {
  final List<Startup> _startups = [
    Startup(
      name: 'Mantra Water Inc.',
      description:
          'Mantra Water Inc.: Providing innovative solutions for clean water access, purification, and conservation through advanced technology and sustainable practices.',
      logoUrl:
          'https://static.vecteezy.com/system/resources/previews/013/401/597/original/water-recycle-icon-logo-arrow-recycle-with-water-drop-free-vector.jpg',
    ),
    Startup(
      name: 'Geo Agritech',
      description:
          'Geo Agritech: Revolutionizing agriculture with cutting-edge technology and data-driven insights to enhance crop yield, sustainability, and farmer livelihoods.',
      logoUrl:
          'https://i.pinimg.com/236x/cb/a9/35/cba93519ab1a7f401e350d2c8f57e431.jpg',
    ),
    Startup(
      name: 'CO2 Capture',
      description:
          'CO2 Capture: Pioneering carbon capture technology to combat climate change and reduce greenhouse gas emissions for a cleaner and sustainable future.',
      logoUrl:
          'https://cdn2.vectorstock.com/i/1000x1000/57/66/co2-absorption-logo-with-two-trees-and-text-vector-43855766.jpg',
    ),
    Startup(
      name: 'Recycle Now Inc.',
      description:
          'Recycle Now Inc.: Empowering communities to embrace recycling and waste management practices through education, technology, and eco-friendly solutions.',
      logoUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQpNGt5JgZO1uBEo6EOZBYpZxIEW5Ab3S0h94tzhSsYg&s',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Startup List'),
      ),
      body: ListView.builder(
        itemCount: _startups.length,
        itemBuilder: (context, index) {
          return StartupCard(startup: _startups[index]);
        },
      ),
    );
  }
}

class Startup {
  final String name;
  final String description;
  final String logoUrl;

  Startup({
    required this.name,
    required this.description,
    required this.logoUrl,
  });
}

class StartupCard extends StatelessWidget {
  final Startup startup;

  StartupCard({required this.startup});

  void navigateToInvestPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => InvestPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.05),
          blurRadius: 10,
          spreadRadius: 0.01,
          offset: Offset(0, 5),
        ),
      ]),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    child: Image.network(
                      startup.logoUrl,
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    startup.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(startup.description),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () => navigateToInvestPage(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    child: Text(
                      "Invest",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
