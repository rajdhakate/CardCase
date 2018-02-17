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

class Login: UIViewController, UITableViewDataSource, UITableViewDelegate, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {
    
    let cellID = "Cell"
    let fbCellID = "FBCell"
    let googleCellID = "GoogleCell"
    
    var dataSource = [LoginTextModel]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var header: UIView!
    
    private func fieldModels() {
        let email = LoginTextModel(id: "email", placeholder: "Email", value: nil, valid: .empty, icon: nil)
        let password = LoginTextModel(id: "password", placeholder: "Password", value: nil, valid: .empty, icon: nil)
        dataSource.append(email)
        dataSource.append(password)
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
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        checkForCurrentUser()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count + 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
