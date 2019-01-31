//
//  Data.swift
//  Todoey
//
//  Created by Nicolas Fournier on 2019-01-31.
//  Copyright © 2019 Nicolas Fournier. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
