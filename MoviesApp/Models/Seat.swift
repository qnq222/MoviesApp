//
//  Seat.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 25/05/2022.
//

import Foundation

struct Seat: Identifiable {
    var id: UUID
    var row: Int
    var number: Int
    static var `default`: Seat { Seat(id: UUID(), row: 0, number: 0) }
}
