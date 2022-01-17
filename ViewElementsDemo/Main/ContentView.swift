//
//  ContentView.swift
//  ViewElementsDemo
//
//  Created by Infinity Tech on 10/1/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        ZStack{
            NavigationView{
                PickerStyleView()
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
