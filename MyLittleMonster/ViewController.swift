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
    
    
    override func viewDidLoad() {
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("itemDropped:"), name: "onTargetDropped", object: nil)
        
    }

    func itemDropped(notif: AnyObject) {
        print("Dropped")
    }


}

