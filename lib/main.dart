import 'package:flutter/material.dart';

void main() {
  runApp(CatalogoLibrosApp());
}

class CatalogoLibrosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Libros',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  final List<Map<String, String>> libros = [
    {
      "titulo": "Harry Potter y la Piedra Filosofal",
      "autor": "J.K. Rowling",
      "imagen":
          "https://i.pinimg.com/736x/4b/16/0f/4b160f87b9aef5c3d6d90f621eb11043.jpg"
    },
    {
      "titulo": "Orgullo y Prejuicio",
      "autor": "Jane Austen",
      "imagen": "https://ibb.co/pxk5GvX"
    },
    {
      "titulo": "Crepúsculo",
      "autor": "Stephenie Meyer",
      "imagen": "https://via.placeholder.com/150"
    },
    {
      "titulo": "Cazadores de Sombras",
      "autor": "Cassandra Clare",
      "imagen": "https://via.placeholder.com/150"
    },
    {
      "titulo": "El Principito",
      "autor": "Antoine de Saint-Exupéry",
      "imagen": "https://via.placeholder.com/150"
    },
  ];

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
            MaterialPageRoute(
                builder: (context) => PantallaRegistro(libros: libros)),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PantallaRegistro extends StatelessWidget {
  final List<Map<String, String>> libros;
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController autorController = TextEditingController();

  PantallaRegistro({required this.libros});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Nuevo Libro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(labelText: 'Título del libro'),
            ),
            TextField(
              controller: autorController,
              decoration: const InputDecoration(labelText: 'Autor del libro'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (tituloController.text.isNotEmpty &&
                    autorController.text.isNotEmpty) {
                  libros.add({
                    "titulo": tituloController.text,
                    "autor": autorController.text,
                    "imagen": "https://via.placeholder.com/150"
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Guardar Libro'),
            ),
          ],
        ),
      ),
    );
  }
}
