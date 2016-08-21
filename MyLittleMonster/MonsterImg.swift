//
//  MonsterImg.swift
//  MyLittleMonster
//
//  Created by Hoang Vu on 8/21/16.
//  Copyright © 2016 ViNZ. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdle()
    }

    func playIdle (){
        
//        self.animationImages = nil
//        self.image = UIImage(named: "idle1.png")
//        
        var imgArr = [UIImage]()
        for x in 1...4 {
            let img = UIImage(named: "idle\(x).png")
            if let _img = img {
                imgArr.append(_img)
            }
        }
        
        self.animationImages = imgArr
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDead (){
        
//        self.animationImages = nil
//        self.image = UIImage(named: "dead5.png")
//        
        var imgArr = [UIImage]()
        for x in 1...5 {
            let img = UIImage(named: "dead\(x).png")
            if let _img = img {
                imgArr.append(_img)
            }
        }
        
        self.animationImages = imgArr
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }

}