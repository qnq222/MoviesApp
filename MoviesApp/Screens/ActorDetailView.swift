//
//  ActorDetailView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import SwiftUI

struct ActorDetailView: View {
    
    @Environment(\.self) var env
    var actor: Actor
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Image(uiImage: UIImage(named: actor.image) ?? UIImage() )
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(actor.name)
                        .font(.system(size: 35, weight: .black, design: .rounded))
                        .padding(.horizontal)
                    Text(actor.bio)
                        .font(.body)
                        .padding()
                }
            }
            .navigationTitle("Actor Details")
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
}

struct ActorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActorDetailView(actor:  Actor.default)
    }
}
