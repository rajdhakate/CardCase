//
//  Home.swift
//  CardCase
//
//  Created by Raj Dhakate on 18/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit
import iCarousel

class Home: UIViewController, iCarouselDelegate, iCarouselDataSource {

    @IBOutlet var carouselView: iCarousel!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        
        self.tableview.tableHeaderView = carouselView
        carouselView.type = .linear
        carouselView.dataSource = self
        carouselView.delegate = self
        carouselView.bounces = false
        carouselView.isPagingEnabled = true
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 5
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: carouselView.frame)
        
        let cardView = UIView(frame: view.frame.insetBy(dx: 10, dy: 10))
        cardView.backgroundColor = .blue
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardView.layer.shadowRadius = 5
        cardView.layer.shadowOpacity = 0.8
        
        view.addSubview(cardView)
        return view
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
