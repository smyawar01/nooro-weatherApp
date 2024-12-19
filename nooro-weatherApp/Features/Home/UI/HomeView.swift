//
//  HomeView.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 16/12/2024.
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    @State var queryString = ""
    
    var body: some View {
        
        VStack(spacing: Theme.Spacing.expanded) {
            SearchBarView { query in
                
                viewModel.fetchWeather(of: query)
            }
            .padding(.horizontal, Theme.Spacing.base)
            switch viewModel.state {
            case .initial:
                EmptyView()
                
            case .savedWeather(let savedWeatherViewData):
                SavedWeatherView(viewData: savedWeatherViewData)
                
            case .fetchedWeather(let viewData):
                FetchedWeatherCard(viewData: viewData) { data in
                    
                    viewModel.save()
                }
            }
            Spacer()
        }
        .padding(.horizontal, Theme.Spacing.gutter)
        .onAppear { viewModel.loadWeather() }
    }
}
#Preview {
    
    HomeComponent().homeView
}
