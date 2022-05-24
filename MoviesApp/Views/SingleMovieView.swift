//
//  MovieDetails.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import SwiftUI

struct SingleMovieView<T: Movie>: View {
    
    @Environment(\.self) var env
    var movie: T
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    createPosterImage()
                    MovieDetailView(movie: self.movie)
                }
            }.navigationTitle("Movie Details")
                .navigationBarTitleDisplayMode(.inline)
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
    
    fileprivate func createPosterImage() -> some View {
        return Image(uiImage: UIImage(named: "\(movie.image).jpg") ?? UIImage() ).resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        SingleMovieView<Popular>(movie: Popular.default)
    }
}



