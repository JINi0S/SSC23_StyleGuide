//
//  LogoView.swift
//  CreateStyleGuide
//
//  Created by Lee Jinhee on 2023/04/10.
//

import SwiftUI

struct LogoView: View {
    @EnvironmentObject var appUserData: UserData
    
    @State var isShowImagePicker = false
    @State var selectedUIImage: UIImage?
    
    var body: some View {
        HStack(spacing: 32) {
            VStack {
                if let image = appUserData.styleGuide.logo.logoImage {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .background(Color.white)
                } else {
                    Image(systemName: "plus.square.on.square")
                        .resizable()
                        .imageScale(.medium)
                        .padding(80)
                        .frame(width: 300, height: 300)
                        .background(Color.lightBlue)
                        .foregroundColor(.white)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .frame(width: 300, height: 300)
          
            VStack(alignment: .leading, spacing: 12) {
                Text("Icon File")
                    .font(.system(size: 18, weight: .semibold))
                HStack(spacing: 16) {
                    Button {
                        isShowImagePicker.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "photo.on.rectangle")
                            Text("Photo library")
                        }
                        .foregroundColor(.black)
                        .frame(width: 180, height: 60)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(15)
                    }
                                        
                    NavigationLink(destination: {
                        DrawView()
                    }, label: {
                        HStack {
                            Image(systemName: "scribble.variable")
                            Text("Draw")
                        }
                        .foregroundColor(.black)
                        .frame(width: 180, height: 60)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(15)
                    })
                }
            }
        }
        .padding(32)
        .sheet(isPresented: $isShowImagePicker, onDismiss: {
            loadImage()
        }) {
            ImagePicker(image: $selectedUIImage)
        }
    }
    
    private func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        appUserData.styleGuide.logo.logoImage = Image(uiImage: selectedImage)
    }
}
