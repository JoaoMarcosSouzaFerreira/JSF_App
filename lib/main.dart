// lib/main.dart

import 'package:flutter/material.dart';
import 'package:jsf_app/src/core/theme/theme.dart'; // Importe nosso arquivo de tema

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSF Assessoria',
      debugShowCheckedModeBanner: false, // Remove o banner de "Debug"

      // Configuração dos temas
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // O app escolherá o tema baseado no sistema do celular

      home: const HomeScreen(), // Tela inicial provisória
    );
  }
}

// Tela de exemplo apenas para podermos ver o tema funcionando
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSF Medições'),
      ),
      body: const Center(
        child: Text(
          'Bem-vindo ao App da JSF Assessoria!',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add),
      ),
    );
  }
}