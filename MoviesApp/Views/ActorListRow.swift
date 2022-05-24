//
//  ActorListRow.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import SwiftUI

struct ActorListRow: View {
    var actor: Actor
    
    var body: some View {
        
       return ZStack(alignment: .bottom) {
        Image(uiImage: UIImage(named: "\(actor.image).jpg") ?? UIImage() )
                .resizable()
                .aspectRatio(contentMode: .fit).cornerRadius(20)
            VStack {
                Text(actor.name)
                    .font(.system(size: 25, weight: .black, design: .rounded))
                    .foregroundColor(Color.white)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]) , startPoint: .bottom , endPoint: .top)).cornerRadius(20)
                .shadow(radius: 10)
        }.padding(.vertical)
    }
}
