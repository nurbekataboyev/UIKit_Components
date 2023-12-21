//
//  LoadingAnimation.swift
//  UIKit_Components
//
//  Created by Nurbek on 16/12/23.
//

import UIKit
import SnapKit

class LoadingAnimation: UIViewController {
    
    private let animText = "LOADING"
    private var timer = Timer()
    private var index: Int = 0
    private var secondIndex: Int = 0
    private var secondTimer = Timer()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 8
        
        return stackView
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        
        button.addTarget(self, action: #selector(startClicked), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stopButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("STOP", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        
        button.addTarget(self, action: #selector(stopClicked), for: .touchUpInside)
        
        return button
    }()
    
//  ---------------------------------------------------------------------------------------------------------------  //
    
    private lazy var secondStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 8
        
        return stackView
    }()
    
    private lazy var secondStartButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        
        button.addTarget(self, action: #selector(secondStartClicked), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var secondStopButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("STOP", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        
        button.addTarget(self, action: #selector(secondStopClicked), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [stackView, startButton, stopButton].forEach { item in
            view.addSubview(item)
        }
        for character in animText {
            let label = UILabel()
            
            label.text = String(character)
            label.font = .systemFont(ofSize: 25, weight: .semibold)
            stackView.addArrangedSubview(label)
        }
        
            // ----------------- //
        
        [secondStackView, secondStartButton, secondStopButton].forEach { item in
            view.addSubview(item)
        }
        for character in animText {
            let label = UILabel()
            
            label.text = String(character)
            label.font = .systemFont(ofSize: 25, weight: .semibold)
            secondStackView.addArrangedSubview(label)
        }
        
        layout()
        secondLayout()
    }
    
    private func layout() {
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(130)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        startButton.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(60)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(Constants.height)
            $0.width.equalTo(Constants.width)
        }
        
        stopButton.snp.makeConstraints {
            $0.top.equalTo(startButton.snp.bottom).offset(Constants.small)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(Constants.height)
            $0.width.equalTo(Constants.width)
        }
    }
    
    private func secondLayout() {
        secondStackView.snp.makeConstraints {
            $0.top.equalTo(stopButton.snp.top).offset(200)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        secondStartButton.snp.makeConstraints {
            $0.top.equalTo(secondStackView.snp.bottom).offset(60)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(Constants.height)
            $0.width.equalTo(Constants.width)
        }
        
        secondStopButton.snp.makeConstraints {
            $0.top.equalTo(secondStartButton.snp.bottom).offset(Constants.small)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(Constants.height)
            $0.width.equalTo(Constants.width)
        }
    }
    
}

// 1-option
extension LoadingAnimation {
    
    @objc func startClicked() {
        self.animation(0)
        self.timer.fire()
        startButton.isEnabled = false
    }
    
    @objc func stopClicked() {
        self.timer.invalidate()
        startButton.isEnabled = true
    }
    
    private func animation(_ index: Int) {
        
        let subviews = self.stackView.subviews as! [UILabel]
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
            
            UIView.animate(withDuration: 0.4) {
                
                subviews[index].transform = CGAffineTransform(translationX: 0, y: -Constants.animHeight)
                
                if index == subviews.count - 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                        self.animation(0)
                    })
                    
                    
                } else {
                    self.animation(index + 1)
                }
                
            } completion: { _ in
                
                timer.invalidate()
                UIView.animate(withDuration: 0.4) {
                    
                    subviews[index].transform = CGAffineTransform(translationX: 0, y: 0)
                    
                }
                
            }
            
        })
        
    }
    
}


extension LoadingAnimation {
    
    private func customAnimation() {
        let subviews = self.secondStackView.subviews as! [UILabel]
        
        secondTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            let currentSubview = subviews[self.secondIndex]
            
            let cycle = CABasicAnimation(keyPath: "position")
            cycle.fromValue = NSValue(cgPoint: CGPoint(x: currentSubview.layer.position.x, y: currentSubview.layer.position.y))
            cycle.toValue = NSValue(cgPoint: CGPoint(x: currentSubview.layer.position.x, y: currentSubview.layer.position.y - 20))
            cycle.duration = 0.4
            cycle.autoreverses = true
            cycle.repeatCount = 1
            
            currentSubview.layer.add(cycle, forKey: "position")
            
            if self.secondIndex == subviews.count - 1 {
                self.secondIndex = 0
                self.secondTimer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    self.customAnimation()
                })
                
            } else {
                self.secondIndex += 1
            }
            
        })
        
        
    }
    
    @objc func secondStartClicked() {
        customAnimation()
        self.secondTimer.fire()
        self.secondStartButton.isEnabled = false
        
        print("start")
    }
    
    @objc func secondStopClicked() {
        self.secondTimer.invalidate()
        self.secondStartButton.isEnabled = true
        self.secondIndex = 0
        
        print("stop")
    }
}
