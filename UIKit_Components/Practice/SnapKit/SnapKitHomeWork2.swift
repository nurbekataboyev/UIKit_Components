//
//  SnapKitHomeWork2.swift
//  UIKit_Components
//
//  Created by Nurbek on 14/12/23.
//

import UIKit

class SnapKitHomeWork2: UIViewController {
    
    
    private lazy var container: UIView = {
        let container = UIView()
        return container
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 0
        
        return stackView
    }()
    
//    MARK: - TASK2
    
    private var isStarted = false
    private let characters = ["L","O","A","D","I","N","G"]
    private var charCount = 0
    
    private lazy var charL: UILabel = {
        let character = UILabel()
        
        character.text = "L"
        character.font = .systemFont(ofSize: 30, weight: .bold)
        
        return character
    }()
    private lazy var charO: UILabel = {
        let character = UILabel()
        
        character.text = "O"
        character.font = .systemFont(ofSize: 30, weight: .bold)
        
        return character
    }()
    private lazy var charA: UILabel = {
        let character = UILabel()
        
        character.text = "A"
        character.font = .systemFont(ofSize: 30, weight: .bold)
        
        return character
    }()
    private lazy var charD: UILabel = {
        let character = UILabel()
        
        character.text = "D"
        character.font = .systemFont(ofSize: 30, weight: .bold)
        
        return character
    }()
    private lazy var charI: UILabel = {
        let character = UILabel()
        
        character.text = "I"
        character.font = .systemFont(ofSize: 30, weight: .bold)
        
        return character
    }()
    private lazy var charN: UILabel = {
        let character = UILabel()
        
        character.text = "N"
        character.font = .systemFont(ofSize: 30, weight: .bold)
        
        return character
    }()
    private lazy var charG: UILabel = {
        let character = UILabel()
        
        character.text = "G"
        character.font = .systemFont(ofSize: 30, weight: .bold)
        
        return character
    }()
    
    private lazy var clockwiseIcon: UIImageView = {
        let clockwise = UIImageView()
        
        clockwise.image = UIImage(named: "clockwise")
        
        return clockwise
    }()
    
    private lazy var circle1: UIView = {
        let circle = UIView()
        
        circle.layer.cornerRadius = 20
        circle.backgroundColor = .red
        
        return circle
    }()
    
    private lazy var circle2: UIView = {
        let circle = UIView()
        
        circle.layer.cornerRadius = 20
        circle.backgroundColor = .systemOrange
        
        return circle
    }()
    
