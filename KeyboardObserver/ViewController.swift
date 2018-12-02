//
//  ViewController.swift
//  KeyboardObserver
//
//  Created by Toomas Vahter on 01/12/2018.
//  Copyright © 2018 Augmented Code. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: Managing the View
    
    @IBOutlet weak var scrollView: UIScrollView!
    private var keyboardObserver: KeyboardObserver?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardObserver = KeyboardObserver(changeHandler: { [weak self] (info) in
            guard let self = self else { return }
            switch info.changeEvent {
            case .willShow, .willChangeFrame:
                self.scrollView.contentInset.bottom = info.endFrame.height
            case .willHide:
                self.scrollView.contentInset.bottom = 0
            default:
                break
            }
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        keyboardObserver = nil
    }
}
