//
//  ImagePickerView.swift
//  ViewElementsDemo
//
//  Created by Infinity Tech on 13/1/22.
//

import SwiftUI

struct ImagePickerView: View {
    
    @State var changeImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            Button(action: {
                changeImage = true
                openCameraRoll = true
            }, label: {
                if changeImage {
                    Image(uiImage: imageSelected)
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                        .clipShape(Circle())
                }else {
                    Image("user_default_icon")
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                        .clipShape(Circle())
                }
            })
            
            Image(systemName: "camera")
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .background(.gray)
                .clipShape(Circle())
        }.sheet(isPresented: $openCameraRoll) {
            ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}



struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
           var parent: ImagePicker
        
           init(_ parent: ImagePicker) {
               self.parent = parent
           }
           
       
           func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
               if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                   parent.selectedImage = image
               }
        
               parent.presentationMode.wrappedValue.dismiss()
           }
       }
       
       func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }
}
