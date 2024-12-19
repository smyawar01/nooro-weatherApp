//
//  EmptyView.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 17/12/2024.
//

import SwiftUI

struct NoDataMessageView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        
        VStack(spacing: Theme.Spacing.gutter) {
            Text(title)
                .font(Theme.AppFont.title)
            Text(description)
                .font(Theme.AppFont.description)
        }
    }
}
