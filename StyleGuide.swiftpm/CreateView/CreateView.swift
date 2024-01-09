//
//  CreateLogoView.swift
//  CreateStyleGuide
//
//  Created by Lee Jinhee on 2023/04/09.
//

import SwiftUI

enum tapInfo : String, CaseIterable {
    case logo = "Icon"
    case profile = "Profile"
    case typo = "Typography"
    case color = "Color"
    case button = "Button"
    case selection = "Selection"
    case notification = "Notification"
}

struct CreateView: View {
    @State var rootIsActive : Bool = true
    @State private var selectedPicker: tapInfo = .logo
    @State private var text = "Don’t add an overlay or border to your Settings icon. \n iOS automatically adds a 1-pixel stroke to all icons so that they look good on the white background of Settings."
    
    @Namespace private var animation
    @EnvironmentObject var appUserData: UserData
    
    @State private var showingPopover = false
    
    //@State var isActive : Bool = false
    @State var shouldShowOnboarding : Bool = true
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.lightBlue.edgesIgnoringSafeArea(.all)
                VStack {
                    animate()
                    CreateTabView(tap: selectedPicker, text: $text)
                    
                    Spacer()
                }
            }
            .navigationTitle("Create Style Guide")
            
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: {
                                            //TotalView(shouldPopToRootView: self.$rootIsActive)
                                            TotalView()
                                            
                                        }, label: {
                                            Image(systemName: "checkmark")
                                        }
                                    )
                                    .isDetailLink(false)
            )
            .navigationBarItems(trailing: Button(action: {
                
                                        //TODO: reset 확인 alert
                                        appUserData.styleGuide = StyleGuide(
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
            }) {
                    Image(systemName: "goforward")
                }
            )
            
            .navigationBarItems(trailing:
                                    Button(action: { showingPopover = true }) {
                                        Image(systemName: "questionmark.circle")
                                    }
                                    .popover(isPresented: $showingPopover) {
                                        Text(text)
                                            .font(.body)
                                            .padding()
                                    }
            )
            
            //TODO: Onborading
            .fullScreenCover(isPresented: $shouldShowOnboarding) {
                OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
            }
        }
        .padding(32).edgesIgnoringSafeArea(.all)
        .background(Color.lightBlue)
        .navigationViewStyle(.stack)
        .tint(.black)
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(tapInfo.allCases, id: \.self) { item in
                VStack(spacing: 4) {
                    Text(item.rawValue)
                        .font(.system(size: 18, weight: selectedPicker == item ? .bold : .semibold))
                        .frame(maxWidth: .infinity/8, minHeight: 30)
                        .foregroundColor(selectedPicker == item ? .black : .gray.opacity(0.4))
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(.black)
                            .frame(width: 120, height: 2)
                            .matchedGeometryEffect(id: "info", in: animation)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}

struct CreateTabView : View {
    var tap : tapInfo
    @Binding var text: String
    var body: some View {
        GeometryReader(content: { geometry in
            VStack {
                switch tap {
                case .logo:
                    LogoView(text: $text)
                case .profile:
                    ProfileView( text: $text)
                case .typo:
                    FontView(text: $text)
                case .color:
                    ColorView(text: $text)
                case .button:
                    ButtonView(text: $text)
                case .selection:
                    SelectionView(text: $text)
                case .notification:
                    NotiView(text: $text)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(.white)
            .cornerRadius(40)
            .ignoresSafeArea()
        })
    }
}
