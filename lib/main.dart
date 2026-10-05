import 'dart:convert';
import 'package:flutter/material.dart';

class Produto {
  final String nome;
  final double preco;
  final bool disponivel;

  Produto({
    required this.nome,
    required this.preco,
    required this.disponivel,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'] as String,
      preco: (json['preco'] as num).toDouble(),
      disponivel: json['disponivel'] as bool,
    );
  }
}

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Produto',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const TelaProduto(),
    );
  }
}

class TelaProduto extends StatefulWidget {
  const TelaProduto({super.key});

  @override
  State<TelaProduto> createState() => _TelaProdutoState();
}

class _TelaProdutoState extends State<TelaProduto> {
  Produto? _produto;
  bool _carregando = false;

  static const String _jsonSimulado =
      '{"nome": "Notebook Gamer", "preco": 4599.90, "disponivel": true}';

  Future<void> _recarregar() async {
    setState(() => _carregando = true); 

    await Future.delayed(const Duration(seconds: 2)); 

    final Map<String, dynamic> mapa = jsonDecode(_jsonSimulado);
    final produto = Produto.fromJson(mapa);

    setState(() {
      _produto = produto;
      _carregando = false; 
    });
  }

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Produto'),
        backgroundColor: cores.primaryContainer,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_carregando)
                const CircularProgressIndicator()
              else if (_produto == null)
                const Text('Nenhum produto carregado.')
              else
                Card(
                  elevation: 2,
                  color: cores.secondaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _produto!.nome,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text('R\$ ${_produto!.preco.toStringAsFixed(2)}'),
                        const SizedBox(height: 8),
                        Text(
                          _produto!.disponivel ? 'Disponível' : 'Esgotado',
                          style: TextStyle(
                            color: _produto!.disponivel
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _carregando ? null : _recarregar,
                icon: const Icon(Icons.refresh),
                label: const Text('Recarregar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}