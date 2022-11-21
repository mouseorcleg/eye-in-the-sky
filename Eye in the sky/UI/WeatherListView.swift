//
//  WeatherListView.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import SwiftUI

struct WeatherListView: View {
    
    // updates when viewModel data is updated
    @StateObject var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            
            //Check how to create a list correctly
            
//            for city in viewModel.cityList {
//                let cell = CellListView(city: city)
//
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
