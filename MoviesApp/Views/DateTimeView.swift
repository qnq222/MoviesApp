//
//  DateTimeView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 25/05/2022.
//

import SwiftUI

struct DateTimeView: View {
    
    
    @State private var selectedDate: TicketDate = TicketDate.default
    @State private var selectedHourndex: Int = -1
    @Binding var date: TicketDate
    @Binding var hour: String
    private let dates = Date.getFollowingThirtyDays()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            createDateView()
            createTimeView()
        }
        
    }
    
    func createDateView() -> some View{
        VStack(alignment: .leading) {
            Text("Date")
                .font(.headline).padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(dates, id: \.day){ date in
                        DateView(date: date, isSelected: self.selectedDate.day == date.day, onSelect: { selectedDate in
                            self.selectedDate = selectedDate
                            self.date = selectedDate
                        })
                    }
                }.padding(.horizontal)
            }
        }
    }
    
    func createTimeView() -> some View {
        VStack(alignment: .leading) {
            Text("Time").font(.headline).padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(0..<24, id: \.self){ i in
                        TimeView(index: i, isSelected: self.selectedHourndex == i, onSelect: { selectedIndex in
                            self.selectedHourndex = selectedIndex
                            self.hour = "\(selectedIndex):00"
                        })
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct DateTimeView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimeView(date: .constant(TicketDate.default), hour: .constant(""))
    }
}
