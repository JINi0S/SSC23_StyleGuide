//
//  FontView.swift
//  
//
//  Created by Lee Jinhee on 2023/04/15.
//

import SwiftUI

struct FontView: View {
    @EnvironmentObject var appUserData: UserData
    private let inputfieldmaxWidth: CGFloat = 80
    @Binding var text: String
    var body: some View {
        HStack(alignment: .center) {
            List{
                Group {
                    HStack {
                        Text("Header1")
                            .font(.system(size: CGFloat(appUserData.styleGuide.typo.header1.size),
                                          weight: appUserData.styleGuide.typo.header1.weight))
                            .frame(maxWidth: 480, maxHeight: 80)
                        TextField("", value: $appUserData.styleGuide.typo.header1.size, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.typo.header1.size, label: {Text("")}).labelsHidden()
                        
                        Picker(selection: $appUserData.styleGuide.typo.header1.weight, label: Text("")) {
                            PickerFontView()
                        }
                        .labelsHidden()
                        .onAppear {
                            text = "Strive to maintain a minimum font size that most people can read easily.\nMinimize the number of typefaces you use in your interface.\nIn general, avoid light font weights to help maintain readability.\nPrioritize important content when responding to text-size changes."
                        }
                    }
                    
                    HStack {
                        Text("Header2")
                            .font(.system(size: CGFloat(appUserData.styleGuide.typo.header2.size),
                                          weight: appUserData.styleGuide.typo.header2.weight))
                            .frame(maxWidth: 480, maxHeight: 80)
                        
                        TextField("", value: $appUserData.styleGuide.typo.header2.size, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.typo.header2.size, label: {Text("")}).labelsHidden()
                        
                        Picker(selection: $appUserData.styleGuide.typo.header2.weight, label: Text("")) {
                            PickerFontView()
                        }
                        .labelsHidden()
                    }
                    
                    HStack {
                        Text("Subtitle1")
                            .font(.system(size: CGFloat(appUserData.styleGuide.typo.subtitle1.size),
                                          weight: appUserData.styleGuide.typo.subtitle1.weight))
                            .frame(maxWidth: 480, maxHeight: 80)
                        
                        TextField("", value: $appUserData.styleGuide.typo.subtitle1.size, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.typo.subtitle1.size, label: {Text("")}).labelsHidden()
                        
                        Picker(selection: $appUserData.styleGuide.typo.subtitle1.weight, label: Text("")) {
                            PickerFontView()
                        }
                        .labelsHidden()
                    }
                    
                    HStack {
                        Text("Subtitle2")
                            .font(.system(size: CGFloat(appUserData.styleGuide.typo.subtitle2.size),
                                          weight: appUserData.styleGuide.typo.subtitle2.weight))
                            .frame(maxWidth: 480, maxHeight: 80)
                        
                        TextField("", value: $appUserData.styleGuide.typo.subtitle2.size, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.typo.subtitle2.size, label: {Text("")}).labelsHidden()
                        
                        Picker(selection: $appUserData.styleGuide.typo.subtitle2.weight, label: Text("")) {
                            PickerFontView()
                        }
                        .labelsHidden()
                    }
                    
                    HStack {
                        Text("Subtitle3")
                            .font(.system(size: CGFloat(appUserData.styleGuide.typo.subtitle3.size),
                                          weight: appUserData.styleGuide.typo.subtitle3.weight))
                            .frame(maxWidth: 480, maxHeight: 80)
                        
                        TextField("", value: $appUserData.styleGuide.typo.subtitle3.size, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.typo.subtitle3.size, label: {Text("")}).labelsHidden()
                        
                        Picker(selection: $appUserData.styleGuide.typo.subtitle3.weight, label: Text("")) {
                            PickerFontView()
                        }
                        .labelsHidden()
                    }
                    
                    HStack {
                        Text("Body1")
                            .font(.system(size: CGFloat(appUserData.styleGuide.typo.body1.size),
                                          weight: appUserData.styleGuide.typo.body1.weight))
                            .frame(maxWidth: 480, maxHeight: 80)
                        
                        TextField("", value: $appUserData.styleGuide.typo.body1.size, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.typo.body1.size, label: {Text("")}).labelsHidden()
                        
                        Picker(selection: $appUserData.styleGuide.typo.body1.weight, label: Text("")) {
                            PickerFontView()
                        }
                        .labelsHidden()
                    }
                    
                    HStack {
                        Text("Body2")
                            .font(.system(size: CGFloat(appUserData.styleGuide.typo.body2.size),
                                          weight: appUserData.styleGuide.typo.body2.weight))
                            .frame(maxWidth: 480, maxHeight: 80)
                        
                        TextField("", value: $appUserData.styleGuide.typo.body2.size, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.typo.body2.size, label: {Text("")}).labelsHidden()
                        
                        Picker(selection: $appUserData.styleGuide.typo.body2.weight, label: Text("")) {
                            PickerFontView()
                        }
                        .labelsHidden()
                    }
                    
                    HStack {
                        Text("Caption1")
                            .font(.system(size: CGFloat(appUserData.styleGuide.typo.caption1.size),
                                          weight: appUserData.styleGuide.typo.caption1.weight))
                            .frame(maxWidth: 480, maxHeight: 80)
                        
                        TextField("", value: $appUserData.styleGuide.typo.caption1.size, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.typo.caption1.size, label: {Text("")}).labelsHidden()
                        
                        Picker(selection: $appUserData.styleGuide.typo.caption1.weight, label: Text("")) {
                            PickerFontView()
                        }
                        .labelsHidden()
                    }
                    
                    HStack {
                        Text("Caption2")
                            .font(.system(size: CGFloat(appUserData.styleGuide.typo.caption2.size),
                                          weight: appUserData.styleGuide.typo.caption2.weight))
                            .frame(maxWidth: 480, maxHeight: 80)
                        
                        TextField("", value: $appUserData.styleGuide.typo.caption2.size, formatter: NumberFormatter())
                            .frame(maxWidth: inputfieldmaxWidth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Stepper(value: $appUserData.styleGuide.typo.caption2.size, label: {Text("")}).labelsHidden()
                        
                        Picker(selection: $appUserData.styleGuide.typo.caption2.weight, label: Text("")) {
                            PickerFontView()
                        }
                        .labelsHidden()
                    }
                    
                }
                .listRowSeparator(.hidden)
                .padding(.top, 6)
            }
            .listStyle(PlainListStyle())
            .padding()
            
        }
    }
}

struct PickerFontView: View {
    var body: some View {
        Group {
            Text("Ultra Light").tag(Font.Weight.ultraLight)
            Text("Thin").tag(Font.Weight.thin)
            Text("Light").tag(Font.Weight.light)
            Text("Regular").tag(Font.Weight.regular)
            Text("Medium").tag(Font.Weight.medium)
            Text("Semibold").tag(Font.Weight.semibold)
            Text("Bold").tag(Font.Weight.bold)
            Text("Heavy").tag(Font.Weight.heavy)
            Text("Black").tag(Font.Weight.black)
        }
    }
}
