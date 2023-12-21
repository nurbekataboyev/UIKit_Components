//
//  Picker_&_Progress.swift
//  UIKit_Components
//
//  Created by Nurbek on 07/12/23.
//

import UIKit

class Picker___Progress: UIViewController {

    
    let cities = ["Toshkent", "Samarqand", "Namangan", "Farg'ona"]
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Search for Cities"
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 8
        
        return textField
    }()
    
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        
//        progressView.setProgress(0.8, animated: true)
        progressView.progressTintColor = .systemBlue
        progressView.trackTintColor = .systemGray3
        progressView.layer.cornerRadius = 8
        progressView.clipsToBounds = true
        
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        pickerView.delegate = self
        pickerView.dataSource = self
        
        textField.inputView = pickerView
        textField.inputAccessoryView = toolBar()
        
        [textField, progressView, ].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        layout()
        timerConfiguration()
    }

    func layout() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            textField.heightAnchor.constraint(equalToConstant: 60),
            
            progressView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 100),
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.widthAnchor.constraint(equalToConstant: 250),
            progressView.heightAnchor.constraint(equalToConstant: 15),
        ])
    }
    
    var timer = Timer()
    
    func timerConfiguration() {
        var progress: Float = 0.0
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { _ in
            if progress < 0.5 {
                progress += 0.001
                self.progressView.progress = progress
                print(progress)
            }
        })
    }
    
    
//  ---------------------------------------------------------------------------------------------  //
    
    
    /*
     
     
     
     lazy var label: UILabel = {
         let label = UILabel()
         
         label.text = "Processing..."
         label.font = .systemFont(ofSize: 20, weight: .semibold)
         
         return label
     }()
     
     lazy var progressView: UIProgressView = {
         let progressView = UIProgressView()
         
         progressView.progressTintColor = .systemPurple
         progressView.clipsToBounds = true
         progressView.layer.cornerRadius = 6
         
         return progressView
     }()
     
     var percent: Int = 0
     lazy var percentLabel: UILabel = {
         let label = UILabel()
         
         label.text = "\(String(percent)) %"
         label.font = .systemFont(ofSize: 18, weight: .regular)
         label.textColor = .gray
         
         return label
     }()
     
 //  ----------------------------------------------------------------------------  //
     let months = ["January", "February", "March", "April",
                   "May", "June", "July", "August", "September",
                   "October", "November", "December"]
     lazy var textField: UITextField = {
         let textField = UITextField()
         
         textField.placeholder = "Select a Month"
         textField.backgroundColor = .systemGray6
         
         return textField
     }()
     
     lazy var pickerView: UIPickerView = {
         let picker = UIPickerView()
         
         picker.backgroundColor = .systemGray6
         
         return picker
     }()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         
         textField.inputView = pickerView
         textField.inputAccessoryView = toolbar()
         pickerView.delegate = self
         pickerView.dataSource = self
         
         [label, progressView, percentLabel, textField].forEach { item in
             view.addSubview(item)
             item.translatesAutoresizingMaskIntoConstraints = false
         }
         
         layout()
         
         timerConf()
         
     }
     
     func layout() {
         NSLayoutConstraint.activate([
             label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
             label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             
             progressView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
             progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             progressView.heightAnchor.constraint(equalToConstant: 8),
             
             percentLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 10),
             percentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             
             textField.topAnchor.constraint(equalTo: percentLabel.bottomAnchor, constant: 50),
             textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             textField.heightAnchor.constraint(equalToConstant: 50),
         ])
     }
     
     var timer = Timer()
     
     func timerConf() {
         var progress: Float = 0.0
         timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { timer in
             if self.progressView.progress < 1.0 {
                 progress += 0.01
                 let number: Int = Int(progress * 100)
                 self.percent = number
                 self.percentLabel.text = String("\(self.percent) %")
                 self.progressView.progress = progress
             } else {
                 timer.invalidate()
                 print("Stop")
             }
         })
     }
     
     
     extension Picker___Progress: UIPickerViewDelegate, UIPickerViewDataSource {
         func numberOfComponents(in pickerView: UIPickerView) -> Int {
             return 1
         }
         
         func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
             return months.count
         }
         
         func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
             return months[row]
         }
         
         func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
             textField.text = months[row]
         }
         
         func toolbar() -> UIToolbar {
             let toolbar = UIToolbar()
             toolbar.sizeToFit()
             
             let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelClicked))
             let flex1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
             let title = UIBarButtonItem(title: "Select a Month", style: .plain, target: nil, action: nil)
             let flex2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
             let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneClicked))
             
             toolbar.backgroundColor = .systemGray6
             title.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22)], for: .normal)
             toolbar.setItems([cancel, flex1, title, flex2, done], animated: true)
             return toolbar
         }
         
         @objc func doneClicked() {
             textField.resignFirstResponder()
         }
         
         @objc func cancelClicked() {
             textField.resignFirstResponder()
             textField.text = nil
         }
         
     }
     
     
     
     */
    
    
