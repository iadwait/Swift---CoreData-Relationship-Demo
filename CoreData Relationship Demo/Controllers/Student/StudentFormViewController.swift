//
//  StudentFormViewController.swift
//  CoreData Relationship Demo
//
//  Created by Adwait Barkale on 13/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class StudentFormViewController: UIViewController {

    @IBOutlet weak var txtStudName: UITextField!
    @IBOutlet weak var txtStudEmail: UITextField!
    @IBOutlet weak var txtStudPhone: UITextField!
    
    var collegeData: College?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func btnSaveTapped(_ sender: UIButton) {
        saveData()
    }
    
}

extension StudentFormViewController{
    
    func saveData()
    {
        guard let studName = txtStudName.text else { return }
        guard let studEmail = txtStudEmail.text else { return }
        guard let studMobile = txtStudPhone.text else { return }
        guard let college = collegeData else { return }
        
        let studentDict:[String:String] = [
            "studentName": studName,
            "studentEmail": studEmail,
            "studentMobile": studMobile
        ]
        
        DatabaseHelper.shared.saveStudentData(studentDict: studentDict, college: college)
        
        navigationController?.popViewController(animated: true)
    }
    
}
