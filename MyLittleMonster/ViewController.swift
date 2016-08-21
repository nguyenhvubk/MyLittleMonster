//
//  ViewController.swift
//  MyLittleMonster
//
//  Created by Hoang Vu on 8/18/16.
//  Copyright © 2016 ViNZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg: UIImageView!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imgArr = [UIImage]()
        for x in 1...4 {
            let img = UIImage(named: "idle\(x).png")
//            imgArr.append(img)
            if let _img = img {
                imgArr.append(_img)
            }
        }
        
        monsterImg.animationImages = imgArr
        monsterImg.animationDuration = 0.8
        monsterImg.animationRepeatCount = 0
        monsterImg.startAnimating()
    }

    


}

