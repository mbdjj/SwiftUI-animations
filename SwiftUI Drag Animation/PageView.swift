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
        
        NavigationStack {
            List {
                NavigationLink("Circle drag", destination: CircleDragView())
                
                NavigationLink("Circles loading", destination: CirclesLoadingView())
                
                NavigationLink("Continue button", destination: AnimatedButtonView())
                
                NavigationLink("Rotating pills", destination: RotatingPillsView())
                
                NavigationLink("Twitter like button", destination: TwitterLikeButton())
            }
            .navigationTitle("SwiftUI Animation")
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
