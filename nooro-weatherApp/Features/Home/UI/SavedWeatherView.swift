//
//  SavedWeatherView.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 17/12/2024.
//

import SwiftUI

struct SavedWeatherView: View {
    
    let viewData: SavedWeatherViewData
    var body: some View {
        switch viewData {
        case .weather(let weather):
            VStack(spacing: Theme.Spacing.spacious) {
                if let url = URL(string: weather.iconUrl) {
                    AsyncImage(url: url) { image in
                        
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 123, height: 123)
                        
                    } placeholder: {}
                }
                HStack(alignment: .center) {
                    Text(weather.name)
                        .font(Theme.AppFont.title)
                    Image(systemName:"paperplane.fill")
                }
                Text(weather.temprature)
                    .font(Theme.AppFont.veryLargeTitle)
                
                WeatherDetailCard(
                    humidity: weather.humidity,
                    uv: weather.uv,
                    feelsLike: weather.feelsLike
                )
            }
        case .noDataMessage(let message):
            
            NoDataMessageView(title: message.title,
                      description: message.description)
        }
    }
}

#Preview {

    //with weather data
    SavedWeatherView(viewData: .weather(SavedWeatherViewData.SavedWeather(
        name: "Mumbai",
        temprature: Formatter.tempratureString(value: 31),
        iconUrl: "https:/cdn.weatherapi.com/weather/64x64/day/113.png",
        humidity: "67",
        feelsLike: "27",
        uv: "8"
    )))
}
