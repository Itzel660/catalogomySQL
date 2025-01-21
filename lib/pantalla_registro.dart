import 'package:flutter/material.dart';

class PantallaRegistro extends StatelessWidget {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController autorController = TextEditingController();

  PantallaRegistro({super.key});
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
