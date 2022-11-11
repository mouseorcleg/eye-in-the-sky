//
//  ContentView.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    // updates when viewModel data is updated
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                //fetches data from a viewModel
                VStack {
                    Text(viewModel.title)
                        .font(.title)
                    Text(viewModel.temp)
                        .font(.largeTitle)
                    Text(viewModel.description)
                        .font(.title2)
                    Text(viewModel.humidity)
                }
                .padding(40)
            }
            .navigationTitle("Whether the weather")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
