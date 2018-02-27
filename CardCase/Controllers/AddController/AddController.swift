//
//  AddController.swift
//  CardCase
//
//  Created by Raj Dhakate on 27/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit

enum Selection {
    case Card
    case Account
}

protocol AddControllerDelegate {
    func didSelectAddType(selection: Selection)
}

class AddController: UIViewController {
    
    var delegate: AddControllerDelegate!

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var addViewBG: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewBG.layer.cornerRadius = 10
        addViewBG.layer.borderWidth = 1
        addViewBG.layer.borderColor = UIColor.lightGray.cgColor
        addViewBG.layer.shadowColor = UIColor.darkGray.cgColor
        addViewBG.layer.shadowOffset = CGSize(width: 0, height: 0)
        addViewBG.layer.shadowRadius = 20
        addViewBG.layer.shadowOpacity = 1
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss(animated:completion:)))
        blurView.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func addCardButtonAction(_ sender: UIButton) {
        dismiss(animated: true) {
            self.delegate.didSelectAddType(selection: .Card)
        }
    }
    
    @IBAction func addAccountButtonAction(_ sender: UIButton) {
        dismiss(animated: true) {
            self.delegate.didSelectAddType(selection: .Account)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
