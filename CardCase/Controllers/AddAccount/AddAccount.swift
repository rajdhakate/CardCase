//
//  AddAccount.swift
//  CardCase
//
//  Created by Raj Dhakate on 27/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit

class AddAccount: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(close(sender:)))
        self.navigationItem.rightBarButtonItems = [closeButton]
        self.navigationController?.textColor()
        self.title = "Add Account"
    }

    @objc private func close(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
