//
//  RoundRectBackground.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 18/12/2024.
//

import SwiftUI

struct RoundedRectangleBackground: ViewModifier {
    
    let backgroundColor: Color
    let cornerRadius: CGFloat
    
    // Applying the background with rounded corners and padding
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)  // Apply background color to the rounded rectangle
            )
            .cornerRadius(cornerRadius)  // Ensure that the corners of the content match the rounded rectangle
    }
}

extension View {
    // This is a custom view modifier that can be easily applied to any view
    func roundedRectangleBackground(color: Color = .viewBackground,
                                    cornerRadius: CGFloat = Theme.CornerRadius.rectangleView) -> some View {
        self.modifier(RoundedRectangleBackground(backgroundColor: color, cornerRadius: cornerRadius))
    }
}
