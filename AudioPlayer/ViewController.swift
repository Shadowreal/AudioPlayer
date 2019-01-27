//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Andrew Borisov on 1/17/19.
//  Copyright © 2019 Andrew Borisov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

 var player = AVAudioPlayer()
 let durationSlider = UISlider()
 let volumeSlider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatingView()
        createNextButton()
        createBackButton()
        creatPlayAndPausButton()
        creatDurationSlider()
        createVolumeSlider()
    
    //MARK: - player creation
//        do {
//            if let song1Path = Bundle.main.path(forResource: "We", ofType: "mp3") {
//               try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: song1Path))
//
//            }
//        } catch  {
//            print("Error")
//        }
        
        let fileManager = FileManager.default
        if let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileUrl = documentsURL.appendingPathComponent("General.mp3")
            
            if let tempPlayer = try? AVAudioPlayer(contentsOf: fileUrl) {
                player = tempPlayer
            }
            
//            do {
//                let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
//                // process files
//            } catch {
//                print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
//            }
        }
    //        let song2Path = Bundle.main.path(forResource: "restoran", ofType: "mp3")
   //         let song3Path = Bundle.main.path(forResource: "General", ofType: "mp3")
    }
  
    //MARK: - creating view

    private  func creatingView () {
            let backgroundImage = UIImage(named: "imageMp3")
            let backgroundView = UIImageView(frame: self.view.bounds)
            backgroundView.contentMode = .scaleAspectFit
            backgroundView.image = backgroundImage
            self.view.backgroundColor = UIColor.gray
            self.view.addSubview(backgroundView)
    
    }
    //MARK: - creation buttons
    
    private func createNextButton () {
        let backgrounImage = UIImage(named: "right")
        let backgrounImageSmall = UIImage(named: "rightMin")
        let nextButton = UIButton(type: .custom)
        nextButton.frame = CGRect(x: 245, y: 420, width: 50, height: 50)
        nextButton.setBackgroundImage(backgrounImage, for: .normal)
        nextButton.setBackgroundImage(backgrounImageSmall, for: .highlighted)
        self.view.addSubview(nextButton)
    }
    
    private func createBackButton () {
        let backImage = UIImage(named: "left")
        let backImageSmall = UIImage(named: "leftMin")
        let backButton = UIButton(type: .custom)
        backButton.frame = CGRect(x: 90, y: 420, width: 50, height: 50)
        backButton.setBackgroundImage(backImage, for: .normal)
        backButton.setBackgroundImage(backImageSmall, for: .highlighted)
    
        self.view.addSubview(backButton)
    }
    
    private func creatPlayAndPausButton () {
        let playImage = UIImage(named: "play")
        let pauseImage = UIImage(named: "pauseMin")
        let playButton = UIButton(type: .custom)
        playButton.frame = CGRect(x: 168, y: 420, width: 50, height: 50)
        playButton.setBackgroundImage(playImage, for: .normal)
        playButton.setBackgroundImage(pauseImage, for: .highlighted)
        playButton.addTarget(self, action: #selector(playsong(_:)), for: .touchUpInside)
        self.view.addSubview(playButton)
        
    }
    
    //MARK: - creation sliders

    private func creatDurationSlider () {
        durationSlider.frame = CGRect(x: 40, y: 620, width: 300, height: 20)
        durationSlider.maximumValue = 100.0
        durationSlider.minimumValue = 0.0
        durationSlider.addTarget(self, action: #selector(durationMusic(_:)), for: .valueChanged)
        self.view.addSubview(durationSlider)
    }

    private func createVolumeSlider () {
        volumeSlider.frame = CGRect(x: 40, y: 38, width: 300, height: 20)
        volumeSlider.maximumValue = 100.0
        volumeSlider.minimumValue = 0.0
        volumeSlider.addTarget(self, action: #selector(volumeChange), for: .valueChanged)
       self.view.addSubview(volumeSlider)
    }
 
    //MARK - Action button & methods
    
    @IBAction func playsong (_ sender: UIButton) {
        if self.player.isPlaying {
            self.player.pause()
        }else{
            self.player.play()
        }
    }

    @IBAction func durationMusic (_ sender: UISlider) {
         if self.durationSlider == sender {
            self.player.currentTime = TimeInterval(sender.value)
        }
        
    }
    
   @objc func volumeChange (_ sender: UISlider) {
        if self.volumeSlider == sender {
            self.player.volume = sender.value
    }
        }
        
   
}
