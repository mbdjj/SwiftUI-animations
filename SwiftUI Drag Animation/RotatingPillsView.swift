//
//  RotatingPillsView.swift
//  SwiftUI Drag Animation
//
//  Created by Marcin Bartminski on 25/02/2023.
//

import SwiftUI

struct RotatingPillsView: View {
    
    @State var animate = false
    
    var body: some View {
        Grid(horizontalSpacing: 3, verticalSpacing: 15) {
            ForEach(0 ..< 50) { row in 
                GridRow {
                    ForEach(0 ..< 25) { col in
                        Capsule()
                            .frame(width: 15, height: 3)
                            .rotationEffect(Angle(degrees: animate ? 360 : 0))
                            .animation(
                                .linear(duration: 2)
                                .repeatForever(autoreverses: false)
                                .delay(Double(row + col) * 0.05),
                                value: animate
                            )
                    }
                }
            }
        }
        .onAppear {
            animate = true
        }
    }
}

struct RotatingPillsView_Previews: PreviewProvider {
    static var previews: some View {
        RotatingPillsView()
    }
}
