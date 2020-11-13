//
//  CollegeDetailsViewController.swift
//  CoreData Relationship Demo
//
//  Created by Adwait Barkale on 13/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class CollegeDetailsViewController: UITableViewController {
    
    @IBOutlet weak var lblCollegeName: UILabel!
    @IBOutlet weak var lblCollegeAddress: UILabel!
    @IBOutlet weak var lblCollegeCity: UILabel!
    @IBOutlet weak var lblCollegeUniversity: UILabel!
    
    var collegeData: College? //Receive College Data of respective Object
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let arrCollegeData = DatabaseHelper.shared.getAllCollegeData()
        lblCollegeName.text = arrCollegeData[index].name
        lblCollegeAddress.text = arrCollegeData[index].address
        lblCollegeCity.text = arrCollegeData[index].city
        lblCollegeUniversity.text = arrCollegeData[index].university
    }
    
    @IBAction func btnEditDetailsTapped(_ sender: UIBarButtonItem) {
        let updateVC = storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        updateVC.isUpdate = true
        updateVC.collegeData = collegeData
        updateVC.index = index
        navigationController?.pushViewController(updateVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            let studentStoryboard = UIStoryboard(name: "Student", bundle: nil)
            let studListVC = studentStoryboard.instantiateViewController(withIdentifier: "StudentListViewController") as! StudentListViewController
            studListVC.collegeData = collegeData
            navigationController?.pushViewController(studListVC, animated: true)
        }
    }
    
}
