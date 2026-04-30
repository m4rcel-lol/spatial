import Foundation
import GRDB

public final class SpatialStore {
    public let dbQueue: DatabaseQueue

    public init(path: String) throws {
        dbQueue = try DatabaseQueue(path: path)
        try migrator.migrate(dbQueue)
    }

    private var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        migrator.registerMigration("v1") { db in
            try db.create(table: "nodes") { t in
                t.column("id", .text).primaryKey()
                t.column("path", .text).notNull().unique()
                t.column("size", .integer).notNull()
                t.column("x", .double).notNull()
                t.column("y", .double).notNull()
                t.column("type", .text).notNull()
                t.column("rootPath", .text).notNull().indexed()
            }
            try db.create(table: "edges") { t in
                t.column("id", .text).primaryKey()
                t.column("sourceID", .text).notNull().indexed()
                t.column("targetID", .text).notNull().indexed()
                t.column("strength", .double).notNull()
                t.column("style", .text).notNull()
                t.column("kind", .text).notNull()
            }
            try db.create(table: "clusters") { t in
                t.column("id", .text).primaryKey()
                t.column("name", .text).notNull()
                t.column("collapsed", .boolean).notNull().defaults(to: false)
            }
        }
        return migrator
    }
}
