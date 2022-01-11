//
//  SlideMenuBarView.swift
//  Aeon
//
//  Created by Infinity Tech on 5/1/22.
//

import SwiftUI

struct SidebarHome: View {//NavigateView{}
    
    //for future use..
    @State var width = UIScreen.main.bounds.width - 90
    //to hide view
    @State var x = -UIScreen.main.bounds.width + 90
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
            
            DemoToolbar(x: $x)
            
            SlideMenuBarView(x: $x)
                .shadow(color: Color.black.opacity(x != 0 ? 0.1 : 0), radius: 5, x: 5, y: 0)
                .offset(x: x)
                .background(Color.black.opacity(x == 0 ? 0.5 : 0)
                                .ignoresSafeArea(.all, edges: .vertical)
                                .onTapGesture {
                    // hide the view when back pressed
                    withAnimation{
                        x = -width
                    }
                })
        }
        .gesture(DragGesture().onChanged({(value) in
            withAnimation{
                if (value.translation.width > 0) {
                    if (x < 0){
                        x = -width + value.translation.width
                    }
                }else {
                    x = value.translation.width
                }
            }
            
        }).onEnded({(value) in
            withAnimation{
                if (-x < width / 2) {
                    x = 0
                }else {
                    x = -width
                }
            }
        }))
    }
}


struct DemoToolbar : View {
    @Binding var x: CGFloat
    var body: some View {
        
        VStack{
            HStack{
                Button(action: {
                    withAnimation{
                        x = 0
                    }
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 24))
                        .foregroundColor(.blue)
                })
                
                Text("Sideber")
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            
            Spacer()
        }
        
    }
}


struct SlideMenuBarView: View {
    
    @Binding var x: CGFloat
    
    var body: some View {
        
//        let edges = UIApplication.shared.windows.first?.safeAreaInsets
        
        HStack{
            VStack(alignment: .leading){
                
                
                HStack{
                    Image("aeon_icon")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    VStack{
                        Text("Aeon")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("@_aeon")
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                }.frame(maxWidth: .infinity)
                    .padding(10)
                    .background(Color("AccentColor"))
                    .cornerRadius(20)
                
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading){
                        
                        MenuGroup_1(x: $x)
                        
                        Divider()
                        
                        MenuGroup_2(x: $x)
                        
                        MenuGroup_3(x: $x)

                    }
                }
                
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical)
            //since vartical edges are ignored...
//            .padding(.top, edges!.top == 0 ? 15 : edges?.top)
//            .padding(.bottom, edges!.bottom == 0 ? 15 : edges?.bottom)
            
            .frame(width: UIScreen.main.bounds.width - 90)
            .background(.white)
            
//            .ignoresSafeArea(.all, edges: .vertical)
            
            Spacer()
        }
        
    }
}

private struct MenuGroup_1 : View {
    
    @State var isNavigationBalance: Bool = false
    @State var isNavigationReward: Bool = false
    
    @Binding var x: CGFloat
    
    var body: some View {
       
        VStack{
            NavigationLink(destination: Text("Balance"), isActive: $isNavigationBalance, label: {
                Button(action: {
                    x = -UIScreen.main.bounds.width + 90
                    isNavigationBalance = true
                }){
                    MuneButton(title: "Balance", image: "dollarsign.circle")
                }
            })
            
            NavigationLink(destination: Text("Reward"), isActive: $isNavigationReward, label: {
                Button(action: {
                    x = -UIScreen.main.bounds.width + 90
                    isNavigationReward = true
                }){
                    MuneButton(title: "Reward", image: "gift.circle")
                }
            })
        }
    }
}

private struct MenuGroup_2 : View {
    
    @State var isNavigationAcctount: Bool = false
    @State var isNavigationAgent: Bool = false
    
    @Binding var x: CGFloat
    
    var body: some View {
        VStack{
            NavigationLink(destination: Text("Account"), isActive: $isNavigationAcctount, label: {
                Button(action: {
                    x = -UIScreen.main.bounds.width + 90
                    isNavigationAcctount = true
                }){
                    MuneButton(title: "Account", image: "baseline_face_black_24dp")
                }
            })
            
            NavigationLink(destination: Text("Agent Locator"), isActive: $isNavigationAgent, label: {
                Button(action: {
                    x = -UIScreen.main.bounds.width + 90
                    isNavigationAgent = true
                }){
                    MuneButton(title: "Agent Locator", image: "baseline_person_pin_circle_black_24dp")
                }
            })
            
           
        }
    }
}


private struct MenuGroup_3 : View {
    
    @State var isNavigationFavorites: Bool = false
    
    
    @Binding var x: CGFloat
    
    var body: some View {
        VStack{
            Divider()
                .padding(.top)

            NavigationLink(destination: Text("Favorites"), isActive: $isNavigationFavorites, label: {
                Button(action: {
                    x = -UIScreen.main.bounds.width + 90
                    isNavigationFavorites = true
                }){
                    MuneButton(title: "Favorites", image: "ic_favorite")
                }
            })

            Divider()

           
        }
    }
}


//struct SlideMenuBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SlideMenuBarView(x: )
//    }
//}

struct MenuType: Identifiable{
    var id: Int
    let title: String
    let image: String
}



private struct MuneButton: View {
    var title: String
    var image: String
    
    var body: some View {
        HStack(spacing: 15){
            Image(image)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(Color("AccentColor"))
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer()
        }
        .padding(.vertical, 12)
    }
}
