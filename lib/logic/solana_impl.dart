import 'package:flutter/material.dart';
import 'package:solana_wallet_adapter/solana_wallet_adapter.dart';
import 'package:solana_web3/programs.dart';
import 'package:solana_web3/solana_web3.dart';

class WalletProvider extends ChangeNotifier {
  late final Future<void> _future;
  late SolanaWalletAdapter _adapter;
  String? _status;
  late Connection _connection;
  int _tokenBalance = 0;

  Future<void> initializeAdapter() async {
    _adapter = SolanaWalletAdapter(
      AppIdentity(
        uri: Uri.https('example.com'),
        icon: Uri.parse('favicon.png'),
        name: 'Dantia',
      ),
      cluster: Cluster.devnet,
      hostAuthority: null,
    );
    _connection = Connection(Cluster.devnet);
  }

  Future<void> connectToPhantom() async {
    if (!_adapter.isAuthorized) {
      await _adapter.authorize(
        walletUriBase: _adapter.store.apps[0].walletUriBase,
      );

      await fetchTokenBalance();
    }
  }

  Future<void> disconnectFromPhantom() async {
    if (_adapter.isAuthorized) {
      await _adapter.deauthorize();
    }
  }

  Future<int?> fetchTokenBalance() async {
    if (_adapter.isAuthorized) {
      final Pubkey? wallet =
          Pubkey.tryFromBase64(_adapter.connectedAccount?.address);
      if (wallet != null) {
        final int balance = await _connection.getBalance(wallet);
        return balance;
      }
    }
    return null;
  }

  Future<void> redeemTokens(int amount) async {
    if (_adapter.isAuthorized) {
      final Pubkey? wallet =
          Pubkey.tryFromBase64(_adapter.connectedAccount?.address);
      if (wallet != null) {
        try {
          // Create a transaction to redeem the tokens
          final latestBlockHash = await _connection.getLatestBlockhash();
          final Transaction transaction = Transaction.v0(
            payer: wallet,
            recentBlockhash: latestBlockHash.blockhash,
            instructions: [
              SystemProgram.transfer(
                fromPubkey: wallet,
                toPubkey: wallet,
                lamports: solToLamports(amount.toDouble()),
              ),
            ],
          );

          // Sign and send the transaction
          final SignTransactionsResult result = await _adapter
              .signTransactions([_adapter.encodeTransaction(transaction)]);
          final List<String?> signatures =
              await _connection.sendSignedTransactions(
            result.signedPayloads,
            eagerError: true,
          );

          // Confirm the transaction
          await _connection
              .confirmTransaction(base58To64Decode(signatures.first!));
        } catch (e) {
          print(e);
        }
      }
    } else {
      print("NOT AUTHORIZED");
    }
  }

  Future<void> investTokens(int amount, String address) async {
    if (_adapter.isAuthorized) {
      final Pubkey? wallet =
          Pubkey.tryFromBase64(_adapter.connectedAccount?.address);
      if (wallet != null) {
        try {
          // Create a transaction to invest the tokens
          final latestBlockhash = await _connection.getLatestBlockhash();
          final Transaction transaction = Transaction.v0(
            payer: wallet,
            recentBlockhash: latestBlockhash.blockhash,
            instructions: [
              SystemProgram.transfer(
                fromPubkey: wallet,
                toPubkey: Pubkey.fromBase58(
                  address,
                ), // Replace with the actual investment address
                lamports: solToLamports(amount.toDouble()),
              ),
            ],
          );

          // Sign and send the transaction
          final SignTransactionsResult result = await _adapter
              .signTransactions([_adapter.encodeTransaction(transaction)]);
          final List<String?> signatures =
              await _connection.sendSignedTransactions(
            result.signedPayloads,
            eagerError: true,
          );

          // Confirm the transaction
          await _connection
              .confirmTransaction(base58To64Decode(signatures.first!));
          print("DONE Transaction");
        } catch (e) {
          print(e);
        }
      }
    } else {
      print("NOT AUTHORIZED");
    }
  }
}
