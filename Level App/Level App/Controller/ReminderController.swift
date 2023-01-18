//
//  ReminderController.swift
//  Level App
//
//  Created by Trycatch Classes on 18/01/23.
//

import UIKit
import UserNotifications

class ReminderController: UIViewController {
    
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var task1: UILabel!
    @IBOutlet weak var remindbtn: UIButton!
    @IBOutlet weak var remindView: UIView!
    @IBOutlet weak var remindImg: UIImageView!
    @IBOutlet weak var TimezoneSelector: UIDatePicker!
    
    let border = UIColor(rgb: 0xFFFFFF).cgColor
    
    //Variables For Data Passing
    var header = " "
    var body = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Data passing
        title1.text = header
        task1.text = body
        
        // UI-Components Properties
        remindView.layer.cornerRadius = 15
        remindView.layer.borderWidth = 3
        remindView.layer.borderColor = border
        
        remindbtn.layer.cornerRadius = 15
        remindbtn.layer.borderWidth = 1
        remindbtn.layer.borderColor = border
        
        Animation()
    }
    
    //Image Animation
    func Animation(){
        let newButtonWidth: CGFloat = 60
        UIView.animate(withDuration: 25.0, //1
                       delay: 0.0, //2
                       usingSpringWithDamping: 0.5, //3
                       initialSpringVelocity: 2, //4
                       options: UIView.AnimationOptions.curveEaseInOut, //5
                       animations: ({ //6
            self.remindImg.frame = CGRect(x: 0, y: 0, width: newButtonWidth, height: newButtonWidth)
            self.remindImg.center = self.view.center
        }), completion: nil)
    }
    
    //Back Navigation
    @IBAction func Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Local UserNotification
    @IBAction func setReminder(_ sender: UIButton){
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Here there! Level Here"
        content.body = "This is a Reminder to complete your Task"
        content.sound = .default
        
        let fireDate = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: self.TimezoneSelector.date.addingTimeInterval(5))
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        let request = UNNotificationRequest(identifier: "Reminder", content: content, trigger: trigger)
        center.add(request) { (error) in
            if error != nil {
                print("Error = \(error?.localizedDescription ?? "error local notification")")
            }
        }
    }
}

