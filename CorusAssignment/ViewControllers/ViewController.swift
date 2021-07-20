//
//  ViewController.swift
//  CorusAssignment
//
//  Created by Apple on 19/07/21.
//

import UIKit
import PageMenu

class ViewController: UIViewController, CAPSPageMenuDelegate {
    
    var pageMenu : CAPSPageMenu?
    @IBOutlet weak var pageMenuView : UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        let controller1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "BookmarksViewController") as! BookmarksViewController
        controller1.title = "BOOKMARKS"
        controllerArray.append(controller1)
        
        let controller2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AWingViewController") as! AWingViewController
        controller2.title = "A WING"
        controllerArray.append(controller2)

        let controller3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "BWingViewController") as! BWingViewController
        controller3.title = "B WING"
        controllerArray.append(controller3)

        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        let parameters: [CAPSPageMenuOption] = [
//            .menuItemSeparatorWidth(4.3),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorPercentageHeight(0.1),
            .selectionIndicatorColor(UIColor(red: 0.0/255.0, green: 171.0/255.0, blue: 108.0/255.0, alpha: 1.0)),
            .menuHeight(50),
            .menuItemFont(UIFont.boldSystemFont(ofSize: 15.0)),
            .selectionIndicatorHeight(5),
//            .menuItemWidth(50),
            .menuItemSeparatorWidth(0),
            .menuItemWidthBasedOnTitleTextWidth(true)
        ]
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.pageMenuView!.frame.width, height: self.pageMenuView!.frame.height), pageMenuOptions: parameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.pageMenuView!.addSubview(pageMenu!.view)
        
        pageMenu!.delegate = self
        
        
    }
    
    func willMoveToPage(_ controller: UIViewController, index: Int) {
        print("willMoveToPage")
    }
    
    func didMoveToPage(_ controller: UIViewController, index: Int) {
        print("didMoveToPage")
    }
    
}
