//
//  LocalCurrency.swift
//  07_iExpense
//
//  Created by Laura on 12.09.2022..
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "EUR")
    }
}
