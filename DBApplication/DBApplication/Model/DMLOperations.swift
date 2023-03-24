//
//  DMLOperations.swift
//  DBApplication
//
//  Created by mac on 02/03/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit
import SQLite3

class DMLOperations: NSObject {
    var strpath = ""
    
    func dmlservices(query:String) -> Bool {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        strpath=path+"/tempdb.db"
        
        var status = false
        var statement:OpaquePointer?=nil
        if sqlite3_open(strpath, &statement) == SQLITE_OK { //Connection Open
            if sqlite3_prepare_v2(statement, query, -1, &statement, nil) == SQLITE_OK { //validate Your SQL Query
                status = true
                sqlite3_step(statement)
            }
            sqlite3_finalize(statement)
            sqlite3_close(statement)
        }
        return status
    }
    
    func loginuser(query:String)->Array<Any> {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        strpath=path+"/tempdb.db"
        
        var data = Array<Any>()
        var statement:OpaquePointer?=nil
        if sqlite3_open(strpath, &statement) == SQLITE_OK { //Connection Open
            if sqlite3_prepare_v2(statement, query, -1, &statement, nil) == SQLITE_OK { //validate Your SQL Query
               
                while sqlite3_step(statement) == SQLITE_ROW {
                    let unm = String.init(cString: sqlite3_column_text(statement, 3))
                    let pas = String.init(cString: sqlite3_column_text(statement, 4))
                    data.append(unm)
                    data.append(pas)
                }
            }
            sqlite3_finalize(statement)
            sqlite3_close(statement)
        }
        return data
    }
    
    func showalldata(query:String)->Array<Any> {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        strpath=path+"/tempdb.db"
        
        var data = Array<Any>()
        var dict = Dictionary<String,Any>()
        var statement:OpaquePointer?=nil
        if sqlite3_open(strpath, &statement) == SQLITE_OK { //Connection Open
            if sqlite3_prepare_v2(statement, query, -1, &statement, nil) == SQLITE_OK { //validate Your SQL Query
                
                while sqlite3_step(statement) == SQLITE_ROW {
                    let fullname = String.init(cString: sqlite3_column_text(statement, 1))
                    let city = String.init(cString: sqlite3_column_text(statement, 2))
                    let email = String.init(cString: sqlite3_column_text(statement, 3))
                    let mobile = String.init(cString: sqlite3_column_text(statement, 4))
                    dict["fullname"] = fullname
                    dict["city"] = city
                    dict["email"] = email
                    dict["mobile"] = mobile
                    
                    data.append(dict)
                }
            }
            sqlite3_finalize(statement)
            sqlite3_close(statement)
        }
        return data
    }
}
