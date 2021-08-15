//
//  ContentView.swift
//  Hidropodex
//
//  Created by Fauzi Achmad B D on 13/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            GeometryReader { geo in
                
                VStack(spacing:0) {
                    
                    Rectangle()
                        .frame(width: geo.size.width, height: 192, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("darkGreen"))
                        .overlay(
                        
                            VStack {
                                
                                HStack{
                                    
                                    Text("Hello, Allina!")
                                        .bold()
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        print("Tapped")
                                    }, label: {
                                        Image(systemName: "person.circle")
                                            .resizable()
                                            .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(.white)
                                    })
                                    
                                }
                                .padding()
                                .padding(.top,20)
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        
                                        Text("Welcome to your")
                                            .foregroundColor(.white)
                                        
                                        Text("HYDRO GARDEN")
                                            .bold()
                                            .font(.title2)
                                            .foregroundColor(.white)
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        print("Learn Tapped")
                                    }, label: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 90, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(Color("yellowButton"))
                                            .overlay(Text("Learn").bold().foregroundColor(Color("brownText")))
                                        
                                    })
                                    
                                }
                                .padding(.horizontal,20)
                                
                            }
                            
                        )
                    
                    Rectangle()
                        .frame(width: geo.size.width, height: geo.size.height-192, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("lightGreen"))
                        .overlay(
                        
                            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                                
                                NavigationLink(destination:DetailPlantView()) {
                                    
                                    CardMenuView()
                                    
                                }

                            }
                        )
                    
                }
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .navigationBarTitle("Home")
            .navigationBarHidden(true)
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
