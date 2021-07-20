//
//  BookmarksViewController.swift
//  CorusAssignment
//
//  Created by Apple on 19/07/21.
//

import UIKit

class BookmarksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if tblView != nil {
            self.tblView.reloadData()
        }
    }
    
    @objc func btnBookmarkAction(sender: UIButton) {
        guard let cell = sender.superview?.superview?.superview as? ProfileTableViewCell else {
            return // or fatalError() or whatever
        }

        let indexPath = tblView.indexPath(for: cell)
                
        tblView.reloadData()
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return BookmarkModel.sharedInstance.arrSections.count
    }
    /**
     * Tableview delegate method used to return number of rows
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookmarkModel.sharedInstance.arrSections[section].arrProfile.count
    }
    
    /**
     * Tableview delegate method used to return row/cell
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell

        //To remove seprator from particular cell
        cell.selectionStyle = .none

        cell.imgProfile.image = BookmarkModel.sharedInstance.arrSections[indexPath.section].arrProfile[indexPath.row].img
        cell.lblName.text = BookmarkModel.sharedInstance.arrSections[indexPath.section].arrProfile[indexPath.row].strName
        cell.lblDesignation.text = BookmarkModel.sharedInstance.arrSections[indexPath.section].arrProfile[indexPath.row].strDesignation
        cell.lblDesignationInfo.text = BookmarkModel.sharedInstance.arrSections[indexPath.section].arrProfile[indexPath.row].strDesignationInfo
        cell.lblInfo.text = BookmarkModel.sharedInstance.arrSections[indexPath.section].arrProfile[indexPath.row].strInfo
        
        cell.btnBookmark.addTarget(self, action: #selector(btnBookmarkAction(sender:)), for: .touchUpInside)
        
        if BookmarkModel.sharedInstance.arrSections[indexPath.section].arrProfile[indexPath.row].isBookmarked {
            
            cell.btnBookmark.setBackgroundImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            cell.btnBookmark.tintColor = UIColor(red: 0.0/255.0, green: 171.0/255.0, blue: 108.0/255.0, alpha: 1.0)
        }
        else {
            cell.btnBookmark.setBackgroundImage(UIImage(systemName: "bookmark"), for: .normal)
            cell.btnBookmark.tintColor = .lightGray
        }
        
        if indexPath.row == BookmarkModel.sharedInstance.arrSections[indexPath.section].arrProfile.count - 1 {
            cell.lblBottomLine.isHidden = true
            cell.bgView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 10.0)

        }
        else {
            cell.lblBottomLine.isHidden = false
            cell.bgView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 0.0)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let lbl = headerCell.viewWithTag(10) as! UILabel
        lbl.text = BookmarkModel.sharedInstance.arrSections[section].strSectionName + " " + BookmarkModel.sharedInstance.arrSections[section].strScreenName
        return headerCell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
