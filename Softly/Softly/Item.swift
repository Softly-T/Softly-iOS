//
//  Item.swift
//  Softly
//
//  Created by 노가현 on 3/12/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
