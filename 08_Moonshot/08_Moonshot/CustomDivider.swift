//
//  CustomDivider.swift
//  08_Moonshot
//
//  Created by Laura on 13.09.2022..
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()                                         
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
    }
}
