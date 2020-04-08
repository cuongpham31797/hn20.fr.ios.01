//
//  ViewController.swift
//  TableVIew_PickerVIew_DateTime
//
//  Created by Cuong  Pham on 4/7/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    private var titleArray : Array<String> = ["24-Hour-Time", "Set Automatically", "Time Zone"]
    private var day : Int?
    private var month : String?
    private var year : Int?
    private var minute : Int?
    private var hour : Int?
    private var locale : String?  //hiển thị AM/PM
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datePicker.isHidden = true
        self.setUpTableView()
        navigationItem.title = "Date & Time"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        setUpDateTime(date: Date())
    }
    
    private func setUpTableView(){
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(FirstTypeCell.self)
        mainTableView.register(SecondTypeCell.self)
        mainTableView.register(ThirdTypeCell.self)
        mainTableView.bounces = false
        mainTableView.tableFooterView = UIView()
    }
    
    @IBAction func chooseDateTime(_ sender: UIDatePicker) {
        setUpDateTime(date: self.datePicker.date)
        self.mainTableView.reloadData()
        DispatchQueue.main.async {
            self.mainTableView.viewWithTag(1000)?.isHidden = false
        }
    }
    
    private func setUpDateTime(date : Date){
        let date = date
        let components = NSCalendar.current.dateComponents([.day,.month,.year, .hour, .minute],from: date)
        guard let day = components.day, let month = components.month, let year = components.year, let hour = components.hour, let minute = components.minute else { return }
        let formatter = DateFormatter()
        formatter.dateFormat = "a"
        let formatteddate = formatter.string(from: date)
        self.locale = formatteddate
        self.hour = hour
        self.minute = minute
        self.day = day
        switch month {
        case 1:
            self.month = "Jan"
        case 2:
            self.month = "Feb"
        case 3:
            self.month = "Mar"
        case 4:
            self.month = "Apr"
        case 5:
            self.month = "May"
        case 6:
            self.month = "Jun"
        case 7:
            self.month = "Jul"
        case 8:
            self.month = "Aug"
        case 9:
            self.month = "Sep"
        case 10:
            self.month = "Oct"
        case 11:
            self.month = "Nov"
        case 12:
            self.month = "Dec"
        default:
            self.month = ""
        }
        self.year = year
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            return mainTableView.dequeReuse(type: FirstTypeCell.self, indexPath: indexPath) { (cell) in
                cell.selectionStyle = .none
                cell.delegate = self
                if indexPath.section == 0{
                    cell.mainLabel.text = self.titleArray[indexPath.row]
                    cell.who = 0
                }else{
                    cell.mainLabel.text = self.titleArray[indexPath.row + 1]
                    cell.who = 1
                }
            }
        }else if indexPath.row == 1{
            return mainTableView.dequeReuse(type: SecondTypeCell.self, indexPath: indexPath) { (cell) in
                cell.mainLabel.text = self.titleArray[indexPath.row + 1]
            }
        }else{
            return mainTableView.dequeReuse(type: ThirdTypeCell.self, indexPath: indexPath) { (cell) in                guard let month = self.month, let day = self.day, let year = self.year, let hour = self.hour, let minute = self.minute, let locale = self.locale else { return }
                cell.dateLabel.text = "\(month) \(day), \(year)"
                cell.timeLabel.text = "\(hour):\(minute) \(locale)"
                cell.isHidden = true
                cell.tag = 1000
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            self.datePicker.isHidden = false
        }
    }
}

extension ViewController : SwitchState {
    func changeSwitchState(_ who: Int, state: Bool) {
        if who == 0{
            print("change state of 24 Hour")
        }else{
            if state{
                print("auto on")
                self.datePicker.isHidden = true
                self.mainTableView.viewWithTag(1000)?.isHidden = true
            }else{
                print("auto off")
                self.mainTableView.viewWithTag(1000)?.isHidden = false
            }
        }
    }
}

extension NSObject {
    class var className : String {
        return String(describing: self)
    }
}

extension UITableView {
    func register <T : UITableViewCell>(_ withClass : T.Type){
        self.register(UINib(nibName: T.className, bundle: nil), forCellReuseIdentifier: T.className)
    }
    
    func dequeReuse <T : UITableViewCell>(type : T.Type, indexPath : IndexPath, handle: (T) -> Void) -> UITableViewCell{
        let cell = self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
        handle(cell)
        return cell
    }
}
