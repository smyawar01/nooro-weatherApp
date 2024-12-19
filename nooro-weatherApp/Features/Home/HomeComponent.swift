//
//  HomeComponent.swift
//  WeatherApp
//
//  Created by Yawar Muhammad  on 16/12/2024.
//

import Foundation
import SwiftUI

struct HomeComponent: HomeViewBuilder {
    
    let repo = WeatherRespositoryImpl(
        networkService: NetworkSerivceImpl(
        session: URLSession.shared,
        decoder: JSONDecoder()
        )
    )
    var homeViewModel: HomeViewModel {
        
        HomeViewModel(
            loadUseCase: loadUseCase,
            fetchUseCase: fetchUseCase,
            saveUseCase: saveUseCase
        )
    }
    var loadUseCase: LoadWeatherUseCase {
        
        LoadWeatherUseCaseImpl(repo: repo)
    }
    var fetchUseCase: FetchWeatherUseCase {
        
        FetchWeatherUseCaseImpl(repo: repo)
    }
    var saveUseCase: SaveWeatherUseCase {
        
        SaveWeatherUseCaseImpl(repo: repo)
    }
    var homeView: AnyView {
        
        AnyView(
            HomeView(
                viewModel: homeViewModel
            )
        )
    }
}
protocol HomeViewBuilder {
    
    var homeView: AnyView { get }
}

