//
//  TheatreView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 25/05/2022.
//

import SwiftUI

struct TheatreView: View {
    
    @Binding var selectedSeats:[Seat]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.darkPurple.opacity(0.3), .clear]) , startPoint: .init(x: 0.5, y: 0.0), endPoint: .init(x: 0.5, y: 0.5)) )
                .frame(height: 420)
                .clipShape(ScreenShape(isClip: true))
                .cornerRadius(20)
            ScreenShape()
                .stroke(style:  StrokeStyle(lineWidth: 5,  lineCap: .square))
                .frame(height: 420)
                .foregroundColor(Color.accent)
            
            VStack {
                createFrontRows()
                createBackRows()
                createSeatsLegend()
            }
        }
    }
    
    // MARK: -
    func createFrontRows() -> some View {
        let rows: Int = 2
        let numbersPerRow: Int = 7
        
        //to create a grid in swift ui, we need nest an HStack inside a VStack or vice-versa,
        //which is becomes very inefficient for a larger amount of data,
        //so I wouldn’t use this as a UICollectionView. However, for our use-case,
        //it won’t be an issue, we are good.
        
        return VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack{
                    ForEach(0..<numbersPerRow, id: \.self){ number in
                        ChairView(width: 30, accentColor: .accent, seat: Seat(id: UUID(), row: row + 1, number: number + 1) , onSelect: { seat in
                            self.selectedSeats.append(seat)
                        }, onDeselect: { seat in
                            self.selectedSeats.removeAll(where: {$0.id == seat.id})
                        })
                    }
                }
            }
        }
    }
    
    // MARK: -
    func createBackRows() -> some View {
        let rows: Int = 5
        let numbersPerRow: Int = 9
        
        return VStack {
            // add 3 to rows and 15 to columns each time we create a new Seat to account
            // for the front rows that have already been created.
            ForEach(0..<rows, id: \.self) { row in
                HStack{
                    ForEach(0..<numbersPerRow, id: \.self){ number in
                        ChairView(width: 30, accentColor: .accent, seat: Seat(id: UUID(), row: row + 3, number: number + 15) , onSelect: { seat in
                            self.selectedSeats.append(seat)
                        }, onDeselect: { seat in
                            self.selectedSeats.removeAll(where: {$0.number == seat.number})
                        })
                    }
                }
            }
        }
    }
    
    // MARK: -
    func createSeatsLegend() -> some View{
        HStack{
            ChairLegend(text: "Selected", color: .accent)
            ChairLegend(text: "Reserved", color: .clearPurple)
            ChairLegend(text: "Available", color: .gray)
        }.padding(.horizontal, 20).padding(.top)
    }
    
}

struct TheatreView_Previews: PreviewProvider {
    static var previews: some View {
        TheatreView(selectedSeats: .constant([]))
    }
}
