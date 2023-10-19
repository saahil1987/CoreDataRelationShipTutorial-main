//
//  CollegeFormViewController.swift
//  CoreDataRelationShipTutorial
//
//  Created by Saahil Kaushal on 17/10/23.
//

import UIKit

class CollegeFormViewController: UIViewController {
   
    
    @IBOutlet weak var collegeName: UITextField!
    @IBOutlet weak var collegeAddress: UITextField!
    @IBOutlet weak var collegeCity: UITextField!
    @IBOutlet weak var collegeUniversity: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    
    
    
    var isUpdate = false
    var indexRow = Int()
    
    var collegeDetails:College?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collegeName.text = collegeDetails?.name
        self.collegeAddress.text = collegeDetails?.address
        self.collegeCity.text = collegeDetails?.city
        self.collegeUniversity.text = collegeDetails?.university
    
    }
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate{
            btnSave.setTitle("Update", for: .normal)
        }else{
            btnSave.setTitle("Save", for: .normal)
        }
    }
    @IBAction func collegeSaveBtn(_ sender: UIButton) {
        self.collegeSaveData()
        self.navigationController?.popViewController(animated: true)
    }
   
    

}
extension CollegeFormViewController{
    func collegeSaveData(){
        guard let collegeName = collegeName.text else{return}
        guard let collegeAddress = collegeAddress.text else{return}
        guard let collegeCity = collegeCity.text else {return}
        guard let collegeUniversity = collegeUniversity.text else {return}
        
        let collegeDict = ["collegeName": collegeName,"collegeAddress":collegeAddress,"collegeCity":collegeCity,"collegeUniversity":collegeUniversity]
        if isUpdate{
            DatabaseHelper.shareInstance.editCollegeData(collegeDict: collegeDict, index: indexRow)
            isUpdate = false
        }else{
            DatabaseHelper.shareInstance.saveCollegeData(collegeDict: collegeDict)
        }
        
    }
    
}
