//
//  WeatherFixtures.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 19/12/2024.
//

@testable import nooro_weatherApp

struct WeatherFixtures {
    
    static var savedWeatherViewData: SavedWeatherViewData {
        
        SavedWeatherViewData.weather(
            SavedWeatherViewData.SavedWeather(
            name: "Mumbai",
            temprature: "26",
            iconUrl: "",
            humidity: "59",
            feelsLike: "26",
            uv: "0.2")
            )
    }
    static var savedWeatherNoData: SavedWeatherViewData {
        
        SavedWeatherViewData.noDataMessage(
            SavedWeatherViewData.EmptyMessage(
                title: "No Data",
                description: "No Data"
            )
        )
    }
    static var fetchedWeatherViewData: FetchedWeatherViewData {
        
        FetchedWeatherViewData(
            name: "Mumbai",
            temprature: "21",
            iconUrl: ""
        )
    }
    static var weather: Weather {
        
        Weather()
    }
}
