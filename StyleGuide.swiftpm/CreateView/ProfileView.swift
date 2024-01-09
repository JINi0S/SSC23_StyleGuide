//
//  ProfileView.swift
//  CreateStyleGuide
//
//  Created by Lee Jinhee on 2023/04/16.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appUserData: UserData
    
    @State var isShowImagePicker = false
    
    @State var isDefaultProfileSelected = false
    @State var isImageProfileSelected = false
    
    @State var selectedUIImage: UIImage?
    private let inputfieldmaxWidth: CGFloat = 80

    @Binding var text: String
    
    func loadImage(profile: String) {
        guard let selectedImage = selectedUIImage else { return }
        if profile == "image" {
            appUserData.styleGuide.profile.imageProfile = Image(uiImage: selectedImage)
        } else {
            appUserData.styleGuide.profile.defaultProfile = Image(uiImage: selectedImage)
        }
        
    }
    
    var body: some View {
        HStack {
            VStack {
                Text("Default Profile")
                    .font(.system(size: 18, weight: .semibold))
                    .onAppear {
                        text = "You can help everyone feel welcome in your app by avoiding unnecessary references to specific genders.\nWhen it’s necessary to depict a generic person or people, use a nongendered human image \nto reinforce the message that generic person means human, not man or woman."
                    }
                VStack {
                    if let image = appUserData.styleGuide.profile.defaultProfile {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: CGFloat(appUserData.styleGuide.profile.width),
                                   height: CGFloat(appUserData.styleGuide.profile.height))
                            .background(Color.white)
                    } else {
                        Image(systemName: "person.fill")
                            .resizable()
                            .imageScale(.small)
                            .padding(10)

                            .frame(width: CGFloat(appUserData.styleGuide.profile.width),
                                   height: CGFloat(appUserData.styleGuide.profile.height))                            .background(Color.lightBlue)
                            .foregroundColor(.white)
                            
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: CGFloat(appUserData.styleGuide.profile.cornerRadius)))
                .padding(.bottom, 32)
                
                Text("Image Profile")
                    .font(.system(size: 18, weight: .semibold))
                
                VStack {
                    if let image = appUserData.styleGuide.profile.imageProfile {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: CGFloat(appUserData.styleGuide.profile.width),
                                   height: CGFloat(appUserData.styleGuide.profile.height))
                            .background(Color.white)
                    } else {
                        Image("imageProfile")
                            .resizable()
                            .imageScale(.medium)
                            .frame(width: CGFloat(appUserData.styleGuide.profile.width),
                                   height: CGFloat(appUserData.styleGuide.profile.height))
                            .background(Color.lightBlue)
                            .shadow(color: .gray, radius: 12)
                            .foregroundColor(.white)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: CGFloat(appUserData.styleGuide.profile.cornerRadius)))
            }
            .frame(minWidth: 400)
            
            
            Divider().padding(.horizontal)
            
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Default Profile File")
                    .font(.system(size: 18, weight: .semibold))
                
                HStack(spacing: 16) {
                    Button {
                        isDefaultProfileSelected = true
                        isImageProfileSelected = false
                        isShowImagePicker.toggle()
                    } label: {
                        Label("Photo library", systemImage: "photo.on.rectangle")
                            .foregroundColor(.black)
                            .frame(width: 180, height: 60)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(15)
                    }
//                    Button {
//                        //TODO: Draw기능 추가
//                    } label: {
//                        Label("Draw Profile", systemImage: "scribble.variable")
//                                    .foregroundColor(.black)
//                                    .frame(width: 180, height: 60)
//                                    .background(.gray.opacity(0.2))
//                                    .cornerRadius(15)
//
//                    }
                }
                Divider().padding(.vertical)
                
                Text("Image Profile File")
                    .font(.system(size: 18, weight: .semibold))

                Button {
                    isImageProfileSelected = true
                    isDefaultProfileSelected = false
                    isShowImagePicker.toggle()
                } label: {
                    Label("Photo library", systemImage: "photo.on.rectangle")
                                .foregroundColor(.black)
                                .frame(width: 180, height: 60)
                                .background(.gray.opacity(0.2))
                                .cornerRadius(15)
                }
                
                Divider().padding(.vertical)
                
                Text("Common")
                    .font(.system(size: 18, weight: .semibold))
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Width")
                        Spacer()
                        TextField("", value: $appUserData.styleGuide.profile.width, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(.roundedBorder)
                        Stepper(value: $appUserData.styleGuide.profile.width, label: {Text("")}).labelsHidden()

                    }
                    HStack {
                        Text("Height")
                        Spacer()
                        TextField("", value: $appUserData.styleGuide.profile.height, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(.roundedBorder)
                        Stepper(value: $appUserData.styleGuide.profile.height, label: {Text("")}).labelsHidden()
                        
                    }
                    HStack {
                        Text("CornerRadius")
                        Spacer()
                        TextField("", value: $appUserData.styleGuide.profile.cornerRadius, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(.roundedBorder)
                        Stepper(value: $appUserData.styleGuide.profile.cornerRadius, label: {Text("")}).labelsHidden()
                        
                    }
                }
            }
            .frame(minWidth: 400)
        }
        .padding(32)
        .sheet(isPresented: $isShowImagePicker, onDismiss: {
            if isDefaultProfileSelected {
                loadImage(profile: "default")
            } else if isImageProfileSelected {
                loadImage(profile: "image")
            }
        }) {
            ImagePicker(image: $selectedUIImage)
        }
    }
}
