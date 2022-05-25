//
//  ChairView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 25/05/2022.
//

import SwiftUI


struct ChairView: View {
    
    var width: CGFloat = 50
    var accentColor: Color = .lightPurple
    var seat = Seat.default
    @State var isSelected = false
    var isSelectable = true
    var onSelect: ((Seat)->()) = {_ in }
    var onDeselect: ((Seat)->()) = {_ in }
    
    
    var body: some View {
        VStack(spacing: 2) {
            Rectangle()
                .frame(width: self.width, height: self.width * 2/3)
                .foregroundColor(isSelectable ? isSelected ? accentColor : Color.gray.opacity(0.5) : accentColor)
                .cornerRadius(width / 5)
            
            Rectangle()
                .frame(width: width - 10, height: width / 5)
                .foregroundColor(isSelectable ? isSelected ? accentColor :  Color.gray.opacity(0.5) : accentColor)
                .cornerRadius(width / 5)
        }
        .onTapGesture {
            //we call the onSelect closure when isSelected is true passing in the current seat,
            //otherwise we call onDeselect. Let’s now put everything together inside the TheatreView view.
            
            if self.isSelectable{
                self.isSelected.toggle()
                if self.isSelected{
                    self.onSelect(self.seat)
                } else {
                    self.onDeselect(self.seat)
                }
            }
        }
    }
}

struct ChairView_Previews: PreviewProvider {
    static var previews: some View {
        ChairView()
    }
}

