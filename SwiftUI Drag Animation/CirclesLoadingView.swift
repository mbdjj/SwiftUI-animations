//
//  CirclesLoadingView.swift
//  SwiftUI Drag Animation
//
//  Created by Marcin Bartminski on 10/12/2022.
//

import SwiftUI

struct CirclesLoadingView: View {
    
    @State var offset = CGSize.zero
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            ForEach (0 ..< 4) { num in
                Circle()
                    .frame(width: 20)
                    .foregroundColor(circleColor(num))
                    .offset(offset)
                    .animation(.default.delay(Double(num) * 0.5), value: offset)
            }
        }
        .onReceive(timer) { _ in
            offset.height -= 5
            if offset.height < -40 {
                offset.height = 40
            }
        }
    }
    
    func circleColor(_ num: Int) -> Color {
        switch num {
        case 0:
            return .red
        case 1:
            return .blue
        case 2:
            return .yellow
        case 3:
            return .green
        default:
            return .black
        }
    }
}

struct CirclesLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesLoadingView()
    }
}
