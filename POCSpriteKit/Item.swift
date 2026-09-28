//
//  Item.swift
//  POCSpriteKit
//
//  Created by Yohane Cavalcante on 28/09/26.
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
