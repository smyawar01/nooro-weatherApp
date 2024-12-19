//
//  SearchBarView.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 18/12/2024.
//

import SwiftUI

struct SearchBarView: View {
    
    @State private var queryString = ""
    public let onSearch: ((String) -> Void)
    
    var body: some View {
        
        HStack {
            TextField(
                "Search Location",
                text: $queryString,
                onCommit: { onSearch(queryString) }
            )
            Image(.search)
        }
        .padding(.vertical, Theme.Spacing.standard)
        .padding(.horizontal, Theme.Spacing.gutter)
        .roundedRectangleBackground()
    }
}

#Preview {
    
    SearchBarView { _ in }
}
