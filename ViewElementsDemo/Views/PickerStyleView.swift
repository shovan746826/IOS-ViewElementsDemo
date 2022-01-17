//
//  PickerView.swift
//  ViewElementsDemo
//
//  Created by Infinity Tech on 18/1/22.
//

import SwiftUI

struct PickerStyleView: View {
    
    let pickerDate: [String] = ["Male", "Female", "Other"]
    @State var selection: Int = 0
    
    var body: some View {
        VStack{
            Picker(
                selection: $selection,
                label: Text("Pick"),
                content: {
                    ForEach(0..<pickerDate.count){ count in
                        Text(pickerDate[count]).tag(count)
                    }
                }
            ).padding(.bottom, 20)
            
            Form{
                Section{
                    Picker(
                        selection: $selection,
                        label: Text("Select"),
                        content: {
                            ForEach(0..<pickerDate.count){ count in
                                Text(pickerDate[count]).tag(count)
                            }
                        }
                    )
                }
                
            }
            .frame(maxHeight: 100, alignment: .center)
            
            Menu("Select \(pickerDate[selection])") {
                Picker(
                    selection: $selection,
                    label: Text("Select"),
                    content: {
                        ForEach(0..<pickerDate.count){ count in
                            Text(pickerDate[count]).tag(count)
                        }
                    }
                ).pickerStyle(MenuPickerStyle())
                    .padding(.bottom, 20)
            }
            
            
            Picker(
                selection: $selection,
                label: Text("Pick"),
                content: {
                    ForEach(0..<pickerDate.count){ count in
                        Text(pickerDate[count]).tag(count)
                    }
                }
            ).pickerStyle(WheelPickerStyle())
                .padding(.bottom, 20)
            
            Picker(
                selection: $selection,
                label: Text("Pick"),
                content: {
                    ForEach(0..<pickerDate.count){ count in
                        Text(pickerDate[count]).tag(count)
                    }
                }
            ).pickerStyle(SegmentedPickerStyle())
                .padding(.bottom, 20)
            
            
            Spacer()
           
        }
    }
}

struct PickerStyleView_Previews: PreviewProvider {
    static var previews: some View {
        PickerStyleView()
    }
}
