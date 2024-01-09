//
//  SelectionView.swift
//  
//
//  Created by Lee Jinhee on 2023/04/11.
//

import SwiftUI
enum ExamTitle: String, CaseIterable {
    case Title1, Title2, Title3
}
//TODO: Menu에 대한 picker도 추가
struct SelectionView : View {
    
    @EnvironmentObject var appUserData: UserData
    
    @State var someToggle : Bool = true
    @State var someSliderValue: Float = 0.5
    @State var selectedFruit : ExamTitle = .Title1
    
    private let spacing: CGFloat = 32
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Toggle").font(.system(size: 18, weight: .semibold))

                Toggle("", isOn: $someToggle)
                    .toggleStyle(SwitchToggleStyle())
                    .labelsHidden()
                    .tint(appUserData.styleGuide.toggle.color)

                Divider()
                    .padding(.vertical, spacing)

                
                Text("Slider").font(.system(size: 18, weight: .semibold))
                Slider(value: $someSliderValue)
                    .tint(appUserData.styleGuide.toggle.color)

                Divider()
                    .padding(.vertical, spacing)

                
                Text("Picker").font(.system(size: 18, weight: .semibold))
                Picker("", selection: $selectedFruit) {
                    ForEach(ExamTitle.allCases, id: \.rawValue) { title in
                        Text(title.rawValue).tag(title)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(appUserData.styleGuide.toggle.color)
                .cornerRadius(8)
            }
            
            Divider().padding(.horizontal)
            
            HStack {
                Text("Tint Color")
                //  SquareColorPickerView(, index: <#Int#>)
                ColorPicker("", selection: $appUserData.styleGuide.toggle.color)
            }.frame(minWidth: 500)
        }.padding(32)
    }
}
