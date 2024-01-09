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
    @Binding var text: String
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack {
                    Text("Dot Notification")
                        .font(.system(size: 18, weight: .semibold))
                    HStack(spacing: 32) {
                        Capsule()
                            .frame(width: CGFloat(appUserData.styleGuide.noti.dot.width),
                                   height: CGFloat(appUserData.styleGuide.noti.dot.height))
                            .foregroundColor(appUserData.styleGuide.noti.backgroundColor[0])
                        Capsule()
                            .frame(width: CGFloat(appUserData.styleGuide.noti.dot.width),
                                   height: CGFloat(appUserData.styleGuide.noti.dot.height))
                            .foregroundColor(appUserData.styleGuide.noti.backgroundColor[1])
                    }
                }
                .frame(minWidth: 550)
                .onAppear {
                    text = "Used to indicate information that the user must be aware of.\nIt is mainly used with Icon and refers to information\nabout alarms or conditions depending on the situation."
                }
                
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
                        Capsule()
                            .frame(width: CGFloat(appUserData.styleGuide.noti.number.width), height: CGFloat(appUserData.styleGuide.noti.number.height))
                            .foregroundColor(appUserData.styleGuide.noti.backgroundColor[0])
                            .overlay(
                                Text("10")
                                    .font(.system(size: CGFloat(appUserData.styleGuide.noti.number.textSize), weight: appUserData.styleGuide.noti.number.textWeight))
                                    .foregroundColor(appUserData.styleGuide.noti.number.textColor)
                            )
                        Capsule()
                            .frame(width: CGFloat(appUserData.styleGuide.noti.number.width), height: CGFloat(appUserData.styleGuide.noti.number.height))
                            .foregroundColor(appUserData.styleGuide.noti.backgroundColor[1])
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
                            PickerFontView()
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
            //.frame(maxHeight: 250)
        }.padding(32)
    }
}
