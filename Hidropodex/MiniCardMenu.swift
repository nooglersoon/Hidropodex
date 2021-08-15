//
//  MiniCardMenu.swift
//  Hidropodex
//
//  Created by Fauzi Achmad B D on 15/08/21.
//

import SwiftUI

struct MiniCardMenu: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                
                .foregroundColor(Color("lightBrown"))
                .overlay(
                    
                    VStack(alignment:.center, spacing: 10){
                        
                        Spacer()
                        
                        Text("Setup")
                            .font(.caption)
                            .foregroundColor(Color("brownText"))
                        Text("7.5 - 8 cm")
                            .font(.caption)
                            .foregroundColor(Color("brownText"))
                            .padding(.bottom,15)
                        
                    }
                    
                )
            
            VStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 80, height: 84, alignment: .center)
                    .foregroundColor(Color("brownText"))
                    .overlay(
                        
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                            
                            Image(uiImage: UIImage(named: "tomato")!)
                                .resizable()
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Text("Water")
                                .bold()
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                            
                            Text("77 cm")
                                .bold()
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }
                        
                    )
                
                Spacer()
                
            }
            
            
        }
        .frame(width: 80, height: 150, alignment: .center)
    }
}


struct MiniCardMenu_Previews: PreviewProvider {
    static var previews: some View {
        MiniCardMenu()
    }
}
