//
//  CustomModalPopupView.swift
//  ViewElementsDemo
//
//  Created by Infinity Tech on 13/1/22.
//

import SwiftUI

struct CustomModalPopupView: View {
    
    @Binding var isShow: Bool
    @Binding var isAnimate: Bool
    
    var body: some View {
        ZStack(alignment: .bottom){
            if isShow {
                Color.black
                    .opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation{
                            isShow = false
                            isAnimate = false
                        }
                    }
                
                VStack(){
                    
                }
                .frame(height: 250)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .transition(.move(edge: .bottom))
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .animation(Animation.easeInOut(duration: 1.5), value: true)
//        .animation(.easeInOut)
        .ignoresSafeArea()
    }
}

struct CustomModalPopupView_Previews: PreviewProvider {
    
    @State static var isShow: Bool = true
    @State static var isAnimate: Bool = true
    
    static var previews: some View {
        CustomModalPopupView(isShow: $isShow, isAnimate: $isAnimate)
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}



