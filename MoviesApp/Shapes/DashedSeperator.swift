//
//  DashedSeperator.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 15/06/2022.
//

import SwiftUI

struct DashedSeperator: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.origin.y ))
        path.closeSubpath()
        return path
    }
}

