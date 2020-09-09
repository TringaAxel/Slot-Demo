//
//  PlaySound.swift
//  Musicx
//
//  Created by Axel Tringa on 2020-08-11.
//  Copyright © 2020 Axel Tringa. All rights reserved.
//
// Code provenant : https://www.youtube.com/watch?v=6l5nJgrXTfc Robert Petras.

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String , type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file !")
        }
    }
}
