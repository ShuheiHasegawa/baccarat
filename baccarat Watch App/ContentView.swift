//
//  ContentView.swift
//  baccarat Watch App
//
//  Created by Shuhei Hasegawa on 2023/04/18.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
    
    
//    @State var flg = true
//
//    var body: some View {
//        VStack {
//            if self.flg {
//                Text("Hello World!")
//                    .onTapGesture {
//                        self.flg.toggle()
//                }
//            }
//            else{
//                Text("Tapped!")
//                    .onTapGesture {
//                        self.flg.toggle()
//                }
//            }
//        }
//    }
    
    var body: some View {
        VStack {
            Text("Baccarat")
                // スワイプジェスチャーイベント
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.width < 0 {
                                // left
                                print("left!")
                            }

                            if value.translation.width > 0 {
                                // right
                                print("right!")
                            }
                            if value.translation.height < 0 {
                                // up
                                print("up!")
                            }

                            if value.translation.height > 0 {
                                // down
                                print("down!")
//                                knock(type: WKHapticType(rawValue: 6))
                                WKInterfaceDevice.current().play(.success)
                            }
                        }))
        }
    }
    
    // 振動通知イベント
    func knock(type: WKHapticType?) {
        guard let hType = type else { return }
        WKInterfaceDevice.current().play(hType)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
