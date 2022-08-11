//
//  buttonconfigue.swift
//  Instagram
//
//  Created by Eldaniz on 02.08.22.
//

import UIKit

func buttonLoc (imageName: String, XCoordinate : CGFloat, YCoordinate: CGFloat) -> UIButton{
    
    
    let screenHeight = UIScreen.main.bounds.height // finding the height of the phone that the app is running in
    let buttonHeight:CGFloat = screenHeight / 22.4 // adjusting the height of the button for iphone 11
    
    let screenWidth = UIScreen.main.bounds.width
    let buttonWidth:CGFloat = buttonHeight * 1.087 // adjusting the width of the button proportional to the height of the button
    
    let ratioX = 414 / screenWidth // finding x ratio of running device to iphone 11 in order to adjust it
    let paddingX = CGFloat(((XCoordinate + 21.5) / ratioX) - buttonWidth / 2) // finding the x padding proportional to the center of the button

    let ratioY = 896 / screenHeight // finding y ratio of running device to iphone 11 in order to adjust it
    let paddingY = CGFloat(((YCoordinate + 20) / ratioY) -  buttonHeight / 2) // finding the y ppadding proportional to the center of the button
   
    
    let button = UIButton(type: .custom)
    button.frame = CGRect(x: paddingX, y: paddingY, width: buttonWidth, height: buttonHeight)
    button.setImage(UIImage(named: imageName), for: .normal)
    
    return button
}
