//
//  TotalView.swift
//  CreateStyleGuide
//
//  Created by Lee Jinhee on 2023/04/10.
//

import SwiftUI
import Photos

struct TotalView: View {
    @EnvironmentObject var appUserData: UserData
    
    @State private var showingAlert: Bool = false
    @State private var showingDeniedAlert: Bool = false

    var body: some View {
        ZStack {
            Color.lightBlue.edgesIgnoringSafeArea(.all)
            
            TotalDetail()
                .cornerRadius(40)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Saved"),
                          message: Text("The style guide has been saved in Photos."),
                          dismissButton: .default(Text("OK"), action: {
                        print(showingAlert,"showing")
                        showingAlert = false }))
                }
                .alert(isPresented: $showingDeniedAlert) {
                    Alert(title: Text("You didn't allow to access photos album"),
                          message: Text("The style guide didn't saved. \n Please allow access to the photos album in the Settings app."),
                          primaryButton: .default(
                                Text("Open Setting"),
                                action: {
                                    if let url = URL(string: "App-Prefs:root=General&path=About") {
                                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                    }
                                    showingDeniedAlert = false
                                }
                          ),
                          secondaryButton: .default(Text("Cancel"), action: {showingDeniedAlert = false}))
                }
        }
        .onAppear {
            showingAlert = false
            showingDeniedAlert = false
        }
        
        .navigationBarItems(
            trailing:
                Button {
                    //MARK: Save image
                    let totalDetailViewimage = TotalDetail().environmentObject(appUserData).asUiImage()
                    PHPhotoLibrary.requestAuthorization( { status in
                            print(showingAlert,"showing1")
                            switch status {
                            case .authorized :
                                print("authorized")
                                showingAlert = true
                                UIImageWriteToSavedPhotosAlbum(totalDetailViewimage, self, nil, nil)
                            case .denied, .limited, .restricted, .notDetermined:
                                print("denied,,,")
                                showingDeniedAlert = true
                            default:
                                print("default")
                                showingDeniedAlert = true
                            }
                    })
                } label: {
                    Image(systemName: "square.and.arrow.down")
                }
        )
    }
}

struct TotalDetail: View {
    @EnvironmentObject var appUserData: UserData
    
    @State var someToggle: Bool = true
    @State var someSliderValue: Float = 0.5
    @State var selectedFruit: ExamTitle = .Title1
    
