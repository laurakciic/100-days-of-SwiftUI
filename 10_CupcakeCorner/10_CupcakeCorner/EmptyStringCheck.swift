//
//  EmptyStringCheck.swift
//  10_CupcakeCorner
//
//  Created by Laura on 24.09.2022..
//

import Foundation

extension String {
    var isWhiteSpaceRemoved: Bool {
        // remove all white space and new lines & from that result check if it is empty
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
