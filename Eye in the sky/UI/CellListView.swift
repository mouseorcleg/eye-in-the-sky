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
    
    var city: String
    
    init(city: String) {
        self.city = city
        self._viewModel = StateObject(wrappedValue: WeatherViewModel(city: city))
    }
    
    
    
    var body: some View {
        
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
            .padding(14)
        }
        
    }
}


struct CellListView_Previews: PreviewProvider {
    static var previews: some View {
        CellListView(city: "London")
    }
}
