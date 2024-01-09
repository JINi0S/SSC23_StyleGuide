//
//  DrawView.swift
//  Style Guide
//
//  Created by Lee Jinhee on 2023/04/20.
//

import SwiftUI
import Photos
struct Line {
    var points: [CGPoint]
    var color: Color
}
struct DrawView: View {
    
    @State var lines: [Line] = []
    @State var selectedColor = Color.orange
    @EnvironmentObject var appUserData: UserData
    
    var body: some View {
        ZStack {
            Color.lightBlue.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    ColorPicker(selection: $selectedColor, supportsOpacity: false, label: {}).labelsHidden()

                    ForEach([.red, .orange, .yellow, Color.green, .blue, .purple, .black], id: \.self) { color in
                        colorButton(color: color)
                    }
                    clearButton()
                    
                }
                CanvasView(lines: $lines, selectedColor: $selectedColor)
            }
            .background(.white)
            .cornerRadius(40)
        }
        .navigationBarItems(
            trailing:
                Button {
                    //MARK: Save image
                    let drawViewimage = CanvasView(lines: $lines, selectedColor: $selectedColor).asUiImage()
                    PHPhotoLibrary.requestAuthorization( { status in
                            switch status {
                            case .authorized :
                                print("authorized")
                                UIImageWriteToSavedPhotosAlbum(drawViewimage, self, nil, nil)
                                appUserData.styleGuide.logo.logoImage = Image(uiImage: drawViewimage)
                            case .denied, .limited, .restricted, .notDetermined:
                                print("denied,,,")
                            default:
                                print("default")
                            }
                    })
                } label: {
                    //Image(systemName: "square.and.arrow.down")
                    Text("Save")
                }
        )
    }
    
    @ViewBuilder
    func colorButton(color: Color) -> some View {
        Button {
            selectedColor = color
        } label: {
            Image(systemName: "circle.fill")
                .font(.largeTitle)
                .foregroundColor(color)
                .mask {
                    Image(systemName: "pencil.tip")
                        .font(.largeTitle)
                }
        }
    }
    
    @ViewBuilder
    func clearButton() -> some View {
        Button {
            if !lines.isEmpty {
                lines.remove(at: lines.count - 1) 
            }
        } label: {
            Image(systemName: "pencil.tip.crop.circle.badge.minus")
                .font(.largeTitle)
                .foregroundColor(.gray)
        }
    }
}

struct CanvasView: View {
    @Binding var lines: [Line]
    @Binding var selectedColor : Color
    
    var body: some View {
        VStack {
            Canvas {ctx, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    
                    ctx.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: 32, lineCap: .round, lineJoin: .round))
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ value in
                        let position = value.location
                        
                        if value.translation == .zero {
                            lines.append(Line(points: [position], color: selectedColor))
                        } else {
                            guard let lastIdx = lines.indices.last else {
                                return
                            }
                            
                            lines[lastIdx].points.append(position)
                        }
                    })
            )
        }.frame(width: 600, height: 600)
    }
}
