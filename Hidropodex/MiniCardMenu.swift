//
//  MiniCardMenu.swift
//  Hidropodex
//
//  Created by Fauzi Achmad B D on 15/08/21.
//

import SwiftUI

struct MiniCardMenu: View {
    
    var parameter: Parameters
    
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
                        Text(parameter.rangeSetup)
                            .font(.caption)
                            .foregroundColor(Color("brownText"))
                            .padding(.bottom,15)
                        
                    }
                    
                )
            
            VStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 84, alignment: .center)
                    .foregroundColor(Color("brownText"))
                    .overlay(
                        
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                            
                            Image(systemName: parameter.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(parameter.colorParam)
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Text(parameter.namaParam)
                                .bold()
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                            
                            Text(String(format: "%.1f", parameter.realTimeValue)+" \(parameter.satuanParam)")
                                .bold()
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                        }
                        
                    )
                
                Spacer()
                
            }
            
            
        }
        .frame(width: 100, height: 150, alignment: .center)
    }
}



struct MiniCardMenu_Previews: PreviewProvider {
    static var previews: some View {
        MiniCardMenu(parameter: Parameters(namaParam: "Water", realTimeValue: 77, rangeSetup: "7.5 - 8 cm", satuanParam: "cm", colorParam: .blue, image: "drop.fill"))
    }
}
