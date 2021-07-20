//
//  AWingViewController.swift
//  CorusAssignment
//
//  Created by Apple on 19/07/21.
//

import UIKit

class AWingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    
    var arrSections: [SectionModel] = [
        SectionModel(strScreenName: "A WING", strSectionName: "101", arrProfile: [
            ProfileModel(strName: "Grace Kelly", strDesignation: "COMMITTE MEMBER", strDesignationInfo: "", strInfo: "", isBookmarked: false, img: #imageLiteral(resourceName: "rectangle-3_2x-1")),
            ProfileModel(strName: "Amy Johnson", strDesignation: "", strDesignationInfo: "Senior vice President, Marketing CRYOBOT SYSTEMS", strInfo: "Success is not easy and certainly not for lazy.", isBookmarked: false, img: #imageLiteral(resourceName: "rectangle-3-1_2x-1"))
        ]),
        SectionModel(strScreenName: "A WING", strSectionName: "102", arrProfile: [
            ProfileModel(strName: "Charlie Tabbot", strDesignation: "COMMITTE MEMBER MODERATOR", strDesignationInfo: "", strInfo: "", isBookmarked: false, img: #imageLiteral(resourceName: "rectangle-3-4_2x")),
            ProfileModel(strName: "Stephan Blarrisk", strDesignation: "", strDesignationInfo: "Senior vice President, Marketing CRYOBOT SYSTEMS", strInfo: "The biggest slap to your enemies is your success.", isBookmarked: false, img: #imageLiteral(resourceName: "rectangle-3-3_2x")),
            ProfileModel(strName: "Toby Snow", strDesignation: "COMMITTE MEMBER", strDesignationInfo: "General Manager, SE Asia MASTIFF SPACE MINING", strInfo: "Great people talk about ideas, medium people talk about themselves & small people talk about others.", isBookmarked: false, img: #imageLiteral(resourceName: "rectangle-3-2_2x-1"))
        ]),
        SectionModel(strScreenName: "A WING", strSectionName: "103", arrProfile: [
            ProfileModel(strName: "Margaret Brown", strDesignation: "", strDesignationInfo: "", strInfo: "", isBookmarked: false, img: #imageLiteral(resourceName: "rectangle-3-5_2x")),
            ProfileModel(strName: "Keith Samuels", strDesignation: "", strDesignationInfo: "Senior Faculty \nST DRUID COLLEGE", strInfo: "", isBookmarked: false, img: #imageLiteral(resourceName: "rectangle-3-6_2x"))
        ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func btnBookmarkAction(sender: UIButton) {
        guard let cell = sender.superview?.superview?.superview as? ProfileTableViewCell else {
            return // or fatalError() or whatever
        }

        let indexPath = tblView.indexPath(for: cell)
        
        arrSections[indexPath!.section].arrProfile[indexPath!.row].isBookmarked = !arrSections[indexPath!.section].arrProfile[indexPath!.row].isBookmarked

        if arrSections[indexPath!.section].arrProfile[indexPath!.row].isBookmarked {
            
            var skip = false
            
            for (index,value) in BookmarkModel.sharedInstance.arrSections.enumerated() {
                if value.strSectionName == arrSections[indexPath!.section].strSectionName {
                    
                    skip = true
                    BookmarkModel.sharedInstance.setarrValue(index: index, profile: ProfileModel(strName: arrSections[indexPath!.section].arrProfile[indexPath!.row].strName, strDesignation: arrSections[indexPath!.section].arrProfile[indexPath!.row].strDesignation, strDesignationInfo: arrSections[indexPath!.section].arrProfile[indexPath!.row].strDesignationInfo, strInfo: arrSections[indexPath!.section].arrProfile[indexPath!.row].strInfo, isBookmarked: arrSections[indexPath!.section].arrProfile[indexPath!.row].isBookmarked, img: arrSections[indexPath!.section].arrProfile[indexPath!.row].img))
                                        
                    break
                }
            }
            
            if !skip {
                BookmarkModel.sharedInstance.arrSections.append(SectionModel(strScreenName: arrSections[indexPath!.section].strScreenName, strSectionName: arrSections[indexPath!.section].strSectionName, arrProfile: [
                    ProfileModel(strName: arrSections[indexPath!.section].arrProfile[indexPath!.row].strName, strDesignation: arrSections[indexPath!.section].arrProfile[indexPath!.row].strDesignation, strDesignationInfo: arrSections[indexPath!.section].arrProfile[indexPath!.row].strDesignationInfo, strInfo: arrSections[indexPath!.section].arrProfile[indexPath!.row].strInfo, isBookmarked: arrSections[indexPath!.section].arrProfile[indexPath!.row].isBookmarked, img: arrSections[indexPath!.section].arrProfile[indexPath!.row].img),
                ]))
            }
        }
        else {
            
            for (index,value) in BookmarkModel.sharedInstance.arrSections.enumerated() {
                if value.strSectionName == arrSections[indexPath!.section].strSectionName {
                    
                    for (innerIndex, innerValue) in value.arrProfile.enumerated() {
                        if innerValue.strName == arrSections[indexPath!.section].arrProfile[indexPath!.row].strName {
                            
                            BookmarkModel.sharedInstance.removearrValue(index: innerIndex, sectionIndex: index)

                        }
                    }
                    
                                        
                    break
                }
            }
        }
        
        tblView.reloadData()
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSections.count
    }
    
    
    /**
     * Tableview delegate method used to return number of rows
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSections[section].arrProfile.count
    }
    
    /**
     * Tableview delegate method used to return row/cell
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell

        //To remove seprator from particular cell
        cell.selectionStyle = .none

        cell.imgProfile.image = arrSections[indexPath.section].arrProfile[indexPath.row].img
        cell.lblName.text = arrSections[indexPath.section].arrProfile[indexPath.row].strName
        cell.lblDesignation.text = arrSections[indexPath.section].arrProfile[indexPath.row].strDesignation
        cell.lblDesignationInfo.text = arrSections[indexPath.section].arrProfile[indexPath.row].strDesignationInfo
        cell.lblInfo.text = arrSections[indexPath.section].arrProfile[indexPath.row].strInfo
        
        cell.btnBookmark.addTarget(self, action: #selector(btnBookmarkAction(sender:)), for: .touchUpInside)
        
        if arrSections[indexPath.section].arrProfile[indexPath.row].isBookmarked {
            
            cell.btnBookmark.setBackgroundImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            cell.btnBookmark.tintColor = UIColor(red: 0.0/255.0, green: 171.0/255.0, blue: 108.0/255.0, alpha: 1.0)
        }
        else {
            cell.btnBookmark.setBackgroundImage(UIImage(systemName: "bookmark"), for: .normal)
            cell.btnBookmark.tintColor = .lightGray
        }
        
        if indexPath.row == arrSections[indexPath.section].arrProfile.count - 1 {
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
        lbl.text = arrSections[section].strSectionName
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
