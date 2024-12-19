//
//  FetchedWeatherCard.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 17/12/2024.
//

import SwiftUI

struct FetchedWeatherCard: View {
    
    let viewData: FetchedWeatherViewData
    let onClicked: (FetchedWeatherViewData)-> Void
    var body: some View {
        
        HStack {
            
            HStack {
                VStack(alignment: .center, spacing: Theme.Spacing.condensed) {
                    Text(viewData.name)
                        .font(Theme.AppFont.title1)
                    
                    Text(viewData.temprature)
                        .font(Theme.AppFont.largeTitle)
                }
                Spacer()
                if let url =  URL(string: viewData.iconUrl) {
                    AsyncImage(url: url) { image in
                        
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 83, height: 67)
                        
                    } placeholder: {}
                }
            }
            .padding(.horizontal, Theme.Spacing.expanded)
            .padding(.vertical, Theme.Spacing.standard)
        }
        .roundedRectangleBackground()
        .onTapGesture { onClicked(viewData) }
    }
}

#Preview {
    
    FetchedWeatherCard(
        viewData: FetchedWeatherViewData(
            name: "Mumbai",
            temprature: "21",
            iconUrl: ""
        ),
        onClicked: { _ in })
}
