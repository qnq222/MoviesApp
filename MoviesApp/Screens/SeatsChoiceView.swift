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
                    MyButton(text: "Continue", action: {
                        self.showBasket = self.validateInputs()
                        withAnimation {
                            self.showPopup = !self.validateInputs()
                        }
                    }).sheet(isPresented: self.$showBasket) {
                        BasketView(ticket: Ticket(id: UUID(), movie: self.movie, date: self.date, hour: self.hour) , selectedSeats: self.selectedSeats)
                    }.padding()
                    
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
            
        }.blur(radius: self.showPopup ? 10 : 0).overlay(
            VStack{
                if self.showPopup {
                    self.createPopupContent()
                } else {
                    EmptyView()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background( self.showPopup ? Color.background.opacity(0.3) : .clear)
        )
    }
    
    fileprivate func createPopupContent() -> some View {
        VStack {
            Text("Not allowed").font(.system(size: 20, weight: Font.Weight.semibold))
            Text("You need to select at least one seat, a date and hour in order to continue.")
                .multilineTextAlignment(.center).frame(maxHeight: .infinity)
            MyButton(text: "Ok") {
                withAnimation {
                    self.showPopup.toggle()
                }
            }
        }.frame(width: UIScreen.main.bounds.width * 0.8, height: 200, alignment: .bottom)
            .padding()
            .background(Color.background.opacity(0.7))
            .cornerRadius(20)
            .shadow(color: Color.textColor.opacity(0.3), radius: 20, x: 0, y: 10)
            .transition(.move(edge: .bottom))
    }
    
    fileprivate func validateInputs() -> Bool {
        self.selectedSeats.count > 0
        && self.date != TicketDate.default
        && !self.hour.isEmpty
    }
}

struct SeatsChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsChoiceView(movie: Popular.default)
    }
}

