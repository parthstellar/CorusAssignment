//
//  BookmarkModel.swift
//  CorusAssignment
//
//  Created by Apple on 20/07/21.
//

import UIKit

class BookmarkModel: NSObject {

    static var sharedInstance = BookmarkModel()

    var arrSections = [SectionModel]()

    func setarrValue(index: Int, profile: ProfileModel) {
        
        arrSections[index].arrProfile.append(profile)
    }
    
    func removearrValue(index: Int, sectionIndex: Int) {
        
        arrSections[sectionIndex].arrProfile.remove(at: index)
        
        if arrSections[sectionIndex].arrProfile.count == 0 {
            arrSections.remove(at: sectionIndex)
        }
    }

}
