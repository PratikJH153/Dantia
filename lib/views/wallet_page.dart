import 'package:dantia/logic/solana_impl.dart';
import 'package:dantia/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WalletPage extends StatefulWidget {
  final int amount;
  const WalletPage({required this.amount, Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final WalletProvider _provider = WalletProvider();

  @override
  void initState() {
    _provider.initializeAdapter();
    super.initState();
  }

  Future<void> invest() async {
    await _provider.investTokens(
        widget.amount, "42xMtd6mPMZKgtv7WgUV9hg51RsrxQ4hx9ioHLSSnjmc");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wallets'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            invest().then((val) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/image.png",
                            height: 80,
                            width: 80,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Thanks for your investment'),
                      ],
                    ),
                    content: Text(
                        'Earn more tokens on Dantia and invest in others campaigns 🔥 🔥'),
                    actions: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (ctx) => HomePage(),
                                ),
                                (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 12,
                            ),
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                          child: Text(
                            "Invest Now",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            });
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          child: Text(
            "Pay Now",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Slidable(
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (val) {},
                  backgroundColor: Color.fromARGB(255, 91, 176, 255),
                  foregroundColor: Colors.white,
                  label: 'Edit',
                ),
                SlidableAction(
                  onPressed: (val) {},
                  backgroundColor: Color.fromARGB(255, 255, 54, 54),
                  foregroundColor: Colors.white,
                  label: 'Delete',
                ),
              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 0.01,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 20,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Image.network(
                    "https://1000logos.net/wp-content/uploads/2017/03/Mastercard-logo.png",
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Master Card"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("XXXX - XXXX - XXXX - 5430"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Slidable(
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (val) {},
                  backgroundColor: Color.fromARGB(255, 91, 176, 255),
                  foregroundColor: Colors.white,
                  label: 'Edit',
                ),
                SlidableAction(
                  onPressed: (val) {},
                  backgroundColor: Color.fromARGB(255, 255, 54, 54),
                  foregroundColor: Colors.white,
                  label: 'Delete',
                ),
              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 0.01,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 20,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.wallet,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phantom Wallet"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("@XXXXjh"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
