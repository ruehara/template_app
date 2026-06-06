# Database Migrations

This directory contains documentation and examples for managing database schema migrations using Drift.

## Overview

The project uses [Drift](https://drift.simonbinder.eu/) for type-safe database operations. Drift doesn't provide automatic migrations, so schema changes must be managed manually.

## Current Schema Version

**Version:** 1

See `lib/core/database/database.dart` for the current `schemaVersion`.

## Migration Strategy

Schema migrations are defined in `database.dart` within the `MigrationStrategy`:

```dart
@override
MigrationStrategy get migration {
  return MigrationStrategy(
    onUpgrade: (m, from, to) async {
      await customStatement('PRAGMA foreign_keys = OFF');
      for (var step = from + 1; step <= to; step++) {
        switch (step) {
          case 2:
            // Migration from version 1 to 2
            await m.addColumn(tableName, tableName.newColumn);
            break;
          case 3:
            // Migration from version 2 to 3
            // ... more migrations
            break;
        }
      }
      await customStatement('PRAGMA foreign_keys = ON');
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
      // ... seed logic
    },
  );
}
```

## How to Create a Migration

### Step 1: Modify Schema

Edit `lib/core/database/tables/schema.drift`:

```sql
-- Example: Adding a new column
CREATE TABLE tafusuario (
  codusuario TEXT NOT NULL PRIMARY KEY,
  descnome TEXT NOT NULL,
  desclogin TEXT NOT NULL UNIQUE,
  descemail TEXT NOT NULL,
  descsenha TEXT NOT NULL,
  desctelefone TEXT,  -- NEW COLUMN
  codunidade TEXT NOT NULL REFERENCES tafunidade(codunidade),
  codperfil TEXT NOT NULL REFERENCES tafperfil(codperfil),
  codequipe TEXT NOT NULL REFERENCES tafequipe(codequipe)
) WITH tafUsuario;
```

### Step 2: Increment Schema Version

In `lib/core/database/database.dart`:

```dart
@override
int get schemaVersion => 2;  // Increment from 1 to 2
```

### Step 3: Add Migration Logic

Add the migration step in the `onUpgrade` method:

```dart
@override
MigrationStrategy get migration {
  return MigrationStrategy(
    onUpgrade: (m, from, to) async {
      await customStatement('PRAGMA foreign_keys = OFF');
      for (var step = from + 1; step <= to; step++) {
        switch (step) {
          case 2:
            // Add desctelefone column to tafusuario table
            await m.addColumn(tafusuario, tafusuario.desctelefone);
            break;
        }
      }
      await customStatement('PRAGMA foreign_keys = ON');
    },
    // ... rest of the migration strategy
  );
}
```

### Step 4: Regenerate Code

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Step 5: Test Migration

1. **Test on fresh install:**
   - Delete app data
   - Run app - should create schema version 2 directly

2. **Test upgrade path:**
   - Install app with version 1
   - Update to version 2
   - Verify data integrity and new column exists

3. **Write tests:**
   ```dart
   test('migration from v1 to v2 adds desctelefone column', () async {
     // Test migration logic
   });
   ```

## Migration Types

### Adding a Column

```dart
await m.addColumn(table, table.newColumn);
```

### Creating a Table

```dart
await m.createTable(newTable);
```

### Creating an Index

```dart
await m.createIndex(Index('idx_name', 'CREATE INDEX ...'));
```

### Custom SQL

```dart
await m.customStatement('ALTER TABLE ...');
```

### Deleting a Column (SQLite Limitation)

SQLite doesn't support `DROP COLUMN` directly. You must:

1. Create new table with desired schema
2. Copy data from old table
3. Drop old table
4. Rename new table

```dart
await m.customStatement('''
  CREATE TABLE tafusuario_new (
    codusuario TEXT NOT NULL PRIMARY KEY,
    descnome TEXT NOT NULL
    -- removed unwanted column
  );
''');

await m.customStatement('''
  INSERT INTO tafusuario_new SELECT codusuario, descnome FROM tafusuario;
''');

await m.customStatement('DROP TABLE tafusuario;');

await m.customStatement('ALTER TABLE tafusuario_new RENAME TO tafusuario;');
```

## Best Practices

### 1. Never Skip Versions

Users can upgrade from any older version. Ensure all migration steps are present:

```dart
case 2:
  // v1 → v2
case 3:
  // v2 → v3
case 4:
  // v3 → v4
```

### 2. Always Disable Foreign Keys During Migration

```dart
await customStatement('PRAGMA foreign_keys = OFF');
// ... migrations
await customStatement('PRAGMA foreign_keys = ON');
```

### 3. Test All Upgrade Paths

- v1 → v2
- v1 → v3 (direct jump)
- v2 → v3

### 4. Back Up Data Before Destructive Changes

Consider exporting data before migrations that drop tables or columns.

### 5. Document Each Migration

Create a file in this directory for complex migrations:

```
migrations/
├── README.md (this file)
├── migration_v1_to_v2.md
├── migration_v2_to_v3.md
└── ...
```

## Migration Examples

### Example 1: Add Column with Default Value

**Schema Change (v2):**
```sql
CREATE TABLE tafparamglobal (
  codparam TEXT NOT NULL PRIMARY KEY,
  descparam TEXT NOT NULL,
  valorparam TEXT,
  ativo INTEGER NOT NULL DEFAULT 1  -- NEW with default
);
```

**Migration:**
```dart
case 2:
  // SQLite will automatically use DEFAULT 1 for existing rows
  await m.addColumn(tafparamglobal, tafparamglobal.ativo);
  break;
```

### Example 2: Create New Table

**Schema Change (v3):**
```sql
CREATE TABLE taflogs (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  timestamp INTEGER NOT NULL,
  message TEXT NOT NULL
);
```

**Migration:**
```dart
case 3:
  await m.createTable(taflogs);
  break;
```

### Example 3: Rename Column (Requires Recreation)

**Migration:**
```dart
case 4:
  // Rename descemail → email in tafusuario
  await customStatement('ALTER TABLE tafusuario RENAME TO tafusuario_old');
  
  await customStatement('''
    CREATE TABLE tafusuario (
      codusuario TEXT NOT NULL PRIMARY KEY,
      descnome TEXT NOT NULL,
      desclogin TEXT NOT NULL UNIQUE,
      email TEXT NOT NULL,  -- renamed
      descsenha TEXT NOT NULL,
      codunidade TEXT NOT NULL,
      codperfil TEXT NOT NULL,
      codequipe TEXT NOT NULL,
      FOREIGN KEY (codunidade) REFERENCES tafunidade(codunidade),
      FOREIGN KEY (codperfil) REFERENCES tafperfil(codperfil),
      FOREIGN KEY (codequipe) REFERENCES tafequipe(codequipe)
    )
  ''');
  
  await customStatement('''
    INSERT INTO tafusuario 
    SELECT codusuario, descnome, desclogin, descemail, descsenha, 
           codunidade, codperfil, codequipe 
    FROM tafusuario_old
  ''');
  
  await customStatement('DROP TABLE tafusuario_old');
  break;
```

## Debugging Migrations

### Check Current Schema Version

```dart
final db = await openConnection();
final version = await db.schemaVersion;
print('Current schema version: $version');
```

### View Existing Tables

```sql
SELECT name FROM sqlite_master WHERE type='table';
```

### Inspect Table Schema

```sql
PRAGMA table_info(tafusuario);
```

## Rolling Back Migrations

Drift doesn't support `onDowngrade` by default. To handle rollbacks:

1. **Prevent rollback** - Set minimum app version
2. **Clear and recreate** - Use `onDowngrade: (m, from, to) => m.deleteEverything()`
3. **Manual rollback** - Implement reverse migrations (not recommended)

## Resources

- [Drift Migrations Documentation](https://drift.simonbinder.eu/docs/advanced-features/migrations/)
- [SQLite ALTER TABLE](https://www.sqlite.org/lang_altertable.html)
- [Drift Schema Versions](https://drift.simonbinder.eu/docs/getting-started/advanced_dart_tables/#schema-version)

## Migration History

### Version 1 (Initial Schema)
- Tables: `tafunidade`, `tafperfil`, `tafequipe`, `tafparamglobal`, `tafparamperfil`, `tafusuario`
- Initial seed data for development flavor
- BCrypt password hashing for user authentication

---

**Always test migrations thoroughly before releasing to production!**
