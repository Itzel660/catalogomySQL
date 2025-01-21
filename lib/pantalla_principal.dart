import 'package:catalogo_libros/db/libros_db.dart';
import 'package:catalogo_libros/pantalla_registro.dart';
import 'package:flutter/material.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  var libros = [];
  bool isLoading = false;

  _getLibros() async {
    setState(() {
      isLoading = true;
    });
    try {
      final data = await LibrosDb().readBooks();
      setState(() {
        libros = data;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getLibros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Libros'),
      ),
      body: ListView.builder(
        itemCount: libros.length,
        itemBuilder: (context, index) {
          final libro = libros[index];
          return Card(
            child: ListTile(
              leading: Image.network(libro["imagen"]!),
              title: Text(libro["titulo"]!),
              subtitle: Text(libro["autor"]!),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PantallaRegistro()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
