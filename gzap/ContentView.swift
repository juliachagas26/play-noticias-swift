//
//  ContentView.swift
//  gzap
//
//  Created by Júlia on 23/01/23.
//

import SwiftUI
import AVKit


struct ContentView: View {
    var audioPlayer: AVPlayer = AVPlayer()
    
    func loadFiles() {
        let file1 = Bundle.main.path(forResource: "curiosidades", ofType: "mp3") ?? ""
        let file1URL = URL(fileURLWithPath: file1)
        let playerItem1 = AVPlayerItem(url: file1URL)
        audioPlayer.replaceCurrentItem(with: playerItem1)
    }
    
    var body: some View {
            VStack {
                    Text("Escute essa notícia").font(.system(size: 30)).font(.largeTitle)
                    HStack {
                    Spacer()
                    Button(action: {
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "play.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                    Button(action: {
                        self.audioPlayer.pause()
                    }) {
                        Image(systemName: "pause.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                }
            }.onAppear {
                loadFiles()
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
