//
//  CollegeFormViewController.swift
//  CoreData Relationship Demo
//
//  Created by Adwait Barkale on 13/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class CollegeFormViewController: UIViewController {
    
    @IBOutlet weak var txtCollegeName: UITextField!
    @IBOutlet weak var txtCollegeAddress: UITextField!
    @IBOutlet weak var txtCollegeCity: UITextField!
    @IBOutlet weak var txtCollegeUniversity: UITextField!
    @IBOutlet weak var btnSaveOrUpdate: UIButton!
    
    var isUpdate = false
    var index = Int()
    var collegeData: College?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isUpdate == true
        {
            let arrCollegeData = DatabaseHelper.shared.getAllCollegeData()
            txtCollegeName.text = arrCollegeData[index].name
            txtCollegeAddress.text = arrCollegeData[index].address
            txtCollegeCity.text = arrCollegeData[index].city
            txtCollegeUniversity.text = arrCollegeData[index].university
            btnSaveOrUpdate.setTitle("Update", for: .normal)
        }else{
            btnSaveOrUpdate.setTitle("Save", for: .normal)
        }
        
    }
    
    
    @IBAction func btnSaveTapped(_ sender: UIButton) {
        if isUpdate == true
        {
            updateCollegeData()
        }else{
            saveCollegeData()
        }
        navigationController?.popViewController(animated: true)
    }
    
}

//MARK:- Methods
extension CollegeFormViewController{
    
    func saveCollegeData()
    {
        guard let collegeName = txtCollegeName.text else { return }
        guard let collegeAddress = txtCollegeAddress.text else { return }
        guard let collegeCity = txtCollegeCity.text else { return }
        guard let collegeUniversity = txtCollegeUniversity.text else { return }
        
        let collegeDict:[String:String] = [
            "collegeName": collegeName,
            "collegeAddress": collegeAddress,
            "collegeCity": collegeCity,
            "collegeUniversity": collegeUniversity
        ]
        
        DatabaseHelper.shared.saveCollegeData(collegeDict: collegeDict)
    }
    
    func updateCollegeData()
    {
        guard let collegeName = txtCollegeName.text else { return }
        guard let collegeAddress = txtCollegeAddress.text else { return }
        guard let collegeCity = txtCollegeCity.text else { return }
        guard let collegeUniversity = txtCollegeUniversity.text else { return }
        
        let collegeDict:[String:String] = [
            "collegeName": collegeName,
            "collegeAddress": collegeAddress,
            "collegeCity": collegeCity,
            "collegeUniversity": collegeUniversity
        ]
        
        DatabaseHelper.shared.updateData(indexAt: index, collegeData: collegeDict)
    }
    
}
