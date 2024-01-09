//
//  File.swift
//  
//
//  Created by Lee Jinhee on 2023/04/10.
//

import SwiftUI

struct ButtonView: View {
    
    @EnvironmentObject var appUserData: UserData
    
    @State var buttonIndex: Int = 0
    
    private let inputfieldmaxWidth: CGFloat = 80
    @Binding var text: String

    var body: some View {
        HStack {
            VStack(spacing: 32) {
                
                Button {
                    buttonIndex = 0
                } label: {
                    Text(appUserData.styleGuide.button[0].textString)
                        .lineLimit(0)
                        .frame(width: CGFloat(appUserData.styleGuide.button[0].width),
                               height: CGFloat(appUserData.styleGuide.button[0].height))
                        .foregroundColor(appUserData.styleGuide.button[0].textColor)
                        .font(.system(size: CGFloat(appUserData.styleGuide.button[0].textSize),
                                      weight: appUserData.styleGuide.button[0].textWeight))
                        .overlay(
                            RoundedRectangle(cornerRadius: CGFloat(appUserData.styleGuide.button[0].cornerRadius))
                                .stroke(appUserData.styleGuide.button[0].borderColor,
                                        lineWidth: CGFloat(appUserData.styleGuide.button[0].borderWidth)))
                }
                .background(appUserData.styleGuide.button[0].backgroundColor)
                .cornerRadius(CGFloat(appUserData.styleGuide.button[0].cornerRadius))
                .padding()
                .background(buttonIndex == 0 ? .gray.opacity(0.1) : .white)
                .onAppear {
                    
                    text = "Make buttons easy for people to choose.\nButtons need a hit target of at least 44x44 points to accommodate a fingertip.\nEnsure that each button clearly communicates it purpose.\nUse a filled button for the most likely action in a view.\nUse style (not size) to visually distinguish the preferred choice among multiple options. "
                }
                
                Button {
                    buttonIndex = 1
                } label: {
                    Text(appUserData.styleGuide.button[1].textString)
                        .lineLimit(0)
                        .frame(width: CGFloat(appUserData.styleGuide.button[1].width),
                               height: CGFloat(appUserData.styleGuide.button[1].height))
                        .foregroundColor(appUserData.styleGuide.button[1].textColor)
                        .font(.system(size: CGFloat(appUserData.styleGuide.button[1].textSize),
                                      weight: appUserData.styleGuide.button[1].textWeight))
                        .overlay(
                            RoundedRectangle(cornerRadius: CGFloat(appUserData.styleGuide.button[1].cornerRadius))
                                .stroke(appUserData.styleGuide.button[1].borderColor,
                                        lineWidth: CGFloat(appUserData.styleGuide.button[1].borderWidth)))
                }
                .background(appUserData.styleGuide.button[1].backgroundColor)
                .cornerRadius(CGFloat(appUserData.styleGuide.button[1].cornerRadius))
                .padding()
                .background(buttonIndex == 1 ? .gray.opacity(0.1) : .white)
                
                
                Button {
                    buttonIndex = 2
                } label: {
                    Text(appUserData.styleGuide.button[2].textString)
                        .lineLimit(0)
                        .frame(width: CGFloat(appUserData.styleGuide.button[2].width),
                               height: CGFloat(appUserData.styleGuide.button[2].height))
                        .foregroundColor(appUserData.styleGuide.button[2].textColor)
                        .font(.system(size: CGFloat(appUserData.styleGuide.button[2].textSize),
                                      weight: appUserData.styleGuide.button[2].textWeight))
                        .overlay(
                            RoundedRectangle(cornerRadius: CGFloat(appUserData.styleGuide.button[2].cornerRadius))
                                .stroke(appUserData.styleGuide.button[2].borderColor,
                                        lineWidth: CGFloat(appUserData.styleGuide.button[2].borderWidth)))
                }
                .background(appUserData.styleGuide.button[2].backgroundColor)
                .cornerRadius(CGFloat(appUserData.styleGuide.button[2].cornerRadius))
                .padding()
                .background(buttonIndex == 2 ? .gray.opacity(0.1) : .white)
            }.frame(minWidth: 400)
            
            Divider().padding(.horizontal)
            
            VStack {
                Group {
                    HStack {
                        Text("Width")
                        Spacer()
                        TextField("", value: $appUserData.styleGuide.button[buttonIndex].width, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(.roundedBorder)
                        Stepper(value: $appUserData.styleGuide.button[buttonIndex].width, label: {Text("")}).labelsHidden()
                    }
                    HStack {
                        Text("Height")
                        Spacer()
                        TextField("", value: $appUserData.styleGuide.button[buttonIndex].height, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(.roundedBorder)
                        Stepper(value: $appUserData.styleGuide.button[buttonIndex].height, label: {Text("")}).labelsHidden()
                    }
                    HStack {
                        Text("Corner Radius")
                        Spacer()
                        TextField("", value: $appUserData.styleGuide.button[buttonIndex].cornerRadius, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(.roundedBorder)
                        Stepper(value: $appUserData.styleGuide.button[buttonIndex].cornerRadius, label: {Text("")}).labelsHidden()
                    }
                }
                Group {
                    HStack {
                        Text("Border Width")
                        Spacer()
                        TextField("", value: $appUserData.styleGuide.button[buttonIndex].borderWidth, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(.roundedBorder)
                        Stepper(value: $appUserData.styleGuide.button[buttonIndex].borderWidth, label: {Text("")}).labelsHidden()
                        
                    }
                    
                    HStack {
                        Text("Border Color")
                        ColorPicker("", selection: $appUserData.styleGuide.button[buttonIndex].borderColor)
                    }
                    HStack{
                        Text("Background Color")
                        ColorPicker("", selection: $appUserData.styleGuide.button[buttonIndex].backgroundColor)
                    }
                }
                Group {
                    HStack {
                        Text("Text Color")
                        ColorPicker("", selection: $appUserData.styleGuide.button[buttonIndex].textColor)
                    }
                    HStack {
                        Text("Text String")
                        Spacer()
                        TextField("", text: $appUserData.styleGuide.button[buttonIndex].textString)
                            .frame(maxWidth: inputfieldmaxWidth * 2)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .lineLimit(/*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    }
                }
                Group {
                    HStack {
                        Text("Font Weight")
                        Spacer()
                        Picker(selection: $appUserData.styleGuide.button[buttonIndex].textWeight, label: Text("")) {
                            PickerFontView()
                        }
                    }
                    HStack {
                        Text("Text Size")
                        Spacer()
                        TextField("", value: $appUserData.styleGuide.button[buttonIndex].textSize, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(.roundedBorder)
                        Stepper(value: $appUserData.styleGuide.button[buttonIndex].textSize, label: {Text("")}).labelsHidden()
                    }
                }
                
            }.frame(maxWidth: 400)
        }.padding(32)
    }
}

