//
//  MileageView.swift
//  NodeJS_Thingy_Cars
//
//  Created by Martin Terhes on 5/21/23.
//

import SwiftUI
import Charts

struct MileageView: View {
    
    @State var mileageData: [Mileage]
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(alignment: .leading) {
                Text("Average mileage / year")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                Text("\(calculateAvgMileage(mileageData)) km")
                    .font(.title2)
                    .bold()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Chart(mileageData, id: \.id) { data in
                PointMark(
                    x: .value("Year", data.getDate()),
                    y: .value("Mileage", data.mileage)
                )
                LineMark(
                    x: .value("Year", data.getDate()),
                    y: .value("Mileage", data.mileage)
                )
                .interpolationMethod(.catmullRom)
            }
            .frame(height: 250)
            .padding(.leading)
        }
    }
    
    func calculateAvgMileage(_ mileageData: [Mileage]) -> Int {
        let firstData: Mileage = mileageData.first!
        let lastData: Mileage = mileageData.last!
        
        let mileageDelta = lastData.mileage - firstData.mileage
        let yearDelta = lastData.getYear() - firstData.getYear()
        
        return Int(mileageDelta / yearDelta)
    }
}

struct MileageView_Previews: PreviewProvider {
    static var previews: some View {
        MileageView(mileageData: testCar.mileage!)
    }
}
