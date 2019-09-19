//
//  MoveViewwithKeyboard.swift
//  MoveViewwithKeyboard
//
//  Created by mflale on 3.09.2019.
//  Copyright © 2019 tr. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    struct sizes {
        static var keyboard : CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        static var fieldBottomMargin : CGFloat = 80
    }
    
    func setKeyboardMover() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        let textFieldsArray = self.view.subviews.filter({$0 is UITextField}) as! [UITextField]
        
        for i in textFieldsArray {
            i.addTarget(self, action: #selector(myTargetFunction), for: .editingDidBegin)
        }
        
        view.addGestureRecognizer(tap)
        
        
    }
    
    @objc func myTargetFunction(textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.scroll(textField: textField)
        }
    }
    
    func scroll(textField: UITextField) {
        
        var barSize : CGFloat = 0
        
        if self.navigationController != nil && self.navigationController?.navigationBar.isTranslucent == false {
            barSize = self.navigationController!.navigationBar.frame.size.height + UIApplication.shared.statusBarFrame.height
        }
        
        let scrollSize = view.frame.size.height - (textField.frame.maxY + sizes.keyboard.height + sizes.fieldBottomMargin)
        
        scrollSize < 0 ? (self.view.frame.origin.y = barSize + scrollSize) : (self.view.frame.origin.y = barSize)
        
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @objc func keyboard(notification:Notification) {
        
        let textFieldsArray = self.view.subviews.filter({$0 is UITextField}) as! [UITextField]
        
        var barSize : CGFloat = 0
        
        if self.navigationController != nil && self.navigationController?.navigationBar.isTranslucent == false {
            barSize = self.navigationController!.navigationBar.frame.size.height + UIApplication.shared.statusBarFrame.height
        }
        
        guard let keyboardReact = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
            return
        }
        
        sizes.keyboard = keyboardReact
        
        if notification.name == UIResponder.keyboardWillShowNotification {
            
            for i in textFieldsArray {
                if i.isEditing {
                    scroll(textField: i)
                }
            }
        } else {
            self.view.frame.origin.y = barSize
        }
        
    }
    
}
