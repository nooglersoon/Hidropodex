//
//  DetailPlantView.swift
//  Hidropodex
//
//  Created by Fauzi Achmad B D on 15/08/21.
//

import SwiftUI

struct DetailPlantView: View {
    var body: some View {
        
        ZStack {
            
            Color("lightGreen")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
                    
                    Text("TOMATO")
                        .bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        
                    
                    ZStack {
                        
                        Circle()
                            .frame(width: 110, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.gray)
                        Circle()
                            .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                        
                        Image(uiImage: UIImage(named: "tomato")!)
                            .resizable()
                            .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        
                    }
                    
                    
                }
                
                Text("Age: 3 Weeks")
                    .foregroundColor(.white)
                    .padding(.vertical, 30)
                
                HStack(alignment:.top,spacing: 20) {
                    
                    VStack {
                        Circle()
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.yellow)
                        Text("Seed\nPlanting")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    VStack {
                        Circle()
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.orange)
                        Text("Germination")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    VStack {
                        Circle()
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("greenPlant"))
                        Text("Transplantion")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    VStack {
                        Circle()
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.green)
                        Text("Harvest")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    
                }
                
                HStack(spacing:20) {
                    
                    MiniCardMenu()
                    MiniCardMenu()
                    MiniCardMenu()

                    
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
                
                
                
                VStack(spacing: 20) {
                    
                    Button(action: {
                        print("")
                    }, label: {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: UIScreen.main.bounds.width-50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("yellowButton"))
                            .overlay(Text("Controlling").foregroundColor(Color("brownText")))
                        
                    })
                    
                    Button(action: {
                        print("")
                    }, label: {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: UIScreen.main.bounds.width-50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("yellowButton"))
                            .overlay(Text("Analysis").foregroundColor(Color("brownText")))
                        
                    })
                    
                }
                
            }
            .frame(height: UIScreen.main.bounds.height-150)
            
        }
    }
}

struct DetailPlantView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPlantView()
    }
}
