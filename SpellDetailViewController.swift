//
//  SpellDetailViewController.swift
//  Midterm2
//
//  Created by J. Lozano on 12/8/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import UIKit
import AVFoundation

class SpellDetailViewController: UIViewController {

    @IBOutlet weak var spellNameLabel: UILabel!
    @IBOutlet weak var spellDescriptionLabel: UILabel!
    
    var spellData = SpellData()
    var audioPlayer = AVAudioPlayer()
    var nameX: CGFloat!
    var descriptionX: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spellNameLabel.text = spellData.name
        spellDescriptionLabel.text = spellData.description
        nameX = spellNameLabel.frame.origin.x
        descriptionX = spellDescriptionLabel.frame.origin.x
    }
    
    override func viewWillAppear(_ animated: Bool) {
        spellNameLabel.frame.origin.x = self.view.frame.width
        spellDescriptionLabel.frame.origin.x = self.view.frame.width
        UIView.animate(withDuration: 0.5, animations: {self.spellNameLabel.frame.origin.x = self.nameX})
        UIView.animate(withDuration: 0.5, delay: 0.25, animations: {self.spellDescriptionLabel.frame.origin.x = self.descriptionX})
    }
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        if let sound = NSDataAsset(name: soundName){
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch{
                print("didn't work!")
            }
        } else {
            print("didn't work!")
        }
    }
    
    @IBAction func viewSwiped(_ sender: UISwipeGestureRecognizer) {
        playSound(soundName: spellData.soundFile, audioPlayer: &audioPlayer)
        UIView.animate(withDuration: 0.1, delay: 1.0, animations: {self.view.backgroundColor = UIColor.red}) { (_) in
            self.view.backgroundColor = UIColor.white
        }
    
    }
    
    
}
