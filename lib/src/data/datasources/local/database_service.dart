import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService._privateConstructor();
  static final DatabaseService instance = DatabaseService._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'jsf_database.db');
    
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate, 
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE empresas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        cnpj TEXT,
        telefone TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE riscos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        descricao TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE aparelhos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        numero_serie TEXT NOT NULL UNIQUE
      )
    ''');
    
    await db.execute('''
      CREATE TABLE medicoes(
        id TEXT PRIMARY KEY, -- UUID gerado no app
        empresa_id INTEGER,
        risco_id INTEGER,
        aparelho_id INTEGER,
        colaborador_empresa_nome TEXT,
        colaborador_empresa_setor TEXT,
        colaborador_empresa_cargo TEXT,
        posto_trabalho TEXT,
        turno TEXT,
        dados_medicao TEXT, -- Armazenaremos os dados coletados como um JSON
        status TEXT NOT NULL, -- Ex: 'rascunho', 'aguardando_envio', 'enviado'
        timestamp_criacao INTEGER NOT NULL,
        timestamp_envio INTEGER,
        path_arquivo_local TEXT, -- Caminho para o Excel gerado, se offline
        FOREIGN KEY (empresa_id) REFERENCES empresas(id),
        FOREIGN KEY (risco_id) REFERENCES riscos(id),
        FOREIGN KEY (aparelho_id) REFERENCES aparelhos(id)
      )
    ''');
  }
}