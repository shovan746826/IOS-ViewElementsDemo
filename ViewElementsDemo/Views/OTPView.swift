//
//  OTPView.swift
//  OTPView
//
//  Created by Infinity Tech on 4/1/22.
//

import SwiftUI

struct OTPView: View {
    
    @State var code: [String] = []
    
    @State var isPadShow: Bool = false
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text("Enter Verification Code")
                .font(.title)
                .padding(.bottom, 20)
            
            HStack(spacing: 20){
                ForEach(code, id: \.self){i in
                    Text(i)
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            .frame(minWidth: 250, minHeight: 50, alignment: .center)
            .border(Color.green, width: 2)
            .padding()
            .onTapGesture {
                isPadShow = true;
            }
            
            Spacer()
            
            if isPadShow{
                NumberPadView(text: $code, isPadShow: $isPadShow)
            }
        }
    }
}


