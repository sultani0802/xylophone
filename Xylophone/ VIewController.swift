//
//  ViewController.swift
//  Xylophone
//
//  Created by Haamed Sultani on 2018-08-07.
//  Copyright © 2018 Sultani. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer! // Module required to play audio
    var xylophoneSoundFiles = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"] // Name of the audio files

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    

    @IBAction func notePressed(_ sender: UIButton) {
        let noteFile = xylophoneSoundFiles[sender.tag] // Use the sender tag to identify which audio file to play
        let soundURL = Bundle.main.url(forResource: noteFile, withExtension: "wav")! // Create the URL for the audio
        
        // Play the key the user clicked
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer.play()
        } catch let err as Error{
            print("Error playing note: \(err)")
        }
    }
}
