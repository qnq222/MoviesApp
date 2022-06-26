//
//  Ticket.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 15/06/2022.
//

import Foundation

struct Ticket<T: Movie>: Identifiable {
    var id: UUID
    var movie: T
    var date: TicketDate
    var hour: String
    static var `default`: Ticket<Popular>{
        .init(id: UUID(), movie: Popular.default, date: TicketDate.default, hour: "")
    }
}
