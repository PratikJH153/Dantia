import 'package:dantia/models/post.dart';
import 'package:dantia/models/user.dart';
import 'package:dantia/views/add_post_page.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final List<Post> _posts = [
    Post(
      user: User(
        name: 'John Doe',
        profilePic:
            'https://t4.ftcdn.net/jpg/03/70/29/03/360_F_370290384_K0VEqnA7kgxmabRn0QXiyBCbCyPGWNeh.jpg',
      ),
      text: 'Join our reforestation campaign in NY 🤩',
      imageUrl:
          'https://sustainabletravel.org/wp-content/uploads/Blog-Image-Planting-Tree-Seedling.jpg',
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
    ),
    Post(
      user: User(
        name: 'Jane Smith',
        profilePic:
            'https://cdn.dribbble.com/users/22157/screenshots/4413334/media/5e5a6a2ce7da758b79a9d91e1a3b7232.jpg?resize=400x0',
      ),
      text: "I'm very excited to buy a new electric vehicle 😍",
      imageUrl: '',
      timestamp: DateTime.now().subtract(Duration(days: 1)),
    ),
    Post(
      user: User(
        name: 'Bob Johnson',
        profilePic: 'https://example.com/bobjohnson.jpg',
      ),
      text: 'Charging stations are super cool!',
      imageUrl:
          'https://ygo-assets-websites-editorial-emea.yougov.net/original_images/GettyImages-1191005705.jpg',
      timestamp: DateTime.now().subtract(Duration(days: 3)),
    ),
    Post(
      user: User(
        name: 'Sarah Lee',
        profilePic: 'https://example.com/sarahlee.jpg',
      ),
      text:
          'Guys! You should checkout the Amazon environment friendly products.',
      imageUrl: '',
      timestamp: DateTime.now().subtract(Duration(days: 5)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => AddPostPage()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: _posts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _pickImage() {
    // Implement image picking logic
  }

  void _submitPost() {
    // Implement post submission logic
  }
}

class PostCard extends StatelessWidget {
  final Post post;
  String formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays >= 1) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inMinutes} minutes ago';
    }
  }

  PostCard({required this.post});

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
                  CircleAvatar(
                    backgroundImage: NetworkImage(post.user.profilePic),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    post.user.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.thumb_up_off_alt)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.thumb_down_off_alt))
                ],
              ),
              SizedBox(height: 8.0),
              Text(post.text),
              if (post.imageUrl.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Image.network(post.imageUrl),
                ),
              SizedBox(height: 4.0),
              Row(
                children: [
                  Text(
                    '${formatTimestamp(post.timestamp)}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
