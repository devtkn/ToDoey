//
//  Item.swift
//  ToDoey
//
//  Created by Thomas Krentz on 09.03.19.
//  Copyright © 2019 Thomas Krentz. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = "Obst"
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
