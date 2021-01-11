//
//  CardView.swift
//  UI-102
//
//  Created by にゃんにゃん丸 on 2021/01/11.
//

import SwiftUI

struct CardView: View {
    
    var food : Food
    var body: some View {
        HStack{
            
            VStack(alignment: .leading, spacing: 10){
                
                Text(food.title)
                    .font(.title)
                    .fontWeight(.bold)
                 
                
                
                Text(food.description)
                    .font(.title2)
                    
                Text(food.price)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                
                
                
            }
            
            Spacer(minLength: 10)
            
            Image(food.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .cornerRadius(10)
            
            
           
        }
        .padding(.horizontal)
    }
}


