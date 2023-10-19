//
//  CollegeDetailTableViewController.swift
//  CoreDataRelationShipTutorial
//
//  Created by yapapp on 18/10/23.
//

import UIKit

class CollegeDetailTableViewController: UITableViewController {
    
    
    @IBOutlet weak var collegeNameLbl: UILabel!
    @IBOutlet weak var collegeAddressLbl: UILabel!
    @IBOutlet weak var collegeCityLbl: UILabel!
    @IBOutlet weak var collegeUniversityLbl: UILabel!
    
    var collegeDetail:College?
    var indexRow = Int()
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        collegeNameLbl.text = collegeDetail?.name ?? ""
        collegeAddressLbl.text = collegeDetail?.address ?? ""
        collegeCityLbl.text = collegeDetail?.city ?? ""
        collegeUniversityLbl.text = collegeDetail?.university ?? ""
    }
    

    @IBAction func btnEditClick(_ sender: UIBarButtonItem) {
        let formVC = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController")as! CollegeFormViewController
        formVC.isUpdate = true
        formVC.collegeDetails = collegeDetail
        formVC.indexRow = indexRow
        self.navigationController?.pushViewController(formVC, animated: false)
    }
}
