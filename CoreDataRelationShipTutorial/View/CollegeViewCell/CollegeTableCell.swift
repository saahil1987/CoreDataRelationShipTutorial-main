//
//  CollegeTableCell.swift
//  CoreDataRelationShipTutorial
//
//  Created by Saahil Kaushal on 17/10/23.
//

import UIKit

class CollegeTableCell: UITableViewCell {
    
    
    @IBOutlet weak var collegeNameLbl: UILabel!
    @IBOutlet weak var collegeCityLbl: UILabel!
    @IBOutlet weak var collegeUniversityLbl: UILabel!
    @IBOutlet weak var collegeAddressLbl: UILabel!
    
    
    var college:College?{
        didSet{
            collegeNameLbl.text = "Name:\(college?.name ?? "")"
            collegeAddressLbl.text = "Address: \(college?.address ?? "")"
            collegeCityLbl.text = "City :\(college?.city ?? "")"
            collegeUniversityLbl.text = "University :\(college?.university ?? "")"
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
