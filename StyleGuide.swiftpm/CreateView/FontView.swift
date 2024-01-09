//
//  FontView.swift
//
//
//  Created by Lee Jinhee on 2023/04/15.
//

import SwiftUI

struct FontView: View {
    @EnvironmentObject var appUserData: UserData
    
    var body: some View {
        ScrollView {
            Group {
                FontSettingView(title: "Header1", size: $appUserData.styleGuide.typo.header1.size, weight: $appUserData.styleGuide.typo.header1.weight)
                
                FontSettingView(title: "Header2", size: $appUserData.styleGuide.typo.header2.size, weight: $appUserData.styleGuide.typo.header2.weight)
                
                FontSettingView(title: "Subtitle1", size: $appUserData.styleGuide.typo.subtitle1.size, weight: $appUserData.styleGuide.typo.subtitle1.weight)
                
                FontSettingView(title: "Subtitle2", size: $appUserData.styleGuide.typo.subtitle2.size, weight: $appUserData.styleGuide.typo.subtitle2.weight)
                
                FontSettingView(title: "Subtitle3", size: $appUserData.styleGuide.typo.subtitle3.size, weight: $appUserData.styleGuide.typo.subtitle3.weight)
                
                FontSettingView(title: "Body1", size: $appUserData.styleGuide.typo.body1.size, weight: $appUserData.styleGuide.typo.body1.weight)
                
                FontSettingView(title: "Body2", size: $appUserData.styleGuide.typo.body2.size, weight: $appUserData.styleGuide.typo.body2.weight)
                
                FontSettingView(title: "Caption1", size: $appUserData.styleGuide.typo.caption1.size, weight: $appUserData.styleGuide.typo.caption1.weight)
                
                FontSettingView(title: "Caption2", size: $appUserData.styleGuide.typo.caption2.size, weight: $appUserData.styleGuide.typo.caption2.weight)
            }
            .listRowSeparator(.hidden)
            .padding(.top, 6)
        }
        .padding()
    }
}

struct FontSettingView: View {
    let title: String
    @Binding var size: Int
    @Binding var weight: Font.Weight
    private let inputfieldmaxWidth: CGFloat = 80
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: CGFloat(size), weight: weight))
                .frame(minWidth: 180)
                .frame(maxWidth: .infinity)
            
            HStack {
                TextField("", value: $size, formatter: NumberFormatter())
                    .frame(width: inputfieldmaxWidth)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Stepper(value: $size, label: {Text("")}).labelsHidden()
                Spacer()
                Picker(selection: $weight, label: Text("")) {
                    FontPickerView()
                }
                .labelsHidden()
            }
            .frame(width: 350)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 60)
    }
}

struct FontPickerView: View {
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
