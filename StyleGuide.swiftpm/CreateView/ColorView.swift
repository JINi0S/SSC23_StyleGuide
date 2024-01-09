//
//  ColorView.swift
//  
//
//  Created by Lee Jinhee on 2023/04/10.
//

import SwiftUI

struct ColorView: View {
    @EnvironmentObject var appUserData: UserData
    @Binding var text: String
    var body: some View {
        VStack {
//            Text("Touch the color box to modify the color.")
//                .font(.system(size: 16, weight: .semibold))
//                .padding(.bottom, 32).foregroundColor(.darkBlue)
            VStack(alignment: .leading) {
                Text("Main color")
                    .font(.system(size: 18, weight: .semibold))
                HStack(spacing: 16) {
                    ForEach(appUserData.styleGuide.color.main.indices) { index in
                        SquareColorPickerView(index: index, title: "main", size: 12)
                    }}
                .padding(.bottom, 32)
                
                Text("Sub color")
                    .font(.system(size: 18, weight: .semibold))
                HStack(spacing: 16) {
                    ForEach(appUserData.styleGuide.color.sub.indices) { index in
                        SquareColorPickerView(index: index, title: "sub", size: 12)
                    }}
                .padding(.bottom, 32)
                
                Text("Gray Color")
                    .font(.system(size: 18, weight: .semibold))
                HStack(spacing: 16) {
                    ForEach(appUserData.styleGuide.color.gray.indices) { index in
                        SquareColorPickerView(index: index, title: "gray", size: 12)
                    }
                }
            }
        }
        .padding(32)
        .onAppear {
            text = "Use color sparingly in nongame apps.\nAvoid using the same color to mean different things.\nMake sure your app’s colors work well in both light and dark appearance modes. "
        }
    }
}

struct SquareColorPickerView: View {
    @EnvironmentObject var appUserData: UserData
    
    var index: Int
    var title: String
    var size: Int
    @State private var drawSwiftUIColor: Color = Color.lightBlue
    @State private var drawUIColor: UIColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    //@State private var drawHexNumber: String = "#FFFFFF"
    @State private var drawHexNumber: String = ""
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(appUserData.styleGuide.color[title, index])
                .frame(width: 80, height: 80, alignment: .center)
                .overlay(
                    ColorPicker("", selection: $drawSwiftUIColor, supportsOpacity: false).labelsHidden().opacity(0.015)
                        .onChange(of: drawSwiftUIColor) { newValue in
                            getColorsFromPicker(pickerColor: newValue)
                            appUserData.styleGuide.color[title, index] = newValue

//                            switch title {
//                            case "main":
//                                appUserData.styleGuide.color.main[index] = newValue
//                            case "sub":
//                                appUserData.styleGuide.color.sub[index] = newValue
//                            case "gray":
//                                appUserData.styleGuide.color.gray[index] = newValue
//                            default:
//                                print("nothing..")
//                            }
                        }
                       
                )
            Text("\(drawHexNumber)").font(.system(size: CGFloat(size)))
        }
    }
    
    
    func getColorsFromPicker(pickerColor: Color) {
        let colorString = "\(pickerColor)"
        let colorArray: [String] = colorString.components(separatedBy: " ")
        
        if colorArray.count > 1 {
            var r: CGFloat = CGFloat((Float(colorArray[1]) ?? 1))
            var g: CGFloat = CGFloat((Float(colorArray[2]) ?? 1))
            var b: CGFloat = CGFloat((Float(colorArray[3]) ?? 1))
            let alpha: CGFloat = CGFloat((Float(colorArray[4]) ?? 1))
            
            if (r < 0.0) {r = 0.0}
            if (g < 0.0) {g = 0.0}
            if (b < 0.0) {b = 0.0}
            
            if (r > 1.0) {r = 1.0}
            if (g > 1.0) {g = 1.0}
            if (b > 1.0) {b = 1.0}
            
            // Update UIColor
            drawUIColor = UIColor(red: r, green: g, blue: b, alpha: alpha)
            
            // Update hex
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            drawHexNumber = String(format: "#%06X", rgb)
        }
    }
}
