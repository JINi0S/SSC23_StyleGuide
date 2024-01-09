//
//  UserData.swift
//  CreateStyleGuide
//
//  Created by Lee Jinhee on 2023/04/11.
//

import SwiftUI

class UserData: ObservableObject {    
    @Published var styleGuide: StyleGuide = StyleGuide.initialStyle
}

struct StyleGuide: Identifiable {
    var id = UUID()
    
    var logo: LogoComponent
    var profile: ProfileComponent
    var color: ColorComponent
    var typo: TypoCategory
    var button: [ButtonComponent]
    var toggle: ToggleComponent
    var noti: NotiComponent
    
    static var initialStyle = StyleGuide(
        logo: LogoComponent(),
        profile: ProfileComponent(width: 80, height: 80, cornerRadius: 20),
        color: ColorComponent(
            main: [.lightBlue, .mainBlue, .darkBlue, .blue, .black],
            sub: [.pink, .yellow, .blue, .green, .red],
            gray: [.gray.opacity(0.2), .gray.opacity(0.4), .gray.opacity(0.6), .gray.opacity(0.8), .gray.opacity(1.0)],
            mainSubscription: "", subSubscription: "", graySubscription: ""),
        typo: TypoCategory(
            header1: TypoComponent(weight: .semibold, size: 28),
            header2: TypoComponent(weight: .semibold, size: 24),
            subtitle1: TypoComponent(weight: .semibold, size: 18),
            subtitle2: TypoComponent(weight: .semibold, size: 16),
            subtitle3: TypoComponent(weight: .semibold, size: 14),
            body1: TypoComponent(weight: .regular, size: 16),
            body2: TypoComponent(weight: .regular, size: 14),
            caption1: TypoComponent(weight: .regular, size: 12),
            caption2: TypoComponent(weight: .semibold, size: 10)),
        button: [ButtonComponent(width: 150, height: 60, cornerRadius: 0, borderWidth: 1, borderColor: .black, backgroundColor: .blue, textString: "Next", textWeight: .light, textSize: 14, textColor: .white),
                 ButtonComponent(width: 170, height: 60, cornerRadius: 0, borderWidth: 1, borderColor: .blue, backgroundColor: .black, textString: "Cancel", textWeight: .light, textSize: 14, textColor: .white),
                 ButtonComponent(width: 190, height: 60, cornerRadius: 0, borderWidth: 1, borderColor: .black, backgroundColor: .white, textString: "Close", textWeight: .light, textSize: 14, textColor: .black)],
        toggle: ToggleComponent(color: .lightBlue),
        noti: NotiComponent(
            dot: NotiDotValue(width: 10, height: 10),
            number: NotiNumValue(width: 28, height: 20, textWeight: .regular, textSize: 12, textColor: .white), backgroundColor: [.red, .blue])
    )
}

struct ProfileComponent {
    var defaultProfile: Image?
    var imageProfile: Image?

    var width: Int
    var height: Int
    var cornerRadius: Int
}

struct TypoComponent: Hashable {
    var weight: Font.Weight
    var size: Int
}

struct TypoCategory {
    var header1: TypoComponent
    var header2: TypoComponent
    var subtitle1: TypoComponent
    var subtitle2: TypoComponent
    var subtitle3: TypoComponent
    var body1: TypoComponent
    var body2: TypoComponent
    var caption1: TypoComponent
    var caption2: TypoComponent
}

struct ToggleComponent {
    var color: Color
}

struct NotiComponent {
    var dot: NotiDotValue
    var number: NotiNumValue
    var backgroundColor: [Color]
}

struct NotiDotValue {
    var width: Int
    var height: Int
}

struct NotiNumValue {
    var width: Int
    var height: Int
    var textWeight: Font.Weight
    var textSize: Int
    var textColor: Color
}

struct LogoComponent {
    var logoImage: Image? //?옵셔널로 두면 위의 UserData 따로 초기화안해줘도 된다.
    //var logoSubscription: String
}

struct ColorComponent: Identifiable {
    
    let id = UUID()

    var main: [Color]
    var sub: [Color]
    var gray: [Color]
    var mainSubscription: String
    var subSubscription: String
    var graySubscription: String
    
    init(main: [Color], sub: [Color], gray: [Color], mainSubscription:String, subSubscription: String, graySubscription: String) {
        self.main = main
        self.sub = sub
        self.gray = gray
        
        self.mainSubscription = mainSubscription
        self.subSubscription = subSubscription
        self.graySubscription = graySubscription
    }
    
    func array(for title: String) -> [Color] {
        
        switch title {
        case "main":
            return main
        case "sub":
            return sub
        case "gray":
            return gray
        default:
            fatalError("Invalid title")
        }
    }
    
    subscript(title: String, index: Int) -> Color {
        get {
            return array(for: title)[index]
        }
        set {
            switch title {
            case "main":
                main[index] = newValue
            case "sub":
                sub[index] = newValue
            case "gray":
                gray[index] = newValue
            default:
                fatalError("Invalid title")
            }
        }
    }
}

struct ButtonComponent {
    var width: Int
    var height: Int
    var cornerRadius: Int
    var borderWidth: Int
    var borderColor: Color
    var backgroundColor: Color
    var textString: String
    var textWeight: Font.Weight
    var textSize: Int
    var textColor: Color
}
