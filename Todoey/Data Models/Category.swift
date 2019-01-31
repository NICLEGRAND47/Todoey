//
//  Category.swift
//  Todoey
//
//  Created by Nicolas Fournier on 2019-01-31.
//  Copyright © 2019 Nicolas Fournier. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()

}
