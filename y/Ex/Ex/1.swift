//
//  1.swift
//  Ex
//
//  Created by mac on 21/12/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation

func getdata(id:Int , name : String , sub : String)
{
    print("ID : ",id)
    print("Name : ",name)
    print("Sub : ",sub)
}


print("Enter ID : ")
var stid=Int(readLine()!)!
print("Enter Name : ")
var stname=readLine()!
print("Enter Sub : ")
var stsub=readLine()!

getdata(id:stid, name: stname, sub: stsub)
