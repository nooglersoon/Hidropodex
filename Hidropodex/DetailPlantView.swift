//
//  DetailPlantView.swift
//  Hidropodex
//
//  Created by Fauzi Achmad B D on 15/08/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct DetailPlantView: View {
    
    
    @StateObject var parameters = ParameterObject()
    @StateObject var plantDisease = PlantDetectionModel()
    
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
                    
                    MiniCardMenu(parameter: parameters.parameters[0])
                    MiniCardMenu(parameter: parameters.parameters[1])
                    MiniCardMenu(parameter: parameters.parameters[2])
                    
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
                
                
                
                VStack(spacing: 20) {
                    
                    NavigationLink( destination: ControllingView(parameters: parameters)){
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: UIScreen.main.bounds.width-50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("yellowButton"))
                            .overlay(Text("Controlling").foregroundColor(Color("brownText")))
                    }
                    
                    NavigationLink( destination: EmptyView()){
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: UIScreen.main.bounds.width-50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("yellowButton"))
                            .overlay(Text("Analysis").foregroundColor(Color("brownText")))
                    }
                    .disabled(true)
                    .opacity(0.4)
                    
                }
                
            }
            .frame(height: UIScreen.main.bounds.height-150)
            
        }
        .onAppear{
            
            let headers: HTTPHeaders = [
                "X-M2m-Origin": "6cd5e5cc78bbed06:faefeda74389bcb0",
                "Content-Type": "application/json",
                "Accept" : "application/json"
            ]
            
            AF.request("https://platform.antares.id:8443/~/antares-cse/antares-id/smart-plant/sensor/la", headers: headers).responseJSON { response in
                //Parse or print your response.
                
                switch response.result {
                case .success(let value):
                    
                    print("succes!")
                    
                    let antaresJSON: JSON = JSON(value)
                    let data = antaresJSON["m2m:cin"]["con"].stringValue.replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: "")
                    
                    let array = data.components(separatedBy: ",")
                    let temp = makeFloat(array[0])
                    let humidity = makeFloat(array[1])
                    let flowRate = makeFloat(array[2])
                    
                    parameters.parameters[0].realTimeValue = flowRate
                    parameters.parameters[1].realTimeValue = temp
                    parameters.parameters[2].realTimeValue = humidity
                    
                    
                    
                case .failure(let error):
                    print(error)
                    print(response.response?.statusCode)
                }
                
                
            }
        }
    }
    
    func makeFloat(_ str: String) -> Float {
        
        let weightt = str.components(separatedBy: CharacterSet.init(charactersIn: "0123456789.").inverted).joined(separator: "")
        
        return Float(weightt) ?? 0
        
    }
}

struct DetailPlantView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPlantView()
    }
}

class ParameterObject: ObservableObject {
    
    @Published var parameters = [
        
        Parameters(namaParam: "Water Flowrate", realTimeValue: 0, rangeSetup: "7.5 - 8", satuanParam: "L/min", colorParam: .blue, image: "drop.fill"),
        Parameters(namaParam: "Temp", realTimeValue: 0, rangeSetup: "24 - 28", satuanParam: "°C", colorParam: .yellow, image: "thermometer"),
        Parameters(namaParam: "Humidity", realTimeValue: 0, rangeSetup: "1", satuanParam: "%", colorParam: .green, image: "cloud.sun.fill")
        
    ]
    
}
