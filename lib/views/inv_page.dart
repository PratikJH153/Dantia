import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletProviderWidget extends StatefulWidget {
  @override
  State<WalletProviderWidget> createState() => _WalletProviderWidgetState();
}

class _WalletProviderWidgetState extends State<WalletProviderWidget> {
  @override
  void initState() {
    Provider.of<WalletProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WalletProvider(),
      child: Consumer<WalletProvider>(
        builder: (context, walletProvider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Solana Wallet Example'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: walletProvider.connectToDevnet,
                    child: Text('Connect to Devnet'),
                  ),
                  SizedBox(height: 16.0),
                  if (walletProvider.isConnected)
                    Column(
                      children: [
                        Text('Connected to Devnet'),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () => walletProvider.sendTransaction(100),
                          child: Text('Send Transaction'),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: walletProvider.disconnectFromDevnet,
                          child: Text('Disconnect'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class WalletProvider extends ChangeNotifier {
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  Future<void> init() async {
    // Initialization logic if needed
  }

  Future<void> connectToDevnet() async {
    // Simulate connecting to devnet (can include initialization logic if needed)
    _isConnected = true;
    notifyListeners();
  }

  Future<void> disconnectFromDevnet() async {
    // Simulate disconnecting from devnet
    _isConnected = false;
    notifyListeners();
  }

  Future<void> sendTransaction(int amount) async {
    // Simulate sending transaction
    print('Sending transaction of $amount SOL');
    // Simulate transaction confirmation
    await Future.delayed(Duration(seconds: 2));
    print('Transaction confirmed');
  }
}

void main() {
  runApp(MaterialApp(
    home: WalletProviderWidget(),
  ));
}
