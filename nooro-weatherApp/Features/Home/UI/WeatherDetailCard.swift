//
//  WeatherDetailCard.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 19/12/2024.
//

import SwiftUI

struct WeatherDetailCard: View {
    
    let humidity: String
    let uv: String
    let feelsLike: String
    
    var body: some View {
        
        HStack {
            WeatherDetailValueView(
                title: "Humidity",
                value: humidity)
            .frame(maxWidth: .infinity)
            WeatherDetailValueView(
                title: "UV",
                value: uv)
            .frame(maxWidth: .infinity)
            WeatherDetailValueView(
                title: "Feels Like",
                value: feelsLike)
            .frame(maxWidth: .infinity)
        }
        .padding(Theme.Spacing.standard)
        .roundedRectangleBackground()
    }
}

struct WeatherDetailValueView: View {
    
    let title: String
    let value: String
    
    var body: some View {
        
        VStack(spacing: Theme.Spacing.base - 2) {
            Text(title)
                .foregroundStyle(.textLightGray)
                .font(Theme.AppFont.title3)
            Text(value)
                .foregroundStyle(.textDarkGray)
                .font(Theme.AppFont.description)
        }
    }
}
#Preview {
    WeatherDetailCard(
        humidity: "20%",
        uv: "4",
        feelsLike: "38°"
    )
}
