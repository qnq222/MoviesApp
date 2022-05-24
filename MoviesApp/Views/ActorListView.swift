//
//  ActorListView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import SwiftUI

struct ActorListView: View {
    
    @Environment(\.self) var env
    var actors: [Actor]
    var section: HomeSection
    
    var body: some View {
        NavigationView {
            List(0..<actors.count) { i in
                ActorListRow(actor: self.actors[i])
            }.navigationBarTitle(section.rawValue)
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


struct ActorListView_Previews: PreviewProvider {
    static var previews: some View {
        ActorListView(actors: [], section: .Trending)
    }
}
