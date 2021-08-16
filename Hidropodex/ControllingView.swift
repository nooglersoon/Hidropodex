//
//  ImageClassifierView.swift
//  Hidropodex
//
//  Created by Muhammad Gilang Nursyahroni on 15/08/21.
//

import SwiftUI
import UIKit
import CoreML
import Vision

struct ControllingView: View {
    
    @State private var isShowCamera = false
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @ObservedObject var parameters: ParameterObject
    @State private var disease: String = ""
    
    var body: some View {
        
        ZStack {
            
            Color("lightGreen")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                VStack(spacing: 20) {
                    
                    DiseaseCardView(diseaseResult: "Early Blight", isShowCamera: $isShowCamera)
                        .fullScreenCover(isPresented: $isShowCamera){
                            ImagePicker(disease: $disease, image: self.$inputImage, sourceType: .camera)
                                .edgesIgnoringSafeArea(.all)
                        }
                    ControllingCardView(parameter: parameters.parameters[0])
                    ControllingCardView(parameter: parameters.parameters[1])
                    ControllingCardView(parameter: parameters.parameters[2])
                    
                }
            }
            
        }
        
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}


struct ImagePicker: UIViewControllerRepresentable{
    
    @Binding var disease: String
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    class Coordinator: NSObject,UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
        var label: String = ""
        let parent: ImagePicker
        
        init( parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
                
                //convert image to CIIMage
                
                guard let ciimage = CIImage(image: uiImage)else{
                    fatalError("could not convert UIImage to CIImage")
                }
                detect(image: ciimage)
            }
        }
        
        //to detect image label
        func detect(image: CIImage){
            
            guard let model = try? VNCoreMLModel(for: Tomato_Diseases(configuration: MLModelConfiguration()).model) else{
                fatalError("load coreML model failed")
            }
            let request = VNCoreMLRequest(model: model) { (request, error) in
                guard let results = request.results as? [VNClassificationObservation] else {
                    fatalError("Model failed to process the image")
                }
                // print(results)
                
                if let firstResult = results.first {
                    //Tinggal yang ini
                    //Ini dari video kak irfan
                    //self.navigationItem.tittle = firstResult?.identifier
                    
                    
                    self.label = firstResult.description
                    
                    print("Penyakit yang Terdeteksi Adalah: \(firstResult.identifier)")
                    print("Dengan nilai confidence internval: \(firstResult.confidence)")
                    
                    //ini dari internet
                    self.parent.navigationTitle(firstResult.identifier)
                    
                    self.parent.presentationMode.wrappedValue.dismiss()
                    
                    
                    
                }
                
            }
            let handler = VNImageRequestHandler(ciImage: image)
            do {
                try handler.perform([request])
            } catch{
                print(error)
            }
            
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        
        return imagePicker
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


class PlantDetectionModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var diseaseResult: String = ""
    
}


struct ControllingCardView: View {
    
    var parameter: Parameters
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.3)
            
            VStack(alignment:.leading) {
                
                Text(parameter.namaParam)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                HStack{
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 156, height: 107, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("lightBrown"))
                        .overlay(
                            VStack(alignment: .center) {
                                
                                Text("Type of Disease")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Spacer()
                                HStack(alignment:.bottom){
                                    Text(String(parameter.realTimeValue))
                                        .font(.headline)
                                        .bold()
                                    Text(parameter.satuanParam)
                                        .font(.caption2)
                                        .bold()
                                }
                                .foregroundColor(Color("brownText"))
                                Spacer()
                                Text("Setup")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                            }
                            .frame(width: 145, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                        )
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 156, height: 107, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("lightBrown"))
                        .overlay(
                            VStack(alignment: .center) {
                                
                                Text("What To Do")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit.")
                                    .font(.caption)
                                Spacer()
                                
                                
                            }
                            .frame(width: 145, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                        )
                    
                    
                }
                
            }
            
        }
        .frame(width: UIScreen.main.bounds.width, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct DiseaseCardView: View {
    
    var diseaseResult: String
    @Binding var isShowCamera: Bool
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.3)
            
            VStack(alignment:.leading) {
                
                
                
                HStack(alignment:.center){
                    Text("Disease")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        isShowCamera = true
                    }, label: {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 160, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("darkGreen"))
                            .overlay(
                                
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                    Text("Detect Disease")
                                }
                                .foregroundColor(.white)
                                
                            )
                    })
                }
                .frame(width: 350, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                
                
                
                
                
                HStack{
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 156, height: 107, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("lightBrown"))
                        .overlay(
                            VStack(alignment: .center) {
                                
                                Text("Type of Disease")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Spacer()
                                HStack(alignment:.bottom){
                                    Text(diseaseResult)
                                        .font(.headline)
                                        .bold()
                                }
                                .foregroundColor(Color("brownText"))
                                Spacer()
                                Text("Setup")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                            }
                            .frame(width: 145, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                        )
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 156, height: 107, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("lightBrown"))
                        .overlay(
                            VStack(alignment: .center) {
                                
                                Text("What To Do")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit.")
                                    .font(.caption)
                                Spacer()
                                
                                
                            }
                            .frame(width: 145, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                        )
                    
                    
                }
                
            }
            .frame(width: 300)
            
        }
        .frame(width: UIScreen.main.bounds.width, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
