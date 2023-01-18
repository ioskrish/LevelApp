//
//  HomeController.swift
//  Level App
//
//  Created by TryCatch Classes on 17/01/23.
//

import UIKit

class HomeController: UIViewController {
    
    // model
    private let GoalData = Data1.getData()
    private let ActivityData = Data2.getData()
    
    //Stack1 components
    @IBOutlet weak var Stack1: UIStackView!
    @IBOutlet weak var ProfileView: UIView!
    @IBOutlet weak var LevelStaticView: UIView!
    @IBOutlet weak var ProgressView: UIView!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    //ScrollingView
    @IBOutlet weak var ScrollingStack: UIStackView!
    
    //Premium View
    @IBOutlet weak var ExploreView: UIView!
    @IBOutlet weak var ExploreBtnStack: UIStackView!
    
    //Main Scrolling Stack1
    @IBOutlet weak var CollectionStack1: UIStackView!
    @IBOutlet weak var NormalHeader: UIView!
    @IBOutlet weak var GoalView: UIView!
    @IBOutlet weak var Collect1: UICollectionView!
    
    //Main Scrolling Stack1
    @IBOutlet weak var CollectionStack2: UIStackView!
    @IBOutlet weak var NormalHeader2: UIView!
    @IBOutlet weak var ActivityView: UIView!
    @IBOutlet weak var Collect2: UICollectionView!
    
    // custom colors
    let color = UIColor(rgb: 0x4898D8).cgColor
    let border = UIColor(rgb: 0xFFFFFF).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        //Collection-View
        Collect1.dataSource = self
        Collect1.delegate = self
        
        Collect2.dataSource = self
        Collect2.delegate = self
        
        // UI Properties
        ExploreView.layer.cornerRadius = 15
        ExploreView.layer.borderWidth = 3
        ExploreView.layer.borderColor = border
        ExploreBtnStack.layer.cornerRadius = 10
        ExploreBtnStack.layer.borderWidth = 1
        ExploreBtnStack.layer.borderColor = border
        
        ProfileView.layer.borderWidth = 2
        ProfileView.layer.borderColor = color
        ProfileView.layer.cornerRadius = 10
        LevelStaticView.layer.borderWidth = 2
        LevelStaticView.layer.borderColor = color
        LevelStaticView.layer.cornerRadius = 10
        ProgressView.layer.cornerRadius = 10
        ProgressView.layer.borderWidth = 2
        ProgressView.layer.borderColor = color
        ProgressBar.layer.cornerRadius = 15
        ProgressBar.clipsToBounds = true
        
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == Collect1) {
            return GoalData.count
        }
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == Collect1){
            let cell = Collect1.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell1
            cell.backImg.image = UIImage(named: String(GoalData[indexPath.item].Background!))
            cell.title.text = GoalData[indexPath.item].title
            cell.task.text = GoalData[indexPath.item].task
            cell.mentor.text = GoalData[indexPath.item].mentor
            cell.XP.text = GoalData[indexPath.item].XP
            cell.time.text = GoalData[indexPath.item].min
            
            if (indexPath.item == 1){
                cell.coach.text = " "
            }
            
            cell.layer.cornerRadius = 15
            cell.layer.borderWidth = 3
            cell.layer.borderColor = border
            return cell
        }
        let cell = Collect2.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell2
        cell.backImg.image = UIImage(named: String(ActivityData[indexPath.item].Background!))
        cell.title.text = ActivityData[indexPath.item].title
        cell.task.text = ActivityData[indexPath.item].task
        cell.XP.text = ActivityData[indexPath.item].XP
        cell.time.text = ActivityData[indexPath.item].min
        
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 3
        cell.layer.borderColor = border
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == Collect1){
            let width = ((collectionView.frame.width - 12) / 1)
            let height = ((collectionView.frame.height - 2) / 1)
            
            return CGSize(width: width, height: height)
        }
        let width = ((collectionView.frame.width - 2) / 1)
        let height = ((collectionView.frame.height - 2) / 1)
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if(collectionView == Collect1){
            return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        }
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if(collectionView == Collect1){
            return 10
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == Collect1){
            let move = storyboard?.instantiateViewController(withIdentifier: "ReminderController") as!  ReminderController
            move.header = GoalData[indexPath.item].title!
            move.body = GoalData[indexPath.item].task!
            self.navigationController?.pushViewController(move, animated: true)
        }
    }
}

//extension for using customized colors
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
