//
//  CircleDragView.swift
//  SwiftUI Drag Animation
//
//  Created by Marcin Bartminski on 10/12/2022.
//

import SwiftUI

struct CircleDragView: View {
    
    @State var offset = CGSize.zero
    
    var body: some View {
        Circle()
            .frame(width: 50)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        offset = value.translation
                    }
                    .onEnded{ _ in
                        withAnimation(.spring()) {
                            offset = CGSize.zero
                        }
                    }
            )
    }
}

struct CircleDragView_Previews: PreviewProvider {
    static var previews: some View {
        CircleDragView()
    }
}
