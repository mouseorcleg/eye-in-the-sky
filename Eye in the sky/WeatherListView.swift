//
//  WeatherListView.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import SwiftUI

struct WeatherListView: View {
    
    // updates when viewModel data is updated
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                //fetches data from a viewModel
                
                HStack {
                    VStack (alignment: .center){
                        Text(viewModel.title)
                            .font(.title)
                            .fontDesign(.monospaced)
                            .fontWeight(.semibold)
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(viewModel.icon).png"), scale: 0.5)
                            .scaledToFit()
                    }
                    VStack (alignment: .leading) {
                        Text(viewModel.temp)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .fontDesign(.monospaced)
                        Text(viewModel.description)
                            .font(.title2)
                            .fontDesign(.monospaced)
                        Text(viewModel.humidity)
                            .fontDesign(.monospaced)
                        Text(viewModel.wind)
                            .fontDesign(.monospaced)
                    }
                    .padding(40)
                }
            }
            .navigationTitle("Whether the weather")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}
