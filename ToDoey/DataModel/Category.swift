//
//  Category.swift
//  ToDoey
//
//  Created by Thomas Krentz on 09.03.19.
//  Copyright © 2019 Thomas Krentz. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = "Shopping"
    let items = List<Item>()
}
