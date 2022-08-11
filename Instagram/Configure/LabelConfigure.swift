//
//  LabelConfigue.swift
//  Instagram
//
//  Created by Eldaniz on 04.08.22.
//
 
import UIKit

func labelloc (labelText: String, labelFont: String, XCoordinate:CGFloat, YCoordinate: CGFloat) -> UILabel{
    let screenHeight = UIScreen.main.bounds.height
    let labelHeight:CGFloat = screenHeight / 17.92
    
    let screenWidth = UIScreen.main.bounds.width
    let labelWidth:CGFloat = labelHeight * 3
    
    let fontSize: CGFloat = labelHeight / 1.25
    
    let ratioX = 414 / screenWidth
    let paddingX = CGFloat(((XCoordinate + 75) / ratioX) - labelWidth / 2)

    let ratioY = 896 / screenHeight
    let paddingY = CGFloat(((YCoordinate + 25) / ratioY) -  labelHeight / 2)
    
    let label = UILabel(frame: CGRect(x: paddingX, y: paddingY, width: labelWidth, height: labelHeight))
    label.textAlignment = .center
    label.text = labelText
    label.font = UIFont(name: labelFont, size: fontSize)
    
    return label
    
}
