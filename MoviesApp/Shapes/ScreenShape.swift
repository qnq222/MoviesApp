//
//  ScreenShape.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 25/05/2022.
//

import SwiftUI

struct ScreenShape: Shape {
    
    // The above code draws a curved line from left to right, and depending on the isClip flag,
    // we will draw the bottom shape which looks like a reversed bucket to which we will be adding
    // the gradient that will mimic a screen light reflection. With that in place,
    // all of the errors will be fixed, just build the project if it doesn’t happen automagically.
    
    var screenCurveture: CGFloat = 30
    var isClip = false
    
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: rect.origin.x + screenCurveture, y: rect.origin.y +  screenCurveture))
            path.addQuadCurve(to: CGPoint(x: rect.width - screenCurveture, y: rect.origin.y + screenCurveture), control: CGPoint(x: rect.midX, y: rect.origin.y))
            
            if isClip{
                path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                path.addLine(to: CGPoint(x: rect.origin.x, y: rect.height))
                path.closeSubpath()
            }
        }
    }
}
