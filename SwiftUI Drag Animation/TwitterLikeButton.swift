//
//  TwitterLikeButton.swift
//  SwiftUI Drag Animation
//
//  Created by Marcin Bartminski on 09/04/2023.
//

import SwiftUI

struct TwitterLikeButton: View {
    
    @State var liked: Bool = false
    
    @State var animateCircle1 = false
    @State var animateCircle2 = false
    @State var animateHeart = false
    
    @State var animateHeartBack = true
    
    var body: some View {
        ZStack {
            if !liked {
                Image(systemName: "heart")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        liked = true
                    }
                    .scaleEffect(animateHeart ? 1.2 : !animateHeartBack ? 1.4 : 1)
                    .animation(.easeInOut(duration: 0.05), value: animateHeart)
                    .animation(.easeOut(duration: 0.2), value: animateHeartBack)
            } else {
                
                Circle()
                    .frame(width: !animateCircle1 ? 0 : 25)
                    .foregroundColor(!animateCircle1 ? .red : .purple)
                    .animation(.spring(response: 0.1, dampingFraction: 1, blendDuration: 0.2), value: animateCircle1)
                
                Circle()
                    .frame(width: !animateCircle2 ? 0 : 26)
                    .foregroundColor(Color(uiColor: .systemBackground))
                    .onTapGesture {
                        liked = false
                    }
                    .animation(.spring(response: 0.1, dampingFraction: 1, blendDuration: 0.2), value: animateCircle2)
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .onTapGesture {
                        liked = false
                    }
                    .scaleEffect(!animateHeart ? 0.0 : 1.0)
                    .animation(.spring(response: 0.1, dampingFraction: 0.5, blendDuration: 0.3), value: animateHeart)
            }
        }
        .onChange(of: liked) { _ in
            if liked {
                animateHeartBack = false
                animateCircle1 = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    animateCircle2 = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                        animateHeart = true
                    }
                }
            } else {
                animateCircle1 = false
                animateCircle2 = false
                animateHeart = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    animateHeartBack = true
                }
            }
        }
    }
}

struct TwitterLikeButton_Previews: PreviewProvider {
    static var previews: some View {
        TwitterLikeButton()
    }
}
