//
//  CardMenuView.swift
//  Hidropodex
//
//  Created by Fauzi Achmad B D on 15/08/21.
//

import SwiftUI

struct CardMenuView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                
                .foregroundColor(Color("lightBrown"))
                .overlay(
                    
                    VStack(alignment:.leading, spacing: 10){
                        
                        Spacer()
                        
                        Text("😊 Health Status")
                            .font(.caption)
                            .foregroundColor(Color("brownText"))
                        Text("📍Find Me at Kitchen")
                            .font(.caption)
                            .foregroundColor(Color("brownText"))
                            .padding(.bottom,15)
                        
                    }
                    
                )
            
            VStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 164, height: 150, alignment: .center)
                    .foregroundColor(Color("brownText"))
                    .overlay(
                        
                        VStack{
                            
                            Text("TOMATO")
                                .bold()
                                .foregroundColor(.white)
                            ZStack {
                                
                                Circle()
                                    .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.gray)
                                Circle()
                                    .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                                
                                Image(uiImage: UIImage(named: "tomato")!)
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                
                            }
                            
                            
                        }
                        
                    )
                
                Spacer()

            }
            
            
        }
        .frame(width: 164, height: 224, alignment: .center)
        .padding()
    }
}

struct CardMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CardMenuView()
    }
}
