// Importe necessário do Material App
import 'package:flutter/material.dart';

class Cliente {
  final String nome;
  final String email;
  final String senha;

  // Construtor do cliente

  Cliente({required this.nome, required this.email, required this.senha});

  @override
  String toString() {
    return 'Cliente: $nome, Email: $email';
  }
}

class GerenciadorClientes {
  // Variável estática que guarda a única cópia desta classe
  static final GerenciadorClientes _instancia = GerenciadorClientes._interno();
  // Impede a criação de novas instâncias
  GerenciadorClientes._interno();
  // Sempre retorna a instância existente
  factory GerenciadorClientes() => _instancia;
  // Lista <ul> que armazena todos os clientes cadastrados
  final List<Cliente> _clientes = [];
  // Para acessar a lista de clientes (retorna uma cópia imutável)
  List<Cliente> get clientes => List.unmodifiable(_clientes);
  // Tentar cadastrar um cliente novo.
  bool cadastrar(Cliente cliente) {
    //Vamos checar se já existe um email cadastrado
    if (_clientes.any(
      (c) => c.email.toLowerCase() == cliente.email.toLowerCase(),
    )) {
      print('Erro: email ${cliente.email} já cadastrado');
      return false; // Cadastro falhou
    }
    _clientes.add(cliente); // Adicionar o cliente
    print('Novo cliente cadastrado: ${cliente.nome}');
    return true; // Cadastrooouuuuuuu
  }

  Cliente? login(String email, String senha) {
    return _clientes.firstWhere(
      // É uma função anônima
      // O c representa cada elemento(cada cliente) da lista_clientes
      (c) => c.email.toLowerCase() == email.toLowerCase() && c.senha == senha,
      orElse: () => Null as Cliente, // Retorna nulo se não encontrar os dados
    );
  }
}