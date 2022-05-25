//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import SwiftUI

struct MovieListView<T: Movie>: View {
    
    @Environment(\.self) var env
    
    var movies: [T]
    var section: HomeSection
    
    var body: some View {
        NavigationView {
            
            List(0..<movies.count) { i in
                MovieListRow<T>(movie: self.movies[i])
            }.navigationTitle(section.rawValue)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            env.dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.darkPurple)
                        }
                    }
                }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView<Popular>(movies: [], section: .Trending)
    }
}

