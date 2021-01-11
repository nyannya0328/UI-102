//
//  Home.swift
//  UI-102
//
//  Created by にゃんにゃん丸 on 2021/01/11.
//

import SwiftUI

struct Home: View {
    @StateObject var model = HomeViewModel()
    @Environment(\.colorScheme) var shceme
    var body: some View {
        HStack{
            
            ScrollView{
                
                
                LazyVStack(alignment: .leading, spacing: 10, pinnedViews: [.sectionHeaders], content: {
                    
                    
                    HStack{
                        
                        GeometryReader{reader -> AnyView in
                            
                            
                            let offset = reader.frame(in:.global).minY
                            
                            
                            if -offset >= 0 {
                                
                                DispatchQueue.main.async {
                                    self.model.offset = -offset
                                }
                            }
                            
                            return AnyView(
                                
                                Image("food")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0))
                                    .cornerRadius(3)
                                    .offset(y:offset > 0 ? -offset : 0)
                                    .overlay(
                                    
                                        HStack{
                                            
                                            
                                            Button(action: {}) {
                                                Image(systemName: "arrow.left")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .foregroundColor(.red)
                                                    
                                                    
                                            }
                                            
                                            Spacer()
                                            
                                            Button(action: {model.show.toggle()}) {
                                                Image(systemName: "suit.heart.fill")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .foregroundColor(.red)
                                                    
                                                    
                                            }
                                            
                                            
                                            
                                        }
                                        .padding(),alignment : .top
                                    
                                    
                                    )
                                        
                                        
                                        
                                        
                                    
                                
                                    
                                
                                    
                                
                                    
                                    
                                
                            )
                            
                            
                        }
                        .frame(height: 250)
                        
                    }
                    
                    
                    Section(header: HeaderView()){
                        
                        ForEach(tabs){tab in
                            
                            VStack(alignment: .leading, spacing: 10){
                                
                                Text(tab.tab)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.bottom)
                                    .padding(.leading)
                                
                                ForEach(tab.foods){food in
                                    
                                    CardView(food: food)
                                    
                                }
                                
                                Divider()
                                   .padding(.top)
                                }
                            .tag(tab.tab)
                            .overlay(
                                
                                GeometryReader{reader -> Text in

                                    let offset = reader.frame(in: .global).minY

                                    let height = UIApplication.shared.windows.first!.safeAreaInsets.top + 100

                                    if offset < height && offset > 50 && model.selected != tab.tab{


                                        DispatchQueue.main.async {
                                            self.model.selected = tab.tab
                                        }




                                    }
                                    return Text("")

                                }


                            )
                                 
                                
                                
                            }
                            
                        }
                
                        
                        
                    })
                    
                }
            }
       
        .overlay(
            (shceme == .dark ? Color.black : Color.white)
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                .ignoresSafeArea(.all, edges: .top)
                .opacity(model.offset > 250 ? 1 : 0)
            ,alignment: .top
                   
            
            
                   
        
        )
        .environmentObject(model)
        .preferredColorScheme(model.show ? .dark : .light)
        
        }
    }



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
