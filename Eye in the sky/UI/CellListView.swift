//
//  CellListView.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 12/11/2022.
//

import SwiftUI

struct CellListView: View {
    
    // updates when viewModel data is updated
    @StateObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        let iconURL = URL(string: "https://openweathermap.org/img/wn/\(viewModel.icon).png")
        
        VStack {
            HStack {
                Text(viewModel.title)
                    .font(.title)
                    .fontDesign(.monospaced)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.horizontal)
                Spacer()
            }
            HStack {
                VStack (alignment: .center){
                    AsyncImage(url: iconURL) { returnedIcon in
                        returnedIcon
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 100, maxHeight: 100)
                            .padding(.horizontal)
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: 100, maxHeight: 100)
                            .padding(.horizontal)
                    }
                }
                VStack (alignment: .leading) {
                    HStack {
                        Spacer()
                        Text(viewModel.temp)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .fontDesign(.monospaced)
                        Spacer()
                    }
                    Text(viewModel.description)
                        .font(.title2)
                        .fontDesign(.monospaced)
                    Text(viewModel.humidity)
                        .fontDesign(.monospaced)
                    Text(viewModel.wind)
                        .fontDesign(.monospaced)
                }
                .padding(.trailing)
            }
        }.onAppear(perform: {
            Task {
                await viewModel.fetchWeatherUI()
            }
        })
    }
}


struct CellListView_Previews: PreviewProvider {
    static var previews: some View {
        CellListView(viewModel: CellListView.WeatherViewModel(city: "London", repo: Eye_in_the_skyApp.weatherRepo))
    }
}


