import 'package:catalogo_libros/pantalla_principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CatalogoLibrosApp());
}

class CatalogoLibrosApp extends StatelessWidget {
  const CatalogoLibrosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Libros',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const PantallaPrincipal(),
    );
  }
}
