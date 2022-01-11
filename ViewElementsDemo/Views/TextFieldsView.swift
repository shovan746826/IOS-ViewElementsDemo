//
//  TextFieldsView.swift
//  ViewElementsDemo
//
//  Created by Infinity Tech on 10/1/22.
//

import SwiftUI

struct TextFieldsView: View {
    
    @State var textLabel: String = ""
    @State var text: String = ""
    
    @State var isTapped = false
    @FocusState private var nameIsFocused: Bool
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 4, content: {
                
                HStack{
                    TextField("", text: $text) { (status) in
                        if status {
                            withAnimation(.easeIn){
                                isTapped = true
                            }
                        }
                    } onCommit: {
                        print("onCommit")
                        if text == "" {
                            withAnimation(.easeOut){
                                isTapped = false
                            }
                        }
                        
                    }
                    .focused($nameIsFocused)
                    
                    Button(action: {
                        withAnimation(.easeOut){
                            nameIsFocused = false
                            isTapped = false
                            text = ""
                        }
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    })
                }
                .padding(.top, isTapped ? 15 : 0)
                .background(
                    Text(textLabel)
                        .scaleEffect(isTapped ? 0.8 : 1)
                        .offset(x: isTapped ? -7 : 0, y: isTapped ? -15.0 : 0)
                        .foregroundColor(isTapped ? Color.accentColor : Color.gray),
                    alignment: .leading
                )
                
                Rectangle()
                    .fill(isTapped ? Color.accentColor : Color.gray)
                    .opacity(isTapped ? 1 : 0.5)
                    .frame(height: 1)
                    .padding(.top, 10)
            })
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(Color.gray.opacity(0.09))
                .cornerRadius(5)
            
        }
        .padding()
    }
}

struct TextFieldsView_Previews: PreviewProvider {
    
    @State static var textLabel: String = "Enter Text"
    
    static var previews: some View {
        TextFieldsView(textLabel: textLabel)
    }
}
