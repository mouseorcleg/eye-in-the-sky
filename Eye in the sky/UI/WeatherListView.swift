//
//  WeatherListView.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import SwiftUI

struct WeatherListView: View {
    
    // updates when viewModel data is updated
    @StateObject var viewModel = WeatherListViewModel()
    @EnvironmentObject var repo: WeatherRepository
    
    var body: some View {
        NavigationView {
            List(0..<10) { item in
                CellListView(viewModel: CellListView.WeatherViewModel(city: WeatherRepository.cityList.randomElement() ?? "London", repo: Eye_in_the_skyApp.weatherRepo))
                           }
        }
        
        .navigationTitle("Whether the weather")
        .navigationBarTitleDisplayMode(.automatic)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}
