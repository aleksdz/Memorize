//
//  ArrayEx.swift
//  Memorize
//
//  Created by Aleks Nazarenko on 29.06.20.
//  Copyright © 2020 Aleks Nazarenko. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        
        return 0
    }
}
