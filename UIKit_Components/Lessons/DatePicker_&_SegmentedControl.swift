//
//  DatePicker_&_SegmentedControl.swift
//  UIKit_Components
//
//  Created by Nurbek on 07/12/23.
//

import UIKit

class DatePicker___SegmentedControl: UIViewController {

    lazy var textField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Select a Date"
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.textAlignment = .center
        
        return textField
    }()
    
    lazy var date: UIDatePicker = {
        let date = UIDatePicker()
        
        date.datePickerMode = .time
        date.preferredDatePickerStyle = .wheels
        date.locale = Locale(identifier: "en_GB")
        date.minimumDate = Calendar.current.date(from: DateComponents(year: 2020))!
        date.maximumDate = .none
        
        return date
    }()
    
//  ---------------------------------------------  //
    
    lazy var segmentedView: UISegmentedControl = {
        let segmentedView = UISegmentedControl()
        
        segmentedView.insertSegment(withTitle: "FirstView", at: 0, animated: true)
        segmentedView.insertSegment(withTitle: "SecondView", at: 1, animated: true)
        segmentedView.insertSegment(withTitle: "ThirdView", at: 2, animated: true)
        segmentedView.selectedSegmentIndex = 0
        segmentedView.backgroundColor = .systemBlue
        segmentedView.selectedSegmentTintColor = .white
        
        return segmentedView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        textField.inputView = date
        
        [textField, segmentedView, ].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        layout()
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 60),
            
            segmentedView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
            segmentedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentedView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    
    
//  ---------------------------------------------------------------------------------------------  //
    
    
    /*
     
     
     
     lazy var textField: UITextField = {
         let textField = UITextField()
         
         textField.placeholder = "Date and Time"
         textField.textAlignment = .center
         textField.layer.borderColor = UIColor.gray.cgColor
         textField.layer.borderWidth = 1
         textField.layer.cornerRadius = 8
         
         return textField
     }()
     
     lazy var yearField: UITextField = {
         let textField = UITextField()
         
         textField.placeholder = "Year"
         textField.textAlignment = .center
         textField.layer.borderColor = UIColor.gray.cgColor
         textField.layer.borderWidth = 1
         textField.layer.cornerRadius = 8
         textField.isEnabled = false
         
         return textField
     }()
     
     lazy var monthField: UITextField = {
         let textField = UITextField()
         
         textField.placeholder = "Month"
         textField.textAlignment = .center
         textField.layer.borderColor = UIColor.gray.cgColor
         textField.layer.borderWidth = 1
         textField.layer.cornerRadius = 8
         textField.isEnabled = false
         
         return textField
     }()
     
     lazy var weekField: UITextField = {
         let textField = UITextField()
         
         textField.placeholder = "Week"
         textField.textAlignment = .center
         textField.layer.borderColor = UIColor.gray.cgColor
         textField.layer.borderWidth = 1
         textField.layer.cornerRadius = 8
         textField.isEnabled = false
         
         return textField
     }()
     
     lazy var dayField: UITextField = {
         let textField = UITextField()
         
         textField.placeholder = "Day"
         textField.textAlignment = .center
         textField.layer.borderColor = UIColor.gray.cgColor
         textField.layer.borderWidth = 1
         textField.layer.cornerRadius = 8
         textField.isEnabled = false
         
         return textField
     }()
     
     lazy var datePicker: UIDatePicker = {
         let datePicker = UIDatePicker()
         
         datePicker.datePickerMode = .date
         datePicker.preferredDatePickerStyle = .inline
         datePicker.minimumDate = Calendar.current.date(from: DateComponents(year: 2022))!
         datePicker.maximumDate = .none
         
         datePicker.addTarget(self, action: #selector(dateClicked), for: .valueChanged)
         
         return datePicker
     }()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         
         textField.inputView = datePicker
         
         [textField, yearField, monthField, weekField, dayField].forEach { item in
             view.addSubview(item)
             item.translatesAutoresizingMaskIntoConstraints = false
         }
         
         layout()
     }
     
     func layout() {
         NSLayoutConstraint.activate([
             textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             textField.heightAnchor.constraint(equalToConstant: 50),
             
             yearField.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
             yearField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             yearField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             yearField.heightAnchor.constraint(equalToConstant: 50),
             
             monthField.topAnchor.constraint(equalTo: yearField.bottomAnchor, constant: 15),
             monthField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             monthField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             monthField.heightAnchor.constraint(equalToConstant: 50),
             
             weekField.topAnchor.constraint(equalTo: monthField.bottomAnchor, constant: 15),
             weekField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             weekField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             weekField.heightAnchor.constraint(equalToConstant: 50),
             
             dayField.topAnchor.constraint(equalTo: weekField.bottomAnchor, constant: 15),
             dayField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             dayField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             dayField.heightAnchor.constraint(equalToConstant: 50),
         ])
     }
     
     @objc func dateClicked() {
         let datePicked = datePicker.date
         let calendar = Calendar.current
         let format = DateFormatter()
         
         let year = calendar.component(.year, from: datePicked)
         format.dateFormat = "MMMM"
         let month = format.string(from: datePicked)
         format.dateFormat = "EEEE"
         let week = format.string(from: datePicked)
         let day = calendar.component(.day, from: datePicked)
         
         yearField.text = String(year)
         monthField.text = String(month)
         weekField.text = String(week)
         dayField.text = String(day)
     }
     
     
     
     */
    
    
    
    
