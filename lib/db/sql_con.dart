//add msql_client
import 'package:mysql1/mysql1.dart';

class MysqlConnection {
  static String host = 'localhost';
  static int port = 3306;
  static String user = 'root';
  static String password = 'admin';
  static String db = 'libros';

  MysqlConnection();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
