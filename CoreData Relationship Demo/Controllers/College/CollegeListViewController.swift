//
//  CollegeListViewController.swift
//  CoreData Relationship Demo
//
//  Created by Adwait Barkale on 13/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class CollegeListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableCollegeList: UITableView!
    
    var arrCollegeData = [College]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableCollegeList.delegate = self
        tableCollegeList.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        arrCollegeData = DatabaseHelper.shared.getAllCollegeData()
        //Reload TableView To Update Data (TableView is not reloaded automatically when we come back to this page)
        tableCollegeList.reloadData()
    }
    
    @IBAction func btnAddCollegeTapped(_ sender: UIBarButtonItem) {
        let nextVC = storyboard?.instantiateViewController(identifier: "CollegeFormViewController") as! CollegeFormViewController
        nextVC.isUpdate = false
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCollegeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableCollegeList.dequeueReusableCell(withIdentifier: "CollegeListViewCell") as! CollegeListViewCell
        let collegeData = arrCollegeData[indexPath.row]
        cell.lblCollegeName.text = "Name - \(collegeData.name ?? "N/A")"
        cell.lblCollegeAddress.text = "Address - \(collegeData.address ?? "N/A")"
        cell.lblCollegeUniversity.text = "University - \(collegeData.university ?? "N/A")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 97
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //Delete That particular row from core data and reload data
            arrCollegeData = DatabaseHelper.shared.deleteCollegeData(index: indexPath.row)
            tableCollegeList.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "CollegeDetailsViewController") as! CollegeDetailsViewController
        detailVC.collegeData = arrCollegeData[indexPath.row]
        detailVC.index = indexPath.row
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
