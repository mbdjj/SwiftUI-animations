//
//  PageView.swift
//  SwiftUI Drag Animation
//
//  Created by Marcin Bartminski on 10/12/2022.
//

import SwiftUI

struct PageView: View {
    
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            CircleDragView()
                .tag(0)
            CirclesLoadingView()
                .tag(1)
            AnimatedButtonView()
                .tag(2)
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        //.ignoresSafeArea()
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
