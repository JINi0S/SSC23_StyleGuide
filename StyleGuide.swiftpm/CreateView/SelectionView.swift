//
//  SelectionView.swift
//  
//
//  Created by Lee Jinhee on 2023/04/11.
//

import SwiftUI
enum Fruit: String, CaseIterable {
    case Title1, Title2, Title3
}
//TODO: Menu에 대한 picker도 추가
struct SelectionView : View {
    
    @EnvironmentObject var appUserData: UserData
    
    @State var someToggle : Bool = true
    @State var someSliderValue: Float = 0.5
    @State var selectedFruit : Fruit = .Title1
    
    private let spacing: CGFloat = 32
    @Binding var text: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Toggle").font(.system(size: 18, weight: .semibold))
                    .onAppear {
                        text = "Toggle\nUse the switch toggle style only in a list row.\nChange the default color of a switch only if necessary.\nBe sure to use a color that provides enough contrast with the uncolored appearance to be perceptible.\n\nSlider\nUse familiar slider directions.\nConsider supplementing a slider with a corresponding text field and stepper. "
                    }

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
                    ForEach(Fruit.allCases, id: \.rawValue) { fruit in
                        Text(fruit.rawValue).tag(fruit)
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
