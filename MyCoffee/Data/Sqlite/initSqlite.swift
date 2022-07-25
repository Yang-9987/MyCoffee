//
//  initSqlite.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/18.
//

import Foundation
import SQLite

struct SQLiteBase {
    
    static let shared = SQLiteBase()
    var db:Connection?
    var dbname = "db.sqlite3"
    init() {
        
        let sourcePath = Bundle.main.path(forResource: "MyCoffee", ofType: "db")
        let path = copyDatabaseIfNeeded(sourcePath: sourcePath!)
        do {
            db = try Connection(path)
        } catch {
            db = nil
        }
        
        
    }
    func check(){
        
        let test = Table("test")
        do {
            for item in try db!.prepare(test) {
                
                print("\(item)")
            }
        }
        catch {
            // handle
        }
    }
}

func copyDatabaseIfNeeded(sourcePath: String) -> String {
    let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let destinationPath = documents + "/MyCoffee.db"
    let exists = FileManager.default.fileExists(atPath: destinationPath)
    guard !exists else { return destinationPath }
    do {
        try FileManager.default.copyItem(atPath: sourcePath, toPath: destinationPath)
        return destinationPath
    } catch {
        print("error during file copy: \(error)")
        return sourcePath
    }
}




