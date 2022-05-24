//
//  ContentView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var model = MovieViewModel()
    
    var body: some View {
        let movieCollectionView = createCollectionView().edgesIgnoringSafeArea(.all).navigationBarTitle("Movies")

        return NavigationView {
            movieCollectionView
        }
    }
    
    fileprivate func createCollectionView() -> MovieCollectionView {
        return MovieCollectionView(allItems: model.allItems, didSelectItem: { indexPath in }, seeAllforSection: { section in })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
