//
//  DataList.swift
//  ReaderQR
//
//  Created by Alexandr on 8/8/19.
//  Copyright © 2019 Alex Kolinko. All rights reserved.
//

import UIKit
import RealmSwift

class DataList: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var date: String = ""
    @objc dynamic var data: String = ""
}

