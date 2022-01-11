//
//  NumberPadView.swift
//  OTPView
//
//  Created by Infinity Tech on 4/1/22.
//

import SwiftUI

struct NumberPadView: View {
    
    @Binding var text: [String]
    @Binding var isPadShow: Bool
    
    var body: some View {
        ZStack {
            VStack(alignment: .trailing, spacing: 20){
                    ForEach(data){i in
                        HStack(spacing: self.getspacing()){
                            ForEach(i.row){j in
                                Button(action:{
                                    if (j.value == "delete.left.fill"){
                                        if(!self.text.isEmpty){
                                            self.text.removeLast()
                                        }
                                    }else {
                                        if(self.text.count<6){
                                            self.text.append(j.value)
                                        }
                                        if(self.text.count == 6){
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                print("OTP Submit")
                                                self.text.removeAll()
                                                isPadShow = false
                                            }
                                            
                                        }
                                    }
                                }){
                                    if (j.value == "delete.left.fill"){
                                        Image(systemName: j.value)
                                            .foregroundColor(.black)
                                            .font(.body)
                                            .padding(.vertical)
                                    }else {
                                        Text(j.value)
                                            .foregroundColor(.black)
                                            .font(.title)
                                            .fontWeight(.semibold)
                                            .padding(.vertical)
                                    }
                                }
//                                .frame(width: 80, height: 60, alignment: .center)
//                                .background(.gray)
//                                .padding()
                                
                            }
                        }
                    }
            }
        }
    }
    
    func getspacing()->CGFloat {
        return UIScreen.main.bounds.width / 3
    }
}



struct type : Identifiable {
    var id: Int
    var row: [row]
}

struct row : Identifiable {
    var id: Int
    var value: String
}

var data = [
    type(id: 0, row: [row(id: 0, value: "1"), row(id: 1, value: "2"), row(id: 2, value: "3")]),
    type(id: 1, row: [row(id: 0, value: "4"), row(id: 1, value: "5"), row(id: 2, value: "6")]),
    type(id: 2, row: [row(id: 0, value: "7"), row(id: 1, value: "8"), row(id: 2, value: "9")]),
    type(id: 3, row: [row(id: 1, value: "0"), row(id: 2, value: "delete.left.fill")])
]
