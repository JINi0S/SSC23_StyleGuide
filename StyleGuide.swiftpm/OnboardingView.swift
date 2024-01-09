import SwiftUI
import Photos

struct OnboardingView: View {
    
    @State private var currentTap = 0
    @Binding var shouldShowOnboarding: Bool
    @State private var showingDenied: Bool = false
    
    init(shouldShowOnboarding: Binding<Bool>) {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.darkBlue)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.lightBlue)
        
        self._shouldShowOnboarding = shouldShowOnboarding
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $currentTap) {
                firstView
                    .tag(0)
                secondView
                    .tag(1)
                thirdView
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .padding()
        .background(Color.mainBlue)
        .previewInterfaceOrientation(.landscapeLeft)
        .alert(isPresented: $showingDenied) {
            Alert(title: Text("You didn't allow to access photos album"),
                  message: Text("The style guide will not save in Photos. \n Please allow access to the photos album in the Settings app."),
                  primaryButton: .default(
                    Text("Open Setting"),
                    action: {
                        if let url = URL(string: "App-Prefs:root=General&path=About") {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                        showingDenied = false
                    }
                  ),
                  secondaryButton: .default(Text("Cancel"), action: {showingDenied = false}))
        }
        .onAppear {
            PHPhotoLibrary.requestAuthorization( { status in
                switch status {
                case .authorized :
                    print("authorized")
                case .denied, .limited, .restricted, .notDetermined:
                    print("denied,,,")
                    showingDenied = true
                default:
                    print("default")
                    showingDenied = true
                }
            })
        }
    }
}


extension OnboardingView {
    
    private var firstView: some View {
        VStack(alignment: .leading) {
            Text("Create Style Guide")
                .font(.system(size: 48, weight: .bold))
            Text("Create a style guide for your iOS app")
                .font(.system(size: 24, weight: .semibold))
            
            HStack(spacing: 48) {
                Image("Char1")
                    .scaledToFit()
                    .padding(.top, 54)
                
                Image("Say")
                    .scaledToFit()
                    .padding(.bottom, 80)
            }
        }
    }
    
    private var secondView: some View {
        VStack {
            Text("What is Style Guide?")
                .font(.system(size: 24, weight: .semibold))
            
            Text("A style guide is a guide for maintaining consistent design for a company or brand. It standardizes design elements such as logos, colors, typography, icons, images, and graphic design to enhance the brand image. Additionally, utilizing the style guide in design work helps maintain consistency and efficiency.")
                .frame(maxWidth: 700)
                .padding(32)
                .background(Color.lightBlue)
                .cornerRadius(8)
        }
    }
    
    private var thirdView: some View {
        VStack {
            Text("What are the advantages of a Style Guide?")
                .font(.system(size: 24, weight: .semibold))
            VStack(spacing: 8) {
                HStack(alignment: .top) {
                    Text("Consistent design")
                        .font(.system(size: 18, weight: .semibold))
                    
                        .frame(maxWidth: 270)
                    Text("A style guide helps maintain consistent design and UI elements in the app, which improves user experience and strengthens the brand.")
                }
                HStack(alignment: .top) {
                    Text("Reduced development time")
                        .font(.system(size: 18, weight: .semibold))
                    
                        .frame(maxWidth: 270)
                    Text("By defining design elements such as colors, fonts, and icons beforehand, developers can reduce the time it takes to develop the design.")
                }
                
                HStack(alignment: .top) {
                    Text("Easy maintenance")
                        .font(.system(size: 18, weight: .semibold))
                    
                        .frame(maxWidth: 270)
                    Text("A style guide is useful when changes to the app's design elements are needed. It helps developers modify existing design elements or add new ones, making maintenance easier.")
                }
                
                HStack(alignment: .top) {
                    Text("Efficient collaboration")
                        .font(.system(size: 18, weight: .semibold))
                    
                        .frame(maxWidth: 270)
                    Text("Defining and documenting design elements enables all team members, including developers, designers, and product managers, to use them consistently, promoting efficient collaboration.")
                }
                
                HStack(alignment: .top) {
                    Text("Brand reinforcement")
                        .font(.system(size: 18, weight: .semibold))
                    
                        .frame(maxWidth: 270)
                    Text("Aligning an app's design and UI elements with a brand's image makes it easier for users to recognize and identify the brand.")
                }
            }
            .padding(32)
            .frame(maxWidth: 700)
            .background(Color.lightBlue)
            .cornerRadius(16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .bottomTrailing) {
            Button {
                shouldShowOnboarding.toggle()
            } label: {
                Text("Let's Start")
                    .font(.system(size: 24, weight: .semibold))
                    .frame(width: 180, height: 60)
                    .foregroundColor(.lightBlue)
                    .background(Color.darkBlue)
                    .cornerRadius(15)
            }
            .padding()
        }
    }
}