    var body: some View {
        HStack(alignment: .top) {
            
            //MARK: Color
            VStack(alignment: .leading) {
                Text("Main color")
                    .font(.system(size: 14, weight: .semibold))
                HStack(spacing: 8) {
                    ForEach(appUserData.styleGuide.color.main.indices) { index in
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(appUserData.styleGuide.color["main", index])
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                }
                .padding(.bottom, 20)
                
                Text("Sub color")
                    .font(.system(size: 14, weight: .semibold))
                HStack(spacing: 8) {
                    ForEach(appUserData.styleGuide.color.sub.indices) { index in
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(appUserData.styleGuide.color["sub", index])
                            .frame(width: 40, height: 40, alignment: .center)
                    }}
                .padding(.bottom, 20)
                
                Text("Gray Color")
                    .font(.system(size: 14, weight: .semibold))
                HStack(spacing: 8) {
                    ForEach(appUserData.styleGuide.color.gray.indices) { index in
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(appUserData.styleGuide.color["gray", index])
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                }
            }
            .padding(8)
            
            VStack(alignment: .leading, spacing: 28) {
                HStack {
                    //MARK: Profile
                    VStack(alignment: .leading) {
                        if let image = appUserData.styleGuide.profile.defaultProfile {
                        Text("Default Profile").font(.system(size: 14, weight: .semibold))
                        VStack {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: CGFloat(appUserData.styleGuide.profile.width),
                                           height: CGFloat(appUserData.styleGuide.profile.height))
                                    .background(Color.white)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: CGFloat(appUserData.styleGuide.profile.cornerRadius)))
                        }
                    }
                             
                    VStack(alignment: .leading) {
                        if let image = appUserData.styleGuide.profile.imageProfile {
                            Text("Image Profile").font(.system(size: 14, weight: .semibold))
                            VStack {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: CGFloat(appUserData.styleGuide.profile.width),
                                               height: CGFloat(appUserData.styleGuide.profile.height))
                                        .background(Color.white)
                                }.clipShape(RoundedRectangle(cornerRadius: CGFloat(appUserData.styleGuide.profile.cornerRadius)))
                        }
                    }
                }
                
                //MARK: Noti
                VStack(alignment: .leading) {
                    Text("Dot Notification")
                        .font(.system(size: 14, weight: .semibold))
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
                
                VStack(alignment: .leading) {
                    Text("Number Notification")
                        .font(.system(size: 14, weight: .semibold))
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
                    
                    
                //MARK: Toggle/slider/picker
                VStack(alignment: .leading) {
                    Text("Toggle").font(.system(size: 14, weight: .semibold))
                    Toggle("", isOn: $someToggle)
                        .toggleStyle(SwitchToggleStyle(tint: appUserData.styleGuide.toggle.color))
                    .labelsHidden()}
                    
                VStack(alignment: .leading) {
                    Text("Slider").font(.system(size: 14, weight: .semibold))
                    Slider(value: $someSliderValue)
                        .tint(appUserData.styleGuide.toggle.color)
                }
                VStack(alignment: .leading) {
                    Text("Picker").font(.system(size: 14, weight: .semibold))
                    Picker("", selection: $selectedFruit) {
                        ForEach(ExamTitle.allCases, id: \.rawValue) { title in
                            Text(title.rawValue).tag(title)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(appUserData.styleGuide.toggle.color)
                    .cornerRadius(8)
                }
            }
            .padding(8)
            .padding(.trailing, 8)
            .frame(maxWidth: 400)
            
            VStack(alignment: .leading, spacing: 16) {
                //MARK: Logo
                HStack {
                    if let image = appUserData.styleGuide.logo.logoImage {
                        
                        VStack(alignment: .leading) {
                            Text("Icon").font(.system(size: 14, weight: .semibold))
                            HStack {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .background(Color.white)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .frame(width: 80, height: 80)
                        }
                    }
                }
                
                //MARK: Button
                Text("Button").font(.system(size: 14, weight: .semibold))
                
                Button {
                } label: {
                    Text(appUserData.styleGuide.button[0].textString)
                        .lineLimit(0)
                        .frame(width: CGFloat(appUserData.styleGuide.button[0].width),
                               height: CGFloat(appUserData.styleGuide.button[0].height))
                        .foregroundColor(appUserData.styleGuide.button[0].textColor)
                        .font(.system(size: CGFloat(appUserData.styleGuide.button[0].textSize),
                                      weight: appUserData.styleGuide.button[0].textWeight))
                        .overlay(
                            RoundedRectangle(cornerRadius: CGFloat(appUserData.styleGuide.button[0].cornerRadius))
                                .stroke(appUserData.styleGuide.button[0].borderColor,
                                        lineWidth: CGFloat(appUserData.styleGuide.button[0].borderWidth)))
                }
                .background(appUserData.styleGuide.button[0].backgroundColor)
                .cornerRadius(CGFloat(appUserData.styleGuide.button[0].cornerRadius))
                
                Button {
                } label: {
                    Text(appUserData.styleGuide.button[1].textString)
                        .lineLimit(0)
                        .frame(width: CGFloat(appUserData.styleGuide.button[1].width),
                               height: CGFloat(appUserData.styleGuide.button[1].height))
                        .foregroundColor(appUserData.styleGuide.button[1].textColor)
                        .font(.system(size: CGFloat(appUserData.styleGuide.button[1].textSize),
                                      weight: appUserData.styleGuide.button[1].textWeight))
                        .overlay(
                            RoundedRectangle(cornerRadius: CGFloat(appUserData.styleGuide.button[1].cornerRadius))
                                .stroke(appUserData.styleGuide.button[1].borderColor,
                                        lineWidth: CGFloat(appUserData.styleGuide.button[1].borderWidth)))
                }
                .background(appUserData.styleGuide.button[1].backgroundColor)
                .cornerRadius(CGFloat(appUserData.styleGuide.button[1].cornerRadius))
                
                Button {
                } label: {
                    Text(appUserData.styleGuide.button[2].textString)
                        .lineLimit(0)
                        .frame(width: CGFloat(appUserData.styleGuide.button[2].width),
                               height: CGFloat(appUserData.styleGuide.button[2].height))
                        .foregroundColor(appUserData.styleGuide.button[2].textColor)
                        .font(.system(size: CGFloat(appUserData.styleGuide.button[2].textSize),
                                      weight: appUserData.styleGuide.button[2].textWeight))
                        .overlay(
                            RoundedRectangle(cornerRadius: CGFloat(appUserData.styleGuide.button[2].cornerRadius))
                                .stroke(appUserData.styleGuide.button[2].borderColor,
                                        lineWidth: CGFloat(appUserData.styleGuide.button[2].borderWidth)))
                }
                .background(appUserData.styleGuide.button[2].backgroundColor)
                .cornerRadius(CGFloat(appUserData.styleGuide.button[2].cornerRadius))
            }
            
            //MARK: Font
            Group {
                
                VStack(spacing: 8) {
                    Text("Typography").font(.system(size: 14, weight: .semibold))
                    
                    Text("Header1")
                        .font(.system(size: CGFloat(appUserData.styleGuide.typo.header1.size),
                                      weight: appUserData.styleGuide.typo.header1.weight))
                    Text("Header2")
                        .font(.system(size: CGFloat(appUserData.styleGuide.typo.header2.size),
                                      weight: appUserData.styleGuide.typo.header2.weight))
                    Text("Subtitle1")
                        .font(.system(size: CGFloat(appUserData.styleGuide.typo.subtitle1.size),
                                      weight: appUserData.styleGuide.typo.subtitle1.weight))
                    Text("Subtitle2")
                        .font(.system(size: CGFloat(appUserData.styleGuide.typo.subtitle2.size),
                                      weight: appUserData.styleGuide.typo.subtitle2.weight))
                    Text("Subtitle3")
                        .font(.system(size: CGFloat(appUserData.styleGuide.typo.subtitle3.size),
                                      weight: appUserData.styleGuide.typo.subtitle3.weight))
                    Text("Body1")
                        .font(.system(size: CGFloat(appUserData.styleGuide.typo.body1.size),
                                      weight: appUserData.styleGuide.typo.body1.weight))
                    Text("Body2")
                        .font(.system(size: CGFloat(appUserData.styleGuide.typo.body2.size),
                                      weight: appUserData.styleGuide.typo.body2.weight))
                    Text("Caption1")
                        .font(.system(size: CGFloat(appUserData.styleGuide.typo.caption1.size),
                                      weight: appUserData.styleGuide.typo.caption1.weight))
                    Text("Caption2")
                        .font(.system(size: CGFloat(appUserData.styleGuide.typo.caption2.size),
                                      weight: appUserData.styleGuide.typo.caption2.weight))
                }
            }
            .padding(.horizontal, 24)
        }
        .padding()
        .padding(.vertical, 50)
        .frame(minWidth: 400)
        .background(.white)
    }
}

extension View {
    func asUiImage() -> UIImage {
        var uiImage = UIImage(systemName: "exclamationmark.triangle.fill")!
        let controller = UIHostingController(rootView: self)
        
        if let view = controller.view {
            let contentSize = view.intrinsicContentSize
            view.bounds = CGRect(origin: .zero, size: contentSize)
            view.backgroundColor = .clear
            
            let renderer = UIGraphicsImageRenderer(size: contentSize)
            uiImage = renderer.image { _ in
                view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
            }
        }
        return uiImage
    }
}
