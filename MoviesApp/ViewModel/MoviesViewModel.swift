//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import SwiftUI

// We create the HomeSection enum which will be used as keys to retrieve specific section from the model:
enum HomeSection: String, CaseIterable {
    case Trending
    case Popular
    case Upcoming
    case Actors
}

//Then in the ViewModel, we read the file containing the data,
//decode it and set the published property to notify interested views so that they can reload
//and reflect the current state of the model.
class MovieViewModel: ObservableObject {
    @Published var allItems: [HomeSection:[Codable]] = [:]
    
    init() {
        getAll()
    }
    
    private func getAll(){
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let url = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let result = try decoder.decode(MovieBundle.self, from: data)
                allItems = [HomeSection.Trending: result.trending,
                            HomeSection.Popular: result.popular,
                            HomeSection.Upcoming: result.upcoming,
                            HomeSection.Actors: result.actors]
            } catch let e{
                print(e)
            }
        }
    }
}
