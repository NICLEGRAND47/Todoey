//
//  Item.swift
//  Todoey
//
//  Created by Nicolas Fournier on 2019-01-31.
//  Copyright © 2019 Nicolas Fournier. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
