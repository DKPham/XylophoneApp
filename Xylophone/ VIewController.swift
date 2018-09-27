//
//  ViewController.swift
//  Xylophone
//
//  Created by Duy Pham on 05/23/2016.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer : AVAudioPlayer!
    let soundFileArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        let selectedSoundFileName: String = soundFileArray[sender.tag - 1]
        playSound(soundFile: selectedSoundFileName)
    }
    
    func playSound(soundFile: String) {
        let soundURL = Bundle.main.url(forResource: soundFile, withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch let error as Error {
            print(error.localizedDescription)
        }
        audioPlayer.play()
    }
}
