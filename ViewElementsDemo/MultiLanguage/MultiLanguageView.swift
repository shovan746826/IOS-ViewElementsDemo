//
//  MultiLanguageView.swift
//  ViewElementsDemo
//
//  Created by Infinity Tech on 19/1/22.
//

import SwiftUI

struct MultiLanguageView: View {
    
    
    @ObservedObject var localizableViewModel = LocalizableViewModel()
    
    var body: some View {
        VStack {
            
            HStack{
                Button(action: {
                    localizableViewModel.changeLocalize(localize: "en")
                }, label: {
                    Text("English")
                })
                    .padding()
                    .border(.black, width: 2)
                    .padding(.trailing, 20)
                
                Button(action: {
                    localizableViewModel.changeLocalize(localize: "bn-BD")
                }, label: {
                    Text("Bangla")
                })
                    .padding()
                    .border(.black, width: 2)
                    .padding(.leading, 20)
            }
            
            Text(localizableViewModel.helloWorld)
        }
    }
}

struct MultiLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        MultiLanguageView()
    }
}
