import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RewardedTokensPage extends StatefulWidget {
  @override
  _RewardedTokensPageState createState() => _RewardedTokensPageState();
}

class _RewardedTokensPageState extends State<RewardedTokensPage> {
  List<Map<String, dynamic>> rewardedTokens = [
    {
      'title': 'How Trees Help Fight Climate Change',
      'tokens': 75,
      'date': '2023-04-07',
      'icon': Icons.eco,
    },
    {
      'title': 'The Benefits of Renewable Energy',
      'tokens': 100,
      'date': '2023-04-05',
      'icon': Icons.power,
    },
    {
      'title': 'Sustainable Transportation Options',
      'tokens': 50,
      'date': '2023-04-03',
      'icon': Icons.directions_car,
    },
    {
      'title': 'Reducing Waste for a Greener Future',
      'tokens': 60,
      'date': '2023-03-30',
      'icon': Icons.delete_sweep,
    },
    {
      'title': 'The Importance of Recycling',
      'tokens': 40,
      'date': '2023-03-25',
      'icon': Icons.recycling,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Climate Benefits Rewards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Rewards',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '325',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement redemption functionality
                  },
                  child: Text('Redeem'),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Expanded(
              child: ListView.separated(
                itemCount: rewardedTokens.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.0),
                itemBuilder: (context, index) {
                  final reward = rewardedTokens[index];
                  return RewardedTokenItem(
                    title: reward['title'],
                    tokens: reward['tokens'],
                    date: reward['date'],
                    icon: reward['icon'],
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

class RewardedTokenItem extends StatelessWidget {
  final String title;
  final int tokens;
  final String date;
  final IconData icon;

  const RewardedTokenItem({
    Key? key,
    required this.title,
    required this.tokens,
    required this.date,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.green,
            size: 32.0,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  DateFormat('yyyy-MM-dd').format(DateTime.parse(date)),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.0),
          Row(
            children: [
              Icon(
                Icons.token,
                color: Colors.green,
                size: 20.0,
              ),
              SizedBox(width: 4.0),
              Text(
                '$tokens',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
