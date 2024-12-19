//
//  FetchWeatherUseCase.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 17/12/2024.
//

public struct FetchedWeatherViewData {
    
    let name: String
    let temprature: String
    let iconUrl: String
}
public protocol FetchWeatherUseCase {
    
    func onExecution(city: String) async -> (Weather, FetchedWeatherViewData)?
}
public struct FetchWeatherUseCaseImpl: FetchWeatherUseCase {
    
    private let repo: WeatherRespository
    
    public init(repo: WeatherRespository) {
        
        self.repo = repo
    }
    public func onExecution(city: String) async -> (Weather, FetchedWeatherViewData)? {
        
        do {
            if let weather = try await repo.fetch(for: city) {
                return (weather, mapper(weather: weather))
            } else { throw WeatherError.noData }
        } catch {
            return nil
        }
    }
}
private extension FetchWeatherUseCaseImpl {
    
    func mapper(weather: Weather) -> FetchedWeatherViewData {
        
        return FetchedWeatherViewData(
            name: weather.location?.name ?? "",
            temprature: Formatter.tempratureString(value: weather.current?.temp_c ?? 0),
            iconUrl: weather.current?.condition?.icon.map{ "https:\($0)" } ?? ""
        )
    }
}

