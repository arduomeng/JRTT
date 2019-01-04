//
//  ShengxiaoBigImageViewController.swift
//  News
//
//  Created by Lin on 2018/4/18.
//  Copyright © 2018年 Lin. All rights reserved.
//

import UIKit
import IBAnimatable

class ShengxiaoBigImageViewController: AnimatableModalViewController {

    var shengxiao = Shengxiao()
    
    @IBOutlet weak var shengxiaoTitleLabel: UILabel!
    
    @IBOutlet weak var imageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shengxiaoTitleLabel.text = shengxiao.title
        imageButton.setImage(UIImage(named: shengxiao.big), for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
