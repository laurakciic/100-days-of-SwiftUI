//
//  Order.swift
//  10_CupcakeCorner
//
//  Created by Laura on 24.09.2022..
//

import SwiftUI

@dynamicMemberLookup   // allows to dynamically handle access properties that don't exist directly already there
class SharedOrder: ObservableObject {
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var data = Order()
    
    // subscripts allow us read & raise things like scores, dictionaries using address, zip or similar
    
    // custom subscript using dynamicMember keyPath - must be specified as a property on Order struct
    // we can access some order.something as long as it exists as property on Order struct - Generics
    // T is the return value of subscript - whatever value of the order property is
    subscript<T>(dynamicMember keyPath: KeyPath<Order, T>) -> T {
        data[keyPath: keyPath]                  // pass it on through
    }
    
    // second subscript - writable keypath with an Order value with getter & setter
    subscript<T>(dynamicMember keyPath: WritableKeyPath<Order, T>) -> T {
        get {
            data[keyPath: keyPath]
        }
        
        set {
            data[keyPath: keyPath] = newValue   // write it with the new value
        }
    }
}

struct Order: Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isWhiteSpaceRemoved || streetAddress.isWhiteSpaceRemoved || city.isWhiteSpaceRemoved || zip.isWhiteSpaceRemoved {
            return false
        }
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
