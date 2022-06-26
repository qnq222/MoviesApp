//
//  TopTicketView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 15/06/2022.
//

import SwiftUI

struct TopTicketView<T: Movie>: View {
    
    var ticket: Ticket<T>
    var seat = Seat.default
    
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                Text(ticket.movie.studio ?? "Unknown")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.gray)
                Text(ticket.movie.title)
                    .font(.system(size: 30, weight: .black))
            }.frame(minWidth: 0.0, maxWidth:.infinity, alignment: .leading)
                .padding(.top, 30)
                .padding(.horizontal)
            Image(uiImage: UIImage(named: "Visa")!)
                .resizable().frame(minWidth: 0.0, maxWidth: .infinity)
                .scaledToFit()
                
            HStack{
        
                TicketDetailView(detail1: "SCREEN", detail2: "18", detail3: "PRICE", detail4: "$5.68")
                TicketDetailView(detail1: "ROW", detail2: "\(seat.row)", detail3: "DATE", detail4: "\(ticket.date.day)/\(ticket.date.month)/\(ticket.date.year)")
                TicketDetailView(detail1: "SEAT", detail2: "\(seat.number)", detail3: "TIME", detail4: ticket.hour)
            }.padding(.vertical)
        }
    }
}

struct TopTicketView_Previews: PreviewProvider {
    static var previews: some View {
        TopTicketView(ticket: Ticket<Popular>.default)
    }
}