//  ---------------------------------------------------------------------------------------------  //
    
    
    /*
     
     
     lazy var back: UIView = {
         let back = UIView()
         
         back.backgroundColor = .white
         back.layer.cornerRadius = 10
         back.layer.borderWidth = 1
         back.layer.borderColor = UIColor.darkGray.cgColor
         
         return back
     }()
     
     lazy var textField: UITextField = {
         let textField = UITextField()
         
         return textField
     }()
     
     lazy var salutatiton: UILabel = {
         let label = UILabel()
         
         label.text = "SALUTATION"
         
         return label
     }()
     
     var names = ["Mr.", "Ms.", "Mrs."]
     var nameLabel: String = "Mr."
     lazy var label: UILabel = {
         let label = UILabel()
         
         label.text = nameLabel
         
         return label
     }()
     
     lazy var picker: UIPickerView = {
         let picker = UIPickerView()
         
         picker.backgroundColor = .systemGray6
         
         return picker
     }()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         
         picker.delegate = self
         picker.dataSource = self
         textField.inputView = picker
         textField.inputAccessoryView = toolbar()
         
         [back, textField, salutatiton, label, ].forEach { item in
             view.addSubview(item)
             item.translatesAutoresizingMaskIntoConstraints = false
         }
         
         layout()
     }
     
     func layout() {
         NSLayoutConstraint.activate([
             salutatiton.bottomAnchor.constraint(equalTo: back.topAnchor, constant: -5),
             salutatiton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
             
             back.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
             back.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             back.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
             back.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
             back.heightAnchor.constraint(equalToConstant: 80),
             
             label.centerYAnchor.constraint(equalTo: back.centerYAnchor),
             label.leadingAnchor.constraint(equalTo: back.leadingAnchor, constant: 20),
             label.widthAnchor.constraint(equalToConstant: 40),
             
             textField.centerYAnchor.constraint(equalTo: back.centerYAnchor),
             textField.leadingAnchor.constraint(equalTo: label.trailingAnchor),
             textField.trailingAnchor.constraint(equalTo: back.trailingAnchor, constant: -10),
             textField.heightAnchor.constraint(equalToConstant: 60),
         ])
     }
     
     
     extension Picker___Progress: UIPickerViewDelegate, UIPickerViewDataSource {
         func numberOfComponents(in pickerView: UIPickerView) -> Int {
             return 1
         }
         
         func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
             return names.count
         }
         
         func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
             return names[row]
         }
         
         func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
             nameLabel = names[row]
             label.text = nameLabel
         }
         
         func toolbar() -> UIToolbar {
             let toolbar = UIToolbar()
             toolbar.sizeToFit()
             
             let flex1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
             let title = UIBarButtonItem(title: "Pick A Salutation", style: .plain, target: nil, action: nil)
             let flex2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
             let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneClicked))
             
             title.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
             toolbar.setItems([flex1, title, flex2, done], animated: true)
             return toolbar
         }
         
         @objc func doneClicked() {
             textField.resignFirstResponder()
         }
     }
     
     
     */

}

extension Picker___Progress: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = cities[row]
    }
    
    func toolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let leftButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let rightButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(rightClicked))
        
        toolbar.setItems([leftButton, rightButton], animated: true)
        
        return toolbar
    }
    
    @objc func rightClicked() {
        textField.resignFirstResponder()
    }
}
