import SwiftUI
import UIKit

struct camerascanid: View {
    @State private var image: UIImage?
    @State private var isImagePickerPresented = false
    @State private var isCamera = false
    
    var body: some View {
        ZStack {
            // Lighter gradient background
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.8)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all) // Extend gradient to the edges of the screen
            
            VStack {
                
                Text("Take a picture of the event!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 300, height: 300)
                        .overlay(Text("No Image Selected").foregroundColor(.white))
                }
                
                HStack {
                    Button(action: {
                        isCamera = true
                        isImagePickerPresented = true
                    }) {
                        Text("Take Photo")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    Button(action: {
                        isCamera = false
                        isImagePickerPresented = true
                    }) {
                        Text("Choose Photo")
                            .font(.headline)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(image: $image, sourceType: isCamera ? .camera : .photoLibrary)
            }
        }
    }
    
    struct ImagePicker: UIViewControllerRepresentable {
        class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
            let parent: ImagePicker
            
            init(parent: ImagePicker) {
                self.parent = parent
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let uiImage = info[.originalImage] as? UIImage {
                    parent.image = uiImage
                }
                parent.presentationMode.wrappedValue.dismiss()
            }
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                parent.presentationMode.wrappedValue.dismiss()
            }
        }
        
        @Environment(\.presentationMode) var presentationMode
        @Binding var image: UIImage?
        var sourceType: UIImagePickerController.SourceType
        
        func makeCoordinator() -> Coordinator {
            Coordinator(parent: self)
        }
        
        func makeUIViewController(context: Context) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.delegate = context.coordinator
            picker.sourceType = sourceType
            return picker
        }
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    }
    
}

#Preview {
    camerascanid()
}
