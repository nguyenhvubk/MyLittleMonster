//
//  ViewController.swift
//  MyLittleMonster
//
//  Created by Hoang Vu on 8/18/16.
//  Copyright © 2016 ViNZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var skull1Img: UIImageView!
    @IBOutlet weak var skull2Img: UIImageView!
    @IBOutlet weak var skull3Img: UIImageView!
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPEQUE: CGFloat = 1.0
    let maxPenalties = 3
    
    var penalties = 0
    var timer: NSTimer!
    var monsterHappy = false
    var currentItem: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
        skull1Img.alpha = DIM_ALPHA
        skull2Img.alpha = DIM_ALPHA
        skull3Img.alpha = DIM_ALPHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDropped(_:)), name: "onTargetDropped", object: nil)
        
        startTimer()
    }

    func itemDropped(notif: AnyObject) {
        startTimer()
        monsterHappy = true
        
        foodImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        heartImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
    }

    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
    
    func changeGameState () {
        if !monsterHappy {
            
            penalties += 1
            if penalties == 1 {
                skull1Img.alpha = OPEQUE
                skull2Img.alpha = DIM_ALPHA
            } else if penalties == 2 {
                skull2Img.alpha = OPEQUE
                skull3Img.alpha = DIM_ALPHA
            } else if penalties >= 3 {
                skull3Img.alpha = OPEQUE
            } else {
                skull1Img.alpha = DIM_ALPHA
                skull2Img.alpha = DIM_ALPHA
                skull3Img.alpha = DIM_ALPHA
            }
            if penalties >= maxPenalties {
                gameOver()
            }

        }
        let rand = arc4random_uniform(2)// 0 or 1
        if rand == 0 {
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            
            foodImg.alpha = OPEQUE
            foodImg.userInteractionEnabled = true
        } else if rand == 1 {
            heartImg.alpha = OPEQUE
            heartImg.userInteractionEnabled = true
            
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
        }
        
        monsterHappy = false
        currentItem = Int(rand)
    }
    
    func gameOver(){
        //penalties = 0
        timer.invalidate()
        monsterImg.playDead()
    }

}

