//
//  NotiView.swift
//  
//
//  Created by Lee Jinhee on 2023/04/14.
//

import SwiftUI


struct NotiView: View {
    @EnvironmentObject var appUserData: UserData
    private let inputfieldmaxWidth: CGFloat = 80
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack {
                    Text("Dot Notification")
                        .font(.system(size: 18, weight: .semibold))
                    HStack(spacing: 32) {
                        notiCapsule(width: appUserData.styleGuide.noti.dot.width, height: appUserData.styleGuide.noti.dot.height, color: appUserData.styleGuide.noti.backgroundColor[0])
                       
                        notiCapsule(width: appUserData.styleGuide.noti.dot.width, height: appUserData.styleGuide.noti.dot.height, color: appUserData.styleGuide.noti.backgroundColor[1])
                    }
                }
                .frame(minWidth: 550)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Dot Notification")
                        .font(.system(size: 18, weight: .semibold))
                    HStack {
                        Text("Width")
                        Spacer()
                        TextField("", value: $appUserData.styleGuide.noti.dot.width, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.noti.dot.width, label: {Text("")}).labelsHidden()
                    }
                    
                    HStack {
                        Text("Height")
                        Spacer()
                        TextField("", value: $appUserData.styleGuide.noti.dot.height, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.noti.dot.height, label: {Text("")}).labelsHidden()
                    }
                }
            }
            .frame(maxHeight: 150)
            
            HStack(alignment: .top) {
                VStack {
                    Text("Number Notification")
                        .font(.system(size: 18, weight: .semibold))
                    HStack(spacing: 32) {
                        notiCapsule(width: appUserData.styleGuide.noti.number.width, height: appUserData.styleGuide.noti.number.height, color: appUserData.styleGuide.noti.backgroundColor[0])
                            .overlay(
                                Text("10")
                                    .font(.system(size: CGFloat(appUserData.styleGuide.noti.number.textSize), weight: appUserData.styleGuide.noti.number.textWeight))
                                    .foregroundColor(appUserData.styleGuide.noti.number.textColor)
                            )
                        notiCapsule(width: appUserData.styleGuide.noti.number.width, height: appUserData.styleGuide.noti.number.height, color: appUserData.styleGuide.noti.backgroundColor[1])
                            .overlay(
                                Text("10")
                                    .font(.system(size: CGFloat(appUserData.styleGuide.noti.number.textSize), weight: appUserData.styleGuide.noti.number.textWeight))
                                    .foregroundColor(appUserData.styleGuide.noti.number.textColor)
                            )
                    }
                }
                .frame(minWidth: 550)
                
                Divider()

                VStack(alignment: .leading) {
                    Text("Number Notification")
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        Text("Width")
                        Spacer()
                        TextField("", value: $appUserData.styleGuide.noti.number.width, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.noti.number.width, label: {Text("")}).labelsHidden()
                    }
                    
                    HStack {
                        Text("Height")
                        Spacer()
                        TextField("", value: $appUserData.styleGuide.noti.number.height, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.noti.number.height, label: {Text("")}).labelsHidden()
                    }
                    
                    HStack {
                        Text("Text Color")
                        Spacer()

                        ColorPicker("", selection: $appUserData.styleGuide.noti.number.textColor).labelsHidden()
                    }

                    HStack {
                        Text("Text Weight")
                        Spacer()
                        Picker(selection: $appUserData.styleGuide.noti.number.textWeight, label: Text("")) {
                            FontPickerView()
                        }
                    }

                    HStack {
                        Text("Text Size")
                        Spacer()
                        HStack {
                            TextField("", value: $appUserData.styleGuide.noti.number.textSize, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(maxWidth: inputfieldmaxWidth)
                            
                            Stepper(value: $appUserData.styleGuide.noti.number.textSize, in: 0...30, label: {Text("")}).labelsHidden()
                        }
                    }
                    
                    Text("Common")
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.top, 30)
                    HStack {
                        Text("BackgroundColor")
                        Spacer()
                        ColorPicker("", selection: $appUserData.styleGuide.noti.backgroundColor[0]).labelsHidden()
                        ColorPicker("", selection: $appUserData.styleGuide.noti.backgroundColor[1]).labelsHidden()
                    }
                }
            }
        }.padding(32)
    }
    
    private func notiCapsule(width: Int, height: Int, color: Color) -> some View {
        Capsule()
            .frame(width: CGFloat(width), height: CGFloat(height))
            .foregroundColor(color)
    }
}
