//Operaciones de la base de datos
protocol NotesDatabase {
    func create(note: String)
    func read() -> [String]
    func delete(note: String)
}

// Implementamos la memoria en la base de datos
class InMemoryNotesDatabase: NotesDatabase {
    private var notes = [String]()
    
    func create(note: String) {
        notes.append(note)
    }
    
    func read() -> [String] {
        return notes
    }
    
    func delete(note: String) {
        if let index = notes.firstIndex(of: note) {
            notes.remove(at: index)
        }
    }
}

// Manager
class NotesManager {
    private let database: NotesDatabase
    
    init(database: NotesDatabase) {
        self.database = database
    }
    
    func add(note: String) {
        database.create(note: note)
    }
    
    func getAll() -> [String] {
        return database.read()
    }
    
    func remove(note: String) {
        database.delete(note: note)
    }
}

// Main
class MainApp {
    private let notesManager: NotesManager
    
    init(notesManager: NotesManager) {
        self.notesManager = notesManager
    }
    
    func run() {
        notesManager.add(note: "Compra leche")
        notesManager.add(note: "Ve al gimnasio")
        
        print("Todo:")
        print(notesManager.getAll())
        
        notesManager.remove(note: "Compra leche")
        
        print("Nuevas notas:")
        print(notesManager.getAll())
    }
}

// Main ejecucion
let database: NotesDatabase = InMemoryNotesDatabase()
let notesManager = NotesManager(database: database)
let mainApp = MainApp(notesManager: notesManager)

mainApp.run()
