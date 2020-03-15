//
//  ViewController.swift
//  UICircularProgressViewDemo
//
//  Created by Parth Adroja on 15/03/20.
//  Copyright © 2020 Parth Adroja. All rights reserved.
//

import UIKit
import UICircularProgressView

class ViewController: UIViewController {
    
    @IBOutlet weak var eg1ProgressView: UICircularProgressView!
    @IBOutlet weak var eg2ProgressView: UICircularProgressView!
    @IBOutlet weak var otpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        configureEg1ProgressView()
        configureEg2ProgressView()
    }
    
    private func configureEg1ProgressView() {
        var currentProgress: CGFloat = 0.0
        eg1ProgressView.defaultProgress = currentProgress
        Timer.scheduledTimer(withTimeInterval: 1,
                             repeats: true,
                             block: { timer in
                                currentProgress += 2
                                self.eg1ProgressView.updateProgress(progress: currentProgress)
                                if currentProgress >= 100 {
                                    timer.invalidate()
                                }
        })
    }
    
    private func configureEg2ProgressView() {
        var currentProgress: CGFloat = 100.0
        eg2ProgressView.defaultProgress = currentProgress
        otpLabel.text = [1,2,3,4,5,6].shuffled().map({ String($0) }).joined()
        Timer.scheduledTimer(withTimeInterval: 1,
                             repeats: true,
                             block: { timer in
                                currentProgress -= 10
                                self.eg2ProgressView.updateProgress(progress: currentProgress)
                                if currentProgress <= 0 {
                                    self.otpLabel.text = [1,2,3,4,5,6].shuffled().map({ String($0) }).joined()
                                    currentProgress = 100
                                }
        })
    }
}
