//
//  ViewController.swift
//  GPAIkram
//
//  Created by cstech on 2/8/18.
//  Copyright © 2018 cstech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //1. OUTLETS
    //App Title: ImageView
    @IBOutlet weak var TitleGPA: UIImageView!
    
    //Grey Container: View
    @IBOutlet weak var GreyView: UIView!
    
    //Buttons
    @IBOutlet weak var AddCourseB: UIButton!
    
    //Labels
    @IBOutlet weak var TitleCourseL: UILabel!
    @IBOutlet weak var AssTypeL: UILabel!
    @IBOutlet weak var AssL: UILabel!
    @IBOutlet weak var Midterm: UILabel!
    @IBOutlet weak var FinalL: UILabel!
    @IBOutlet weak var DeleteCourseL: UILabel!
    
    var ArrCourseLabelsGroup = [UILabel]()
    @IBOutlet weak var Course1L: UILabel!
    @IBOutlet weak var Course2L: UILabel!
    @IBOutlet weak var Course3L: UILabel!
    @IBOutlet weak var Course4L: UILabel!
   
    804 828 7233
    //Text Fileds
    @IBOutlet weak var TitleCourseTF: UITextField!
    @IBOutlet weak var CreditL: UILabel!
    @IBOutlet weak var C13: UITextField!
    @IBOutlet weak var C12: UITextField!
    @IBOutlet weak var C11: UITextField!
    @IBOutlet weak var C21: UITextField!
    @IBOutlet weak var C22: UITextField!
    @IBOutlet weak var C23: UITextField!
    @IBOutlet weak var C31: UITextField!
    @IBOutlet weak var C32: UITextField!
    @IBOutlet weak var C33: UITextField!
    @IBOutlet weak var CreditTF: UITextField!
    @IBOutlet weak var DeleteCourseTF: UITextField!
    
    //ChalkBoard: ImageView
    @IBOutlet weak var ChackBoardImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ArrCourseLabelsGroup = [Course1L, Course2L, Course3L, Course4L]
        // Do any additional setup after loading the view, typically from a nib.
    }
    // closes the keyboard when return pressed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }   
    var ArrTitle_course = [String]() //Empty Array
    var count: Int = 0 //if count==4, display error
    var total_credits: Int = 0 //4 4 3 (11)
    var letterGrade = "j"
    var grade: Double = 0.0
    var GPA: Double = 0.0
    
    //2. ACTIONS
    //1-Saving title of course from text field
    @IBAction func addCourse(_ sender: UIButton) {
        
        //1~Append Course to our list
        ArrTitle_course.append(TitleCourseTF.text!)
        count+=1;
        
        //2~Check if input is correct
        if let P11 = Double(C11.text!), let P21 = Double(C21.text!), let P31 = Double(C31.text!), let M12 = Double(C12.text!), let M22 = Double(C22.text!), let M32 = Double(C32.text!), let Per13 = Double(C13.text!), let Per23 = Double(C23.text!), let Per33 = Double(C33.text!), let course_credit = Int(CreditTF.text!){
            
            //-Calculate Course Grade and LetterGrade
            grade = P11/M12*Per13 + P21/M22*Per23 + P31/M32*Per33
            letterGrade = "j"
            
            switch(grade){
            case 90...100:
                letterGrade = "A"
            case 80...89.9:
                letterGrade = "B"
            case 70...79.9:
                letterGrade = "C"
            case 60...69.9:
                letterGrade = "D"
            default:
                letterGrade = "F"
            }
            
            //-Calculate GPA
            total_credits+=course_credit
            GPA+=grade * Double(course_credit/100)
            
            displayOnChalkBoard(letterGrade, TitleCourseTF.text!)
        }
    }
    
    //3. Functions
    func displayOnChalkBoard(_ letter_grade: String, _ titlecourse: String){
        ArrCourseLabelsGroup[count-1].text = "\(count) -  \(titlecourse): \(letter_grade)"
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

