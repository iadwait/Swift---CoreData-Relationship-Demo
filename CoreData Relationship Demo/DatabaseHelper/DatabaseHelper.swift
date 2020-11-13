//
//  DatabaseHelper.swift
//  CoreData Relationship Demo
//
//  Created by Adwait Barkale on 13/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit
import CoreData

class DatabaseHelper: NSObject {
    
    static let shared = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    //MARK:- College
    //MARK:- Save Data
    func saveCollegeData(collegeDict: [String:String])
    {
        //Get Reference of College Entity
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        //Save Data to College Entity's Attributes
        college.name = collegeDict["collegeName"]
        college.address = collegeDict["collegeAddress"]
        college.city = collegeDict["collegeCity"]
        college.university = collegeDict["collegeUniversity"]
        //Save in Core Data
        do{
            try context.save()
            print("*College Data Save Successfully*\n")
        }catch let err{
            print("Error Saving College Data Object - \(err.localizedDescription)")
        }
    }
    
    //MARK:- Fetch Data
    func getAllCollegeData() -> [College]
    {
        var arrCollegeData = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
            arrCollegeData = try context.fetch(fetchRequest) as! [College]
        }catch let err{
            print("Error Fetching College Data \(err.localizedDescription)")
        }
        
        return arrCollegeData
    }
    
    //MARK:- Delete Data
    func deleteCollegeData(index: Int) -> [College]
    {
        var arrCollegeData = getAllCollegeData() //Get All Data from Core Database and Store in array
        context.delete(arrCollegeData[index]) //Delete Object from Core Data
        //One Way to Locally Show
        //arrCollegeData.remove(at: index)
        //Scond Way to fetch from Database
        arrCollegeData.removeAll() //Clear All Data
        arrCollegeData = getAllCollegeData()//Fetch Updated from Core(Good Practice)
        do{
            try context.save()
            print("Data Deleted Success")
        }catch let err{
            print("Error Deleting College Data - \(err.localizedDescription)")
        }
        return arrCollegeData
    }
    
    //MARK:- Update Data
    func updateData(indexAt: Int,collegeData: [String:String])
    {
        let arrCollegeData = getAllCollegeData()
        arrCollegeData[indexAt].name = collegeData["collegeName"]
        arrCollegeData[indexAt].address = collegeData["collegeAddress"]
        arrCollegeData[indexAt].city = collegeData["collegeCity"]
        arrCollegeData[indexAt].university = collegeData["collegeUniversity"]
        
        do{
            try context.save()
        }catch let err{
            print("Error Updating Data - \(err.localizedDescription)")
        }
    }
    
    //MARK:- Student
    
    //MARK:- Save Data
    func saveStudentData(studentDict: [String:String],college: College)
    {
        //Get Reference of College Entity
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        //Save Data to College Entity's Attributes
        student.name = studentDict["studentName"]
        student.email = studentDict["studentEmail"]
        student.mobile = studentDict["studentMobile"]
        student.university = college
        
        //Save in Core Data
        do{
            try context.save()
            print("*Student Data Save Successfully*\n")
        }catch let err{
            print("Error Saving Student Data Object - \(err.localizedDescription)")
        }
    }
    
     //MARK:- Fetch Data
       func getAllStudentData() -> [Student]
       {
           var arrStudentData = [Student]()
           let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
           do{
               arrStudentData = try context.fetch(fetchRequest) as! [Student]
           }catch let err{
               print("Error Fetching Student Data \(err.localizedDescription)")
           }
           
           return arrStudentData
       }
    
}
