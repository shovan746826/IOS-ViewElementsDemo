//
//  ContentView.swift
//  ViewElementsDemo
//
//  Created by Infinity Tech on 10/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShow: Bool = false
    @State var isAnimate: Bool = false
    
    var body: some View {
        
        
        ZStack{
            
            
            Button(action: {
                withAnimation{
                    isShow = true
                    isAnimate = true
                }
            }, label: {
                Text("Show Popup")
                    .foregroundColor(.black)
            })
            
            CustomModalPopupView(isShow: $isShow, isAnimate: $isAnimate)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
