//
//  Home.swift
//  CardCase
//
//  Created by Raj Dhakate on 18/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit
import iCarousel

enum ViewType {
    case CARD
    case ACCOUNT
}

class Home: UIViewController, iCarouselDelegate, iCarouselDataSource, UITableViewDataSource, UITableViewDelegate, AddControllerDelegate {
    
    static let cardCell = "CardCell"
    static let accountCell = "AccountCell"
    
    var viewType: ViewType = .CARD
    
    @IBOutlet var carouselView: iCarousel!
    @IBOutlet weak var tableview: UITableView!
    
    private func setupNavigationbar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonAction(sender:)))
        self.navigationItem.rightBarButtonItems = [addButton]
        
        let segment = UISegmentedControl(items: ["Cards", "Accounts"])
        segment.addTarget(self, action: #selector(segmentControlAction(sender:)), for: .valueChanged)
        segment.selectedSegmentIndex = 0
        self.navigationItem.titleView = segment
        
        self.title = segment.titleForSegment(at: 0)
        self.navigationController?.textColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationbar()
        self.setupTableView()
        
//        self.tableview.tableHeaderView = carouselView
//        self.setupCarousel()
    }
    
    private func setupTableView() {
        let cardNib = UINib(nibName: "CardCell", bundle: nil)
        let accountNib = UINib(nibName: "AccountCell", bundle: nil)
        self.tableview.register(cardNib, forCellReuseIdentifier: Home.cardCell)
        self.tableview.register(accountNib, forCellReuseIdentifier: Home.accountCell)
        self.tableview.dataSource = self
        self.tableview.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewType == .CARD {
            return 10
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewType == .CARD {
            let card = tableview.dequeueReusableCell(withIdentifier: Home.cardCell, for: indexPath)
            return card
        } else {
            let account = tableview.dequeueReusableCell(withIdentifier: Home.accountCell, for: indexPath)
            return account
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if viewType == .CARD {
            return 200
        } else {
            return 250
        }
    }
    
    @objc private func addButtonAction(sender: UIBarButtonItem) {
        let objvc = AddController()
        objvc.delegate = self;
        objvc.modalPresentationStyle = .overCurrentContext
        present(objvc, animated: true) {
            UIView.animate(withDuration: 0.4, animations: {
                
            })
        }
    }
    
    @objc private func segmentControlAction(sender: UISegmentedControl) {
        viewType = sender.selectedSegmentIndex == 0 ? ViewType.CARD : .ACCOUNT
        self.title = sender.titleForSegment(at: sender.selectedSegmentIndex)
        
        self.tableview.reloadData()
    }
    
    
    func didSelectAddType(selection: Selection) {
        var objvc = UIViewController()
        switch selection {
        case .Card:
            objvc = AddCard()
        case .Account:
            objvc = AddAccount()
        }
        let navigationController = UINavigationController(rootViewController: objvc)
        navigationController.navigationBar.prefersLargeTitles = true
        present(navigationController, animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 5
    }
    
    private func setupCarousel() {
        carouselView.type = .linear
        carouselView.dataSource = self
        carouselView.delegate = self
        carouselView.bounces = false
        carouselView.isPagingEnabled = true
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: carouselView.frame)
        
        let cardView = UIView(frame: view.frame.insetBy(dx: 10, dy: 10))
        cardView.backgroundColor = .orange
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardView.layer.shadowRadius = 5
        cardView.layer.shadowOpacity = 0.8
        
        view.addSubview(cardView)
        return view
    }
}
