import 'package:catalogo_libros/db/sql_con.dart';

class LibrosDb {
  final conection = MysqlConnection();

  createBook(String titulo, String autor, String fechaPublicacion) async {
    final conn = await conection.getConnection();
    await conn.query(
        'INSERT INTO libros (titulo, autor, fecha) VALUES (?, ?, ?)',
        [titulo, autor, fechaPublicacion]);
    await conn.close();
  }

  readBooks() async {
    final conn = await conection.getConnection();
    final results = await conn.query('SELECT * FROM libros');
    await conn.close();
    return results;
  }

  readbook(int id) async {
    final conn = await conection.getConnection();
    final results = await conn.query('SELECT * FROM libros WHERE id = ?', [id]);
    await conn.close();
    return results;
  }

  deleteBook(int id) async {
    final conn = await conection.getConnection();
    await conn.query('DELETE FROM libros WHERE id = ?', [id]);
    await conn.close();
  }
}
