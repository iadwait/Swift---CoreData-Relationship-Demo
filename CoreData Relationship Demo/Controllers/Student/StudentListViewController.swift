//
//  StudentListViewController.swift
//  CoreData Relationship Demo
//
//  Created by Adwait Barkale on 13/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableStudentList: UITableView!
    
    var arrStudentData = [Student]()
    var collegeData: College?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableStudentList.delegate = self
        tableStudentList.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //arrStudentData = DatabaseHelper.shared.getAllStudentData()
        if collegeData?.students?.allObjects != nil{
            arrStudentData = collegeData?.students?.allObjects as! [Student]
        }
        tableStudentList.reloadData()
    }

    @IBAction func btnAddStudentTapped(_ sender: UIBarButtonItem) {
        let studentStoryboard = UIStoryboard(name: "Student", bundle: nil)
        let formVC = studentStoryboard.instantiateViewController(withIdentifier: "StudentFormViewController") as! StudentFormViewController
        formVC.collegeData = collegeData
        navigationController?.pushViewController(formVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableStudentList.dequeueReusableCell(withIdentifier: "StudentListViewCell") as! StudentListViewCell
        let data = arrStudentData[indexPath.row]
        cell.lblStudName.text = "Name - \(data.name ?? "N/A")"
        cell.lblStudEmail.text = "Email - \(data.email ?? "N/A")"
        cell.lblStudMobile.text = "Mobile - \(data.mobile ?? "N/A")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 99
    }
    
}
