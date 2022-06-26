//
//  BottomTicketView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 15/06/2022.
//

import SwiftUI

struct BottomTicketView: View {
    var body: some View {
         Image("Barcode")
                       .resizable()
                       .scaledToFit()
                       .padding(30)
                       .frame(minWidth: 0.0, maxWidth: .infinity)
            .foregroundColor(Color.gray)
    }
}

struct BottomTicketView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTicketView()
    }
}
