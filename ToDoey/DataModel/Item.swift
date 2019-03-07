//
//  Item.swift
//  ToDoey
//
//  Created by Thomas Krentz on 07.03.19.
//  Copyright © 2019 Thomas Krentz. All rights reserved.
//

import Foundation

class Item {
    var title: String = ""
    var done: Bool = false
    
    init(title: String){
        self.title = title
    }
}
