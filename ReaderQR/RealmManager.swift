//
//  RealmManager.swift
//  ReaderQR
//
//  Created by Alexandr on 8/8/19.
//  Copyright © 2019 Alex Kolinko. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    let realm = try? Realm()
    
    func saveObject(obj: Object) {
        try? realm!.write {
            realm?.add(obj)
        }
    }
    
    func deleteObject(obj: Object) {
        try? realm!.write {
            realm?.delete(obj)
        }
    }
}
