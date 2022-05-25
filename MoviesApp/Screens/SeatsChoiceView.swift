//
//  SeatsChoiceView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 25/05/2022.
//

import SwiftUI


struct SeatsChoiceView<T: Movie>: View {
    
    @Environment(\.self) var env
    var movie: T
    
    @State private var selectedSeats: [Seat] = []
    @State private var showBasket: Bool = false
    @State private var date: TicketDate = TicketDate.default
    @State private var hour: String = ""
    @State private var showPopup = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false ) {
                VStack(spacing: 0) {
                    TheatreView(selectedSeats: self.$selectedSeats).padding(.top, 20)
                    DateTimeView(date: self.$date, hour: self.$hour)
                    MyButton(text: "Continue", action: {}).padding()
                    
                }.navigationTitle("Choose seats")
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
}

struct SeatsChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsChoiceView(movie: Popular.default)
    }
}