//  ---------------------------------------------------------------------------------------------  //
    
    
    /*
     
     
     
     lazy var bathroom: UILabel = {
         let bathroom = UILabel()
         
         bathroom.text = "Bathroom"
         
         return bathroom
     }()
     
     lazy var segment: UISegmentedControl = {
         let segment = UISegmentedControl()
         
         segment.insertSegment(withTitle: "Shared", at: 0, animated: true)
         segment.insertSegment(withTitle: "Single", at: 1, animated: true)
         segment.selectedSegmentIndex = 0
         segment.selectedSegmentTintColor = .black
         segment.backgroundColor = .systemGray5
         segment.tintColor = .white
         
         
         segment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
         segment.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
         
 //        segment.clipsToBounds = true
 //        segment.layer.masksToBounds = true
 //        segment.layer.cornerRadius = 20
 //        segment.layer.borderWidth = 2
 //        segment.layer.borderColor = UIColor.blue.cgColor
         
         return segment
     }()
     
 //  ------------------------------------------------------------------------------------------  //
     
     lazy var segmentTitle: UISegmentedControl = {
         let segment = UISegmentedControl()
         
         segment.insertSegment(withTitle: "Morning", at: 0, animated: true)
         segment.insertSegment(withTitle: "Noon", at: 1, animated: true)
         segment.insertSegment(withTitle: "Evening", at: 2, animated: true)
         segment.selectedSegmentIndex = 2
         segment.layer.borderColor = UIColor.black.cgColor
         segment.layer.borderWidth = 1
         segment.backgroundColor = .systemGray5
         segment.selectedSegmentTintColor = .black
         
         segment.setTitleTextAttributes([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .normal)
         segment.setTitleTextAttributes([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)
         
         let container = UIView()
         segment.translatesAutoresizingMaskIntoConstraints = false
         container.addSubview(segment)
         container.backgroundColor = .red
         container.layer.cornerRadius = 20
         container.layer.masksToBounds = true
         
         NSLayoutConstraint.activate([
             segment.leadingAnchor.constraint(equalTo: container.leadingAnchor),
             segment.trailingAnchor.constraint(equalTo: container.trailingAnchor),
             segment.bottomAnchor.constraint(equalTo: container.bottomAnchor),
             segment.topAnchor.constraint(equalTo: container.topAnchor),
         ])
         
         return segment
     }()
     
     lazy var segmentIcon: UISegmentedControl = {
         let segment = UISegmentedControl()
         
         segment.insertSegment(with: UIImage(systemName: "square", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), at: 0, animated: true)
         segment.insertSegment(with: UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), at: 1, animated: true)
         segment.insertSegment(with: UIImage(systemName: "triangle", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), at: 2, animated: true)
         segment.selectedSegmentIndex = 0
         segment.layer.borderColor = UIColor.black.cgColor
         segment.layer.borderWidth = 1
         segment.backgroundColor = .systemGray5
         segment.selectedSegmentTintColor = .black
         
         segment.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
         segment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
         
         return segment
     }()
     
 //  ------------------------------------------------------------------------------------------  //
     
     lazy var segmentTitle2: UISegmentedControl = {
         let segment = UISegmentedControl()
         
         segment.insertSegment(withTitle: "Morning", at: 0, animated: true)
         segment.insertSegment(withTitle: "Noon", at: 1, animated: true)
         segment.insertSegment(withTitle: "Evening", at: 2, animated: true)
         segment.selectedSegmentIndex = 2
         segment.layer.borderColor = UIColor.appDark.cgColor
         segment.layer.borderWidth = 1
         segment.backgroundColor = .appLight
         segment.selectedSegmentTintColor = .appDark
         
         segment.setTitleTextAttributes([.foregroundColor: UIColor.appDark, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .normal)
         segment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
         
         return segment
     }()
     
     lazy var segmentIcon2: UISegmentedControl = {
         let segment = UISegmentedControl()
         
         segment.insertSegment(with: UIImage(systemName: "square", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), at: 0, animated: true)
         segment.insertSegment(with: UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), at: 1, animated: true)
         segment.insertSegment(with: UIImage(systemName: "triangle", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), at: 2, animated: true)
         segment.selectedSegmentIndex = 0
         segment.layer.borderColor = UIColor.appDark.cgColor
         segment.layer.borderWidth = 1
         segment.backgroundColor = .appLight
         segment.selectedSegmentTintColor = .appDark
         
         segment.setTitleTextAttributes([.foregroundColor: UIColor.appDark, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .normal)
         segment.setTitleTextAttributes([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)
         
         return segment
     }()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         
         [bathroom, segment, segmentTitle, segmentIcon, segmentTitle2, segmentIcon2].forEach { item in
             view.addSubview(item)
             item.translatesAutoresizingMaskIntoConstraints = false
         }
         
         layout()
     }
     
     func layout() {
         NSLayoutConstraint.activate([
             bathroom.bottomAnchor.constraint(equalTo: segment.topAnchor, constant: -5),
             bathroom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             
             segment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
             segment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             segment.widthAnchor.constraint(equalToConstant: 160),
             segment.heightAnchor.constraint(equalToConstant: 40),
             
             segmentTitle.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 50),
             segmentTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             segmentTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             segmentTitle.heightAnchor.constraint(equalToConstant: 40),
             
             segmentIcon.topAnchor.constraint(equalTo: segmentTitle.bottomAnchor, constant: 15),
             segmentIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             segmentIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             segmentIcon.heightAnchor.constraint(equalToConstant: 40),
             
             segmentTitle2.topAnchor.constraint(equalTo: segmentIcon.bottomAnchor, constant: 50),
             segmentTitle2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             segmentTitle2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             segmentTitle2.heightAnchor.constraint(equalToConstant: 40),
             
             segmentIcon2.topAnchor.constraint(equalTo: segmentTitle2.bottomAnchor, constant: 15),
             segmentIcon2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             segmentIcon2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             segmentIcon2.heightAnchor.constraint(equalToConstant: 40),
         ])
     }
     
     
     
     */
    
    
    
}
