//
//  UICreation.swift
//  EmptyApp
//
//  Created by Samarth chaturvedi on 10/31/20.
//  Copyright © 2020 rab. All rights reserved.
//


import UIKit

class UICreation:NSObject, UITextFieldDelegate, UIPickerViewDelegate{

    func CreateButton(_ pX:Int, _ pY:Int, _ pWidth:Int, _ pheight:Int, _ pBGColor:UIColor,_ pFColor:UIColor, _ pTitle:String ,_ pAction:Selector)->UIButton
    {
        let bRect:CGRect = CGRect(x: pX, y: pY, width: pWidth, height: pheight)

        let buttn:UIButton = UIButton(frame: bRect)

        buttn.setTitle(pTitle, for: UIControl.State.normal)

        buttn.layer.cornerRadius = 20.0

        buttn.layer.borderColor = UIColor.red.cgColor
        buttn.setTitleColor(pFColor, for: .normal)
        buttn.layer.borderWidth = 2.0

        buttn.backgroundColor = pBGColor

        //buttn.addt
      // buttn.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        let dd = AppDelegate()
        buttn.addTarget(dd, action:pAction, for: .touchUpInside)
        return buttn
      //  window.addSubview(buttn)
    }
    
    func Creatlable(_ pX:Int, _ pY:Int, _ pWidth:Int, _ pheight:Int , _ pText : String)->UILabel
    {
        let bRect:CGRect = CGRect(x: pX, y: pY, width: pWidth, height: pheight)

        let lbl:UILabel = UILabel(frame: bRect)
        lbl.text = pText
      //  lbl.setTitle(pTitle, for: UIControl.State.normal)

      //  lbl.layer.cornerRadius = 20.0

       // lbl.layer.borderColor = UIColor.red.cgColor
       // lbl.setTitleColor(UIColor.black, for: .normal)
      //  lbl.layer.borderWidth = 2.0

      //  lbl.backgroundColor = UIColor.white

        //buttn.addt
      // buttn.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
      //  let dd = AppDelegate()
       // buttn.addTarget(dd, action:pAction, for: .touchUpInside)
        return lbl
      //  window.addSubview(buttn)
    }
    
    func CreatTextField(_ pX:Int, _ pY:Int, _ pWidth:Int, _ pheight:Int , _ pText : String , _ pKeyboradtype:UIKeyboardType)->UITextField
    {
        let bRect:CGRect = CGRect(x: pX, y: pY, width: pWidth, height: pheight)

        let textField:UITextField = UITextField(frame: bRect)
        textField.placeholder = pText
      //  lbl.setTitle(pTitle, for: UIControl.State.normal)

       // textField.layer.cornerRadius = 20.0

        textField.layer.borderColor = UIColor.red.cgColor
       // lbl.setTitleColor(UIColor.black, for: .normal)
        textField.layer.borderWidth = 2.0

        textField.backgroundColor = UIColor.white
        textField.keyboardType = pKeyboradtype
        textField.returnKeyType=UIReturnKeyType.done
        textField.clearButtonMode = .always
        //buttn.addt
      // buttn.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
      //  let dd = AppDelegate()
       // buttn.addTarget(dd, action:pAction, for: .touchUpInside)
        textField.delegate = self
        return textField
      //  window.addSubview(buttn)
    }
    
    func CreatTextView(_ pX:Int, _ pY:Int, _ pWidth:Int, _ pheight:Int , _ pText : String )->UITextView{
        let bRect:CGRect = CGRect(x: pX, y: pY, width: pWidth, height: pheight)

        let textView:UITextView = UITextView(frame: bRect)
      //  let textView = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
       // self.automaticallyAdjustsScrollViewInsets = false
        
        textView.text = pText
        textView.textAlignment = NSTextAlignment.justified
        textView.textColor = UIColor.black
        textView.backgroundColor = UIColor.white
        return textView
    }
    
    func CreatPickerView(_ pX:Int, _ pY:Int, _ pWidth:Int, _ pheight:Int , _ pDS : UIPickerViewDataSource )->UIPickerView{
        let bRect:CGRect = CGRect(x: pX, y: pY, width: pWidth, height: pheight)

        let picker:UIPickerView = UIPickerView(frame: bRect)
      //  let textView = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
       // self.automaticallyAdjustsScrollViewInsets = false
        
        picker.dataSource = pDS
        picker.delegate = self
        
        return picker
    }
    
    
    func CreateAlert( _ ptitle:String, _ pmessage:String)->UIAlertController
    {
        let alert = UIAlertController(title: ptitle, message: pmessage, preferredStyle: .alert)
      //  alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
             /* switch action.style{
              case .default:
                    print("default")

              case .cancel:
                    print("cancel")

              case .destructive:
                    print("destructive")
             }*/


      //  }))
        return alert
    }

}
