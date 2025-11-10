import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/header_card.dart';
import '../widgets/debit_card.dart';
import '../widgets/grid_menu_item.dart';
import '../widgets/transaction_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Data dummy transaksi
    final transactions = [
      TransactionModel(
        title: 'Coffee Shop',
        amount: '-Rp35.000',
        category: 'Food',
        icon: Icons.local_cafe,
        color: Colors.blue,
      ),
      TransactionModel(
        title: 'Grab Ride',
        amount: '-Rp25.000',
        category: 'Travel',
        icon: Icons.directions_car,
        color: Colors.blue,
      ),
      TransactionModel(
        title: 'Gym Membership',
        amount: '-Rp150.000',
        category: 'Health',
        icon: Icons.fitness_center,
        color: Colors.blue,
      ),
      TransactionModel(
        title: 'Movie Ticket',
        amount: '-Rp60.000',
        category: 'Event',
        icon: Icons.movie,
        color: Colors.blue,
      ),
      TransactionModel(
        title: 'Salary',
        amount: '+Rp5.000.000',
        category: 'Income',
        icon: Icons.attach_money,
        color: Colors.blue,
      ),
    ];

    // Tampilan halaman utama
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 160, 194, 245),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const HeaderCard(),
                const SizedBox(height: 20),

                // Kartu Debit
                const DebitCard(cardNumber: '',),
                const SizedBox(height: 20),

                // Menu Grid
                const MenuGrid(),
                const SizedBox(height: 20),

                // Judul bagian transaksi
                const Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                //Daftar transaksi modern
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionItem(transaction: transactions[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

