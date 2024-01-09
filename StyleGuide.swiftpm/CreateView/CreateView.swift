//
//  CreateLogoView.swift
//  CreateStyleGuide
//
//  Created by Lee Jinhee on 2023/04/09.
//

import SwiftUI

enum TapInfo : String, CaseIterable {
    case logo = "Icon"
    case profile = "Profile"
    case typo = "Typography"
    case color = "Color"
    case button = "Button"
    case selection = "Selection"
    case notification = "Notification"
    
    var explainText: String {
        switch self {
        case .logo:
            return "Embrace simplicity. Simple icons tend to be easier for people to understand and recognize.\nFind a concept or element that captures the essence of your app,\nmake it the focus point of the icon, and express it in a simple, unique way."
        case .button:
            return "Make buttons easy for people to choose.\nButtons need a hit target of at least 44x44 points to accommodate a fingertip.\nEnsure that each button clearly communicates it purpose.\nUse a filled button for the most likely action in a view.\nUse style (not size) to visually distinguish the preferred choice among multiple options. "
        case .profile:
            return "You can help everyone feel welcome in your app by avoiding unnecessary references to specific genders.\nWhen it’s necessary to depict a generic person or people, use a nongendered human image \nto reinforce the message that generic person means human, not man or woman."
        case .typo:
            return "Strive to maintain a minimum font size that most people can read easily.\nMinimize the number of typefaces you use in your interface.\nIn general, avoid light font weights to help maintain readability.\nPrioritize important content when responding to text-size changes."
        case .color:
            return "Use color sparingly in nongame apps.\nAvoid using the same color to mean different things.\nMake sure your app’s colors work well in both light and dark appearance modes. "
        case .selection:
            return "Toggle\nUse the switch toggle style only in a list row.\nChange the default color of a switch only if necessary.\nBe sure to use a color that provides enough contrast with the uncolored appearance to be perceptible.\n\nSlider\nUse familiar slider directions.\nConsider supplementing a slider with a corresponding text field and stepper. "
        case .notification:
            return "Used to indicate information that the user must be aware of.\nIt is mainly used with Icon and refers to information\nabout alarms or conditions depending on the situation."
        }
    }
}

struct CreateView: View {
    @State var rootIsActive : Bool = true
    @State private var selectedPicker: TapInfo = .logo
    
    @Namespace private var animation
    @EnvironmentObject var appUserData: UserData
    
    @State private var showingPopover = false
    
    // TODO: TRUE로 변경하고 푸시
    @State var shouldShowOnboarding : Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.lightBlue.edgesIgnoringSafeArea(.all)
                VStack {
                    headerView
                    
                    CreateTabContentView(tap: selectedPicker)
                    
                    Spacer()
                }
            }
            .navigationTitle("Create Style Guide")
            
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: {
                                            TotalView()
                                            
                                        }, label: {
                                            Image(systemName: "checkmark")
                                        }
                                    )
                                        .isDetailLink(false)
            )
            .navigationBarItems(trailing:
                                    Button {
                //MARK: reset
                appUserData.styleGuide = StyleGuide.initialStyle
            } label: {
                Image(systemName: "goforward")
            }
            )
            
            .navigationBarItems(trailing:
                                    Button(action: { showingPopover = true }) {
                Image(systemName: "questionmark.circle")
            }
                .popover(isPresented: $showingPopover) {
                    Text(selectedPicker.explainText)
                        .font(.body)
                        .padding()
                }
            )
            
            //MARK: Onborading
            .fullScreenCover(isPresented: $shouldShowOnboarding) {
                OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
            }
        }
        .padding(32).edgesIgnoringSafeArea(.all)
        .background(Color.lightBlue)
        .navigationViewStyle(.stack)
        .tint(.black)
    }
    
    
    private var headerView: some View {
        HStack {
            ForEach(TapInfo.allCases, id: \.self) { item in
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

struct CreateTabContentView : View {
    var tap : TapInfo
    
    var body: some View {
        GeometryReader(content: { geometry in
            VStack {
                switch tap {
                case .logo:
                    LogoView()
                case .profile:
                    ProfileView()
                case .typo:
                    FontView()
                case .color:
                    ColorView()
                case .button:
                    ButtonView()
                case .selection:
                    SelectionView()
                case .notification:
                    NotiView()
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(.white)
            .cornerRadius(40)
            .ignoresSafeArea()
        })
    }
}
