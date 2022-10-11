//
//  DetailView.swift
//  Challenge5_Illustrated_Contacts
//
//  Created by Laura on 10.10.2022..
//

import SwiftUI

struct DetailView: View {
    var memoryView = MemoryView()

    var body: some View {
        memoryView.image?
            .resizable()
            .scaledToFit()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
