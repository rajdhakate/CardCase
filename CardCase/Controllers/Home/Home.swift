//
//  Home.swift
//  CardCase
//
//  Created by Raj Dhakate on 18/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit
import iCarousel
import GoogleMobileAds

enum ViewType {
    case CARD
    case ACCOUNT
}

class Home: UIViewController, iCarouselDelegate, iCarouselDataSource, UITableViewDataSource, UITableViewDelegate, AddControllerDelegate, GADBannerViewDelegate {
    
    static let cardCell = "CardCell"
    static let accountCell = "AccountCell"
    
    var viewType: ViewType = .CARD
    var bannerAd: GADBannerView!
    
    @IBOutlet var bannerView: UIView!
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
    
    private func loadAdView() {
        bannerAd = GADBannerView(adSize: kGADAdSizeBanner)
        bannerAd.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerAd.rootViewController = self
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        bannerAd.delegate = self
        bannerAd.load(request)
        bannerView.addSubview(bannerAd)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationbar()
        self.setupTableView()
        self.loadAdView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
    
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
        bannerView.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            self.tableview.tableHeaderView = bannerView
        }) { (completed) in
            bannerView.alpha = 1
        }
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
}
