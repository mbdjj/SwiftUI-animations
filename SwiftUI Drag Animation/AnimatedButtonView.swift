//
//  AnimatedButtonView.swift
//  SwiftUI Drag Animation
//
//  Created by Marcin Bartminski on 31/12/2022.
//

import SwiftUI

struct AnimatedButtonView: View {
    
    @State var buttonPresses = 0
    
    var width: CGFloat {
        if buttonPresses < 4 {
            return 50
        } else {
            return 150
        }
    }
    
    var height: CGFloat {
        if buttonPresses < 4 {
            return 50
        } else {
            return 45
        }
    }
    
    var cornerRadius: CGFloat {
        if buttonPresses < 4 {
            return 25
        } else {
            return 10
        }
    }
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                if buttonPresses < 4 {
                    buttonPresses += 1
                } else {
                    buttonPresses = 0
                }
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .foregroundColor(.primary)
                    .frame(width: width, height: height)
                
                if buttonPresses < 4 {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.init(uiColor: .systemBackground))
                } else {
                    HStack {
                        Text("Continue")
                            .foregroundColor(.init(uiColor: .systemBackground))
                            .bold()
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(.init(uiColor: .systemBackground))
                    }
                }
            }
        }
    }
}

struct AnimatedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedButtonView()
    }
}