    private lazy var circle3: UIView = {
        let circle = UIView()
        
        circle.layer.cornerRadius = 20
        circle.backgroundColor = .green
        
        return circle
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = Constants.height / 2
        
        button.addTarget(self, action: #selector(startClicked), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stopButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Stop", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = Constants.height / 2
        
        button.addTarget(self, action: #selector(stopClicked), for: .touchUpInside)
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [charL, charO, charA, charD, charI, charN, charG, stackView, clockwiseIcon, circle1, circle2, circle3, startButton, stopButton].forEach { item in
            view.addSubview(item)
        }
        container.addSubview(stackView)
        
//        for char in characters {
//            let characterView = CustomLoadingText(char: char, id: charCount)
//            charCount += 1
//            stackView.addArrangedSubview(characterView)
//        }
        
        layout()
    }
    
    private func layout() {
        
//        container.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.small)
//            $0.height.equalTo(50)
//            $0.leading.equalToSuperview().offset(50)
//            $0.trailing.equalToSuperview().offset(-50)
//        }
//        
//        stackView.snp.makeConstraints {
//            $0.leading.equalTo(container.snp.leading)
//            $0.trailing.equalTo(container.snp.trailing)
//            $0.top.equalTo(container.snp.top)
//            $0.bottom.equalTo(container.snp.bottom)
//        }
        
        charL.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.medium)
            $0.trailing.equalTo(charO.snp.leading).offset(-10)
        }
        
        charO.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.medium)
            $0.trailing.equalTo(charA.snp.leading).offset(-10)
        }
        
        charA.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.medium)
            $0.trailing.equalTo(charD.snp.leading).offset(-10)
        }
        
        charD.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.medium)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        charI.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.medium)
            $0.leading.equalTo(charD.snp.trailing).offset(10)
        }
        
        charN.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.medium)
            $0.leading.equalTo(charI.snp.trailing).offset(10)
        }
        
        charG.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.medium)
            $0.leading.equalTo(charN.snp.trailing).offset(10)
        }
        
        clockwiseIcon.snp.makeConstraints {
            $0.width.equalTo(250)
            $0.height.equalTo(250)
            $0.top.equalTo(view.snp.top).offset(250)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        circle2.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(40)
            $0.centerX.equalTo(clockwiseIcon.snp.centerX)
            $0.centerY.equalTo(clockwiseIcon.snp.centerY)
        }
        
        circle1.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(40)
            $0.trailing.equalTo(circle2.snp.leading).offset(-20)
            $0.centerY.equalTo(clockwiseIcon.snp.centerY)
        }
        
        circle3.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(40)
            $0.leading.equalTo(circle2.snp.trailing).offset(20)
            $0.centerY.equalTo(clockwiseIcon.snp.centerY)
        }
        
        startButton.snp.makeConstraints {
            $0.width.equalTo(320)
            $0.height.equalTo(Constants.height)
            $0.top.equalTo(clockwiseIcon.snp.bottom).offset(Constants.big)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        stopButton.snp.makeConstraints {
            $0.width.equalTo(320)
            $0.height.equalTo(Constants.height)
            $0.top.equalTo(startButton.snp.bottom).offset(Constants.small)
            $0.centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func animation() {
        
        if isStarted == true {
            print("Animation Started")
            loadingAnimation()
            circlesAnimation()
            clockwiseAnimation()
        } else {
            print("Animation Stopped")
        }
        
    }
    
    private func loadingAnimation() {
        var timer = Timer()
        if isStarted == true {
            startButton.isEnabled = false
            
            timer = Timer.scheduledTimer(withTimeInterval: 4.5, repeats: true, block: { _ in
                
                UIView.animate(withDuration: 0.5) {
                    
                    self.charL.transform = CGAffineTransform(translationX: 0, y: -5)
                    
                } completion: { _ in
                    
                    UIView.animate(withDuration: 0.5) {
                        
                        self.charO.transform = CGAffineTransform(translationX: 0, y: -5)
                        self.charL.transform = CGAffineTransform(translationX: 0, y: 0)
                        
                    } completion: { _ in
                        
                        UIView.animate(withDuration: 0.5) {
                            
                            self.charA.transform = CGAffineTransform(translationX: 0, y: -5)
                            self.charO.transform = CGAffineTransform(translationX: 0, y: 0)
                            
                        } completion: { _ in
                            
                            UIView.animate(withDuration: 0.5) {
                                
                                self.charD.transform = CGAffineTransform(translationX: 0, y: -5)
                                self.charA.transform = CGAffineTransform(translationX: 0, y: 0)
                                
                            } completion: { _ in
                                
                                UIView.animate(withDuration: 0.5) {
                                    
                                    self.charI.transform = CGAffineTransform(translationX: 0, y: -5)
                                    self.charD.transform = CGAffineTransform(translationX: 0, y: 0)
                                    
                                } completion: { _ in
                                    
                                    UIView.animate(withDuration: 0.5) {
                                        
                                        self.charN.transform = CGAffineTransform(translationX: 0, y: -5)
                                        self.charI.transform = CGAffineTransform(translationX: 0, y: 0)
                                        
                                    } completion: { _ in
                                        
                                        UIView.animate(withDuration: 0.5) {
                                            
                                            self.charG.transform = CGAffineTransform(translationX: 0, y: -5)
                                            self.charN.transform = CGAffineTransform(translationX: 0, y: 0)
                                            
                                        } completion: { _ in
                                            
                                            self.charG.transform = CGAffineTransform(translationX: 0, y: 0)
                                            self.loadingAnimation()
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }

                
            })
            
            
        } else {
            timer.invalidate()
            startButton.isEnabled = true
            return
        }
        
    }

    private func circlesAnimation() {
        let time = 0.5
        
        if isStarted == true {
            startButton.isEnabled = false
            
            UIView.animate(withDuration: time) {
                
                self.circle1.backgroundColor = .white
                
            } completion: { _ in
                
                UIView.animate(withDuration: time) {
                    
                    self.circle1.backgroundColor = .red
                    self.circle2.backgroundColor = .white
                    
                } completion: { _ in
                    
                    UIView.animate(withDuration: time) {
                        
                        self.circle2.backgroundColor = .systemOrange
                        self.circle3.backgroundColor = .white
                        
                    } completion: { _ in
                        
                        UIView.animate(withDuration: time) {
                            
                            self.circle3.backgroundColor = .green
                            
                            self.circlesAnimation()
                            
                        }
                        
                    }
                    
                }
                
            }
        } else {
            startButton.isEnabled = true
            return
        }
        
    }
    
    
    private func clockwiseAnimation() {
        
        if isStarted == true {
            startButton.isEnabled = false
            
            UIView.animate(withDuration: 3) {
                
                self.clockwiseIcon.transform = CGAffineTransform(rotationAngle: .pi)
                
            } completion: { _ in
                
                UIView.animate(withDuration: 3) {
                    
                    self.clockwiseIcon.transform = CGAffineTransform(rotationAngle: .pi * 2)
                    
                } completion: { _ in
                    
                    self.clockwiseAnimation()
                    
                }
                
            }

            
        } else {
            startButton.isEnabled = true
            return
        }
        
    }
    
}

extension SnapKitHomeWork2 {
    @objc func startClicked() {
        self.isStarted = true
        animation()
    }
    
    @objc func stopClicked() {
        self.isStarted = false
        animation()
    }
}

