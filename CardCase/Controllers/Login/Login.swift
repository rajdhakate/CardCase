//
//  Login.swift
//  CardCase
//
//  Created by Raj Dhakate on 09/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import GoogleSignIn

enum FormType {
    case signin
    case signup
}

class Login: UIViewController, UITableViewDataSource, UITableViewDelegate, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {
    
    let cellID = "Cell"
    let fbCellID = "FBCell"
    let googleCellID = "GoogleCell"
    
    var dataSource = [LoginTextModel]()
    var formType: FormType = .signin
    
    @IBOutlet weak var loginTypeLabel: UILabel!
    @IBOutlet weak var changeLoginTypeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var header: UIView!
    @IBOutlet weak var proceedButton: UIButton!
    
    private func fieldModels() {
        if dataSource.count>0 {
            dataSource.removeAll()
        }
        let email = LoginTextModel(id: "email", placeholder: "Email", value: nil, valid: .empty, icon: nil)
        let password = LoginTextModel(id: "password", placeholder: "Password", value: nil, valid: .empty, icon: nil)
        dataSource.append(email)
        dataSource.append(password)
        if formType == .signup {
            let username = LoginTextModel(id: "username", placeholder: "Username", value: nil, valid: .empty, icon: nil)
            let confirmpassword = LoginTextModel(id: "confirmpassword", placeholder: "Comfirm Password", value: nil, valid: .empty, icon: nil)
            dataSource.insert(username, at: 0)
            dataSource.append(confirmpassword)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        fieldModels()
        
        let nib = UINib(nibName: "LoginTextField", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellID)
        let fbNib = UINib(nibName: "LoginFBField", bundle: nil)
        tableView.register(fbNib, forCellReuseIdentifier: fbCellID)
        let googleNib = UINib(nibName: "LoginGoogleField", bundle: nil)
        tableView.register(googleNib, forCellReuseIdentifier: googleCellID)
        tableView.dataSource = self
        tableView.delegate = self
        header.frame = CGRect(x: 0, y: 0, width: Utility.screenWidth(), height: Utility.screenHeight()/3)
        tableView.tableHeaderView = header
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.tableView.addGestureRecognizer(tapGesture)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        proceedButton.layer.cornerRadius = proceedButton.layer.bounds.height/2
        proceedButton.layer.shadowColor = UIColor.darkGray.cgColor
        proceedButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        proceedButton.layer.shadowRadius = 4
        proceedButton.layer.shadowOpacity = 0.7
        
        checkForCurrentUser()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if formType == .signin {
            return dataSource.count + 2
        } else {
            return dataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if formType == .signin {
            if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: googleCellID, for: indexPath) as! LoginGoogleField
                cell.googleButton.addTarget(self, action: #selector(googleButtonAction(sender:)), for: .touchUpInside)
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: fbCellID, for: indexPath) as! LoginFBField
                cell.facebookButton.addTarget(self, action: #selector(facebookButtonAction(sender:)), for: .touchUpInside)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! LoginTextField
                cell.fieldModel = dataSource[indexPath.row]
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! LoginTextField
            cell.fieldModel = dataSource[indexPath.row]
            return cell
        }
    }
    
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    private func checkForCurrentUser() {
        if (FBSDKAccessToken.current() != nil) {
            
        }
    }
    
    @objc private func facebookButtonAction(sender: UIButton!) {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email", "public_profile"], from: self) { (loginResult, error) in
            if let error = error {
                print("Error in FBLogin : \(error.localizedDescription)")
                return
            } else {
                
            }
        }
    }
    
    @IBAction func changeLoginModeButtonAction(_ sender: UIButton) {
        loginTypeLabel.text = sender.currentTitle
        formType = (loginTypeLabel.text?.elementsEqual("in"))! ? FormType.signin : .signup
        let title = (loginTypeLabel.text?.elementsEqual("in"))! ? "up" : "in"
        sender.setTitle(title, for: .normal)
        fieldModels()
        var indexPaths = [IndexPath]()
        for index in dataSource.indices {
            let indexPath = IndexPath(row: index, section: 0)
            indexPaths.append(indexPath)
        }
        let animation = formType == .signin ? UITableViewRowAnimation.right : .left
        self.tableView.reloadRows(at: indexPaths, with: animation)
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
    }
    
    @objc private func googleButtonAction(sender: UIButton!) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        
    }
}
