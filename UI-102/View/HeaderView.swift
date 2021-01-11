//
//  HeaderView.swift
//  UI-102
//
//  Created by にゃんにゃん丸 on 2021/01/11.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var model : HomeViewModel
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
        HStack{
            
            Button(action: {}) {
                
                Image(systemName: "arrow.left")
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: getsize(), height: getsize())
                    .foregroundColor(.primary)
                
                    
                
            }
            
            Text("Kavsoft Backery")
                .font(.title)
                .fontWeight(.bold)
            
            
        }
        
        ZStack{
            
            VStack(alignment: .leading, spacing: 10){
                
                Text("Asiatish . Koreantish . Japanush")
                    .font(.caption)
                
                HStack{
                    
                    Image(systemName: "clock.fill")
                        .foregroundColor(.black)
                    
                    Text("30-40min")
                        .font(.caption)
                    
                    Text("5")
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.red)
                    
                    Text("650円　Free")
                        .font(.caption)
                        .padding(.leading)
                    
                    
                    
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                
            }
            .opacity(model.offset > 200 ? 1 - Double((model.offset - 200) / 50): 1)
            
            ScrollViewReader { reader in
                ScrollView(.horizontal, showsIndicators: false){
                    
                    
                    HStack(spacing:0){
                        
                        ForEach(tabs){tab in
                            
                            Text(tab.tab)
                                .font(.caption)
                                .padding(.vertical,10)
                                .padding(.horizontal)
                                .background(Color.primary.opacity(model.selected == tab.tab ? 1 : 0))
                                .clipShape(Capsule())
                                .foregroundColor(model.selected == tab.tab ? scheme == .dark ? .black : .white : .primary)
                               
                                .id(tab.tab)
                            
                            
                            
                            
                            
                            
                        }
                        .onChange(of: model.selected, perform: { value in
                            
                            withAnimation(.easeOut){
                                
                                reader.scrollTo(model.selected,anchor:.leading)
                                
                            }
                            
                        })
                        
                        
                        
                        
                    }
                    
                    
                    
                }
                .opacity(model.offset > 200 ? Double((model.offset - 200) / 50): 0)
            }
            
            
            
            
        }
        .frame(height: 60)
        
        
        
            
         
         
            
            
            if model.offset > 250{
                
                Divider()
            }
            
            
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(scheme == .dark ? Color.black : Color.white)
    
        
        
        
    }
    
    func getsize() -> CGFloat{
        
        if model.offset > 200{
            
            let progress = (model.offset - 200) / 50
            
            if progress <= 1.0{
                
                
                return progress * 40
            }
            else{
                
                return 40
                
            }
            
            
            
        }
        else{
            return 0
        }
        
        
    }
}

