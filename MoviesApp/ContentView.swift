//
//  ContentView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var model = MovieViewModel()
    @State private var showDetails = false
    @State private var selectedIndex: Int?
    @State private var section: HomeSection = .Popular
    @State private var showSheet = false
    
    var body: some View {
        
        var popular: [Popular] = []
        var trending: [Trending] = []
        var actors: [Actor]  = []
        var upcoming: [Upcoming] = []
        switch section {
        case .Popular:
            popular = model.allItems[section] as! [Popular]
        case .Actors:
            actors = model.allItems[section] as! [Actor]
        case .Trending:
            trending = model.allItems[section] as! [Trending]
        case .Upcoming:
            upcoming = model.allItems[section] as! [Upcoming]
        }
        
        return NavigationView {
            createCollectionView().navigationTitle("Movies").ignoresSafeArea().fullScreenCover(isPresented: self.$showSheet) {
                if self.selectedIndex == nil{
                    if self.section == HomeSection.Trending {
                        MovieListView<Trending>(movies: trending, section: .Trending)
                    }
                    
                    if self.section == HomeSection.Popular {
                        MovieListView<Popular>(movies: popular, section: .Popular)
                        
                    }
                    if self.section == HomeSection.Upcoming {
                        MovieListView<Upcoming>(movies: upcoming, section: .Upcoming)
                    }
                    if self.section == HomeSection.Actors {
                        ActorListView(actors: actors, section: .Actors)
                    }
                }  else {
                    if self.section == HomeSection.Trending {
                        SingleMovieView(movie: trending[self.selectedIndex!])
                    }
                    if self.section == HomeSection.Popular {
                        SingleMovieView(movie: popular[self.selectedIndex!])
                    }
                    if self.section == HomeSection.Upcoming {
                        SingleMovieView(movie: upcoming[self.selectedIndex!])
                    }
                    if self.section == HomeSection.Actors {
                        ActorDetailView(actor: actors[self.selectedIndex!])
                    }
                }
            }
        }
    }
    
    fileprivate func createCollectionView() -> MovieCollectionView {
        return MovieCollectionView(allItems: model.allItems, didSelectItem: { indexPath in
            self.selectedIndex = indexPath.item
            self.section = HomeSection.allCases[indexPath.section]
            self.showSheet.toggle()
            
        }, seeAllforSection: { section in
            self.section = section
             self.showSheet.toggle()
             self.selectedIndex = nil
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
