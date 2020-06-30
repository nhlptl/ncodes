//
//  Constant.swift
//  PropertyIcon
//
//  Created by TBI-iOS-02 on 07/03/19.
//  Copyright © 2019 TBI-iOS-02. All rights reserved.
//

import UIKit

class Constant: NSObject
{
    //==
    static let appDeleate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    static let screenSize               = UIScreen.main.bounds.size
    static let deviceID                 = UIDevice.current.identifierForVendor?.uuidString
    
    //Mark:
    static let backgoundColor   : UIColor = UIColor.white
    static let theme_color      : UIColor = UIColor(red: 248.0/255.0, green: 160.0/255.0, blue: 10.0/255.0, alpha: 1.0)
    
    static let logo_White   : UIImage = UIImage(named: "carWash")!
    static let logo_Colored : UIImage = UIImage(named: "carWash")!

    //Banner ad
    //static let bannerAdUnitID = "" //Live
    static let bannerAdUnitID = "ca-app-pub-3940256099942544/2934735716" //Test
    
    //Interstitial ad
    //static let interstitialAdUnitID = "" //Live
    static let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910" //Test
    
    //Native ads
    //static let nativeAdUnitID = "" //Live
    static let nativeAdUnitID = "ca-app-pub-3940256099942544/3986624511" //Test
    
    //Rewarded ads
    //static let rewardedAdUnitID = "" //Live
    static let rewardedAdUnitID = "ca-app-pub-3940256099942544/1712485313" //Test
    
    static let URL_PREFIX       = "http://116.72.16.200:3006/api/"
    static let URL_PREFIX_Local = "http://localhost:3006/api/"
    
    static let USER_ID          = "id"
    static let USER_NAME        = "name"
    static let USER_PHONENUMBER = "userPhoneNumber"
    static let VERIFICATIONID   = "verificationId"
    static let LOGINPASSWORD    = "loginPassword"
    static var IS_USER_LOGGEDIN = "isUserLoggedIn"
    static let FIRPUSHTOKEN     = "FIREBASEPUSHTOKEN"
    static let Login_Dix        = "LOGINDIC"
    
    static let userDefault = UserDefaults.standard
    static var user_id     = Constant.userDefault.string(forKey: Constant.USER_ID)
    static let user_name   = Constant.userDefault.string(forKey: Constant.USER_NAME)
    
    //Validation Message
    static let selectProfileImage = "Please select profile image"
    static let enterName          = "Please enter your name!"
    static let enterFirstName     = "Please enter your first name!"
    static let enterLastName      = "Please enter your last name!"
    static let enterEmail         = "Please enter your Email!"
    static let enterPassword      = "Please enter your password!"
    static let enterValidPassword = "Your password should be atleast 6 characters long"
    static let enterValidEmail    = "Please enter valid email"
    static let enterMobile        = "Please enter your mobile number"
    static let enterValidMobile   = "Please enter valid phone number"
    static let enterAddress       = "Please enter your address"
    static let enterSiteLocation  = "Please enter site location"
    static let enterPropetyType   = "Please select property type"
    static let enterPropetyPrice  = "Please enter price"
    static let enterPropertyAge   = "Please select property age"
    static let enterArea          = "Please enter area"
    static let enterComment       = "Please enter your comment"
    static let selectFile         = "Please select file"
    
    static let enterDescription = "Please enter description!"
    static let enterDate        = "Please enter date!"
    static let enterTime        = "Please enter time!"
    static let enter_Message    = "Please write a message"
   
    static let dob = "Please select birthdate"
    static let currentPassword = "Please enter current password"
    static let currentPasswordNotMatch = "Please enter correct current password"
    static let newPassword = "Please enter new password"
    static let confirmPasswordEmpty = "Please re-enter password"
    static let confirmPasswordNotMatch = "Confirm password does not match!"
    static let enterOTP = "Please enter OTP"
    static let wrongOTP = "Not a valid OTP"
    static let profileUpdated = "Profile Updated"
    static let casePosted = "Your case has been posted!"
    
    static let accpetRequestAlert = "Sure you want to accept this request?"
    static let declineRequestMessage = "Sure you want to decline this request?"
    static let noInternet = "Please check your internet Connectivity"
    static let chooseSource = "Please select an image source"
    static let noCamera = "No camera detected on device"
    static let caseAssigned = "You have succesfully assigned your case to"
    static let selectTime = "Please select time"
    static let selectDay = "Please select a  day"
    static let noData = "No Records Available" //notValidNumber
    static let lostConnection = "Connection lost"
    static let sureToLogout = "Sure you want to logout?" //"No Notifications found"
    static let sureToSubscribe = "Sure you want to subscribe this membership plan?"
    static let notValidNumber = "Not a valid number!"
    static let sureToApprove = "Sure you want to approve?"
    static let sureToCancel = "Sure you want to cancel?"
}


extension NSMutableAttributedString
{
    func setColor(color: UIColor, forText stringValue: String)
    {
        let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}


extension UIViewController
{
    func setBackgroundImage(imageName: String)
    {
        UIGraphicsBeginImageContextWithOptions(self.view.frame.size, false, 0)
        UIGraphicsGetCurrentContext()!.interpolationQuality = CGInterpolationQuality.high
        UIImage(named: imageName)?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }

    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

extension UINavigationController
{
    
    func containsViewController(ofKind kind: AnyClass) -> Bool
    {
        return self.viewControllers.contains(where: { $0.isKind(of: kind) })
    }
    
    func popToVC(ofKind kind: AnyClass, pushController: UIViewController)
    {
        if containsViewController(ofKind: kind)
        {
            for controller in self.viewControllers
            {
                if controller.isKind(of: kind)
                {
                    popToViewController(controller, animated: true)
                    break
                }
            }
        }
    }
    
    /*
    func popPushToVC(ofKind kind: AnyClass, pushController: UIViewController)
    {
        if containsViewController(ofKind: kind)
        {
            for controller in self.viewControllers
            {
                if controller.isKind(of: kind)
                {
                    popToViewController(controller, animated: true)
                    break
                }
            }
        }
        else
        {
            pushViewController(pushController, animated: true)
        }
    }
    */
    
}

extension UIApplication
{
    
    var visibleViewController: UIViewController?
    {
        guard let rootViewController = keyWindow?.rootViewController else { return nil }
        return getVisibleViewController(rootViewController)
    }
    
    private func getVisibleViewController(_ rootViewController: UIViewController) -> UIViewController?
    {
        
        if let presentedViewController = rootViewController.presentedViewController {
            return getVisibleViewController(presentedViewController)
        }
        
        if let navigationController = rootViewController as? UINavigationController {
            return navigationController.visibleViewController
        }
        
        if let tabBarController = rootViewController as? UITabBarController {
            return tabBarController.selectedViewController
        }
        
        return rootViewController
    }
}


extension UITextView
{
    func setFullBorder(withTextFieldBorderColor borderColor: UIColor, withTextFieldBorderWidth borderWidth: CGFloat)
    {
        self.layer.borderColor   = borderColor.cgColor
        self.layer.borderWidth   = borderWidth
    }
}

extension UITextField
{
    func setFullBorder(withTextFieldBorderColor borderColor: UIColor, withTextFieldBorderWidth borderWidth: CGFloat)
    {
        self.layer.borderColor   = borderColor.cgColor
        self.layer.borderWidth   = borderWidth
    }
    
    func setBottomLine(withColor color: UIColor, linewidth: CGFloat)
    {
        self.borderStyle     = UITextField.BorderStyle.none
        self.backgroundColor = UIColor.clear
        let width: CGFloat   = linewidth
        
        let borderLine = UIView(frame: CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width))
        borderLine.backgroundColor = color
        self.addSubview(borderLine)
    }
    
    func setBottomBorder(bkcolor: UIColor, underlineColor: UIColor, bHeight: CGFloat)
    {
        self.borderStyle = .none
        
        self.layer.backgroundColor = bkcolor.cgColor
        self.layer.masksToBounds   = false
        self.layer.shadowColor     = underlineColor.cgColor
        self.layer.shadowOffset    = CGSize(width: 0.0, height: bHeight)
        self.layer.shadowOpacity   = 1.0
        self.layer.shadowRadius    = 0.0
    }
    
    func setTextFieldAppearance(radius : CGFloat , borderColor : UIColor, borderWidth : CGFloat , backgoundColor : UIColor)
    {
        self.layer.cornerRadius = radius
        self.layer.borderColor  = borderColor.cgColor
        self.layer.borderWidth  = borderWidth
        self.backgroundColor    = backgoundColor
    }
    
    func setRightPaddingToTextFields(paddingImageName: String) -> Void {
        self.rightViewMode = .always
        let paddingView         = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height))
        paddingView.image       = UIImage(named: paddingImageName)
        paddingView.contentMode = .center
        self.rightView    = paddingView
    }
    
}


extension UIView
{
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat)
    {
        let path         = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask         = CAShapeLayer()
        mask.path    = path.cgPath
        self.layer.mask  = mask
    }
    
    func roundCornersToTop(cornerRadius: Double)
    {
        let path            = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer       = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path  = path.cgPath
        self.layer.mask     = maskLayer
    }
    
    func addShadow(shadowColor: UIColor ,shadowWidth:CGFloat, shadowHeight: CGFloat, shadowRadius: CGFloat, shadowOpacity: Float, clipsBounds : Bool = false)
    {
        self.clipsToBounds       = clipsBounds
        self.layer.shadowOffset  = CGSize(width: shadowWidth, height: shadowHeight)
        self.layer.shadowRadius  = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowColor   = shadowColor.cgColor
    }
    
    func addShadowToView(shadowColor: UIColor, shadowOpacity: CGFloat, shadowWidth: CGFloat, shadowHeight: CGFloat, shadowRadius: CGFloat)
    {
        self.layer.shadowColor   = shadowColor.cgColor
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.shadowOffset  = CGSize(width: shadowWidth, height: shadowHeight)
        self.layer.shadowRadius  = shadowRadius
        self.layer.shadowPath    = UIBezierPath(rect: self.bounds).cgPath
        self.layer.masksToBounds = false
    }
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2)
    {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue               = toValue
        animation.duration              = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode              = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
    }
    
    func setBorder(bkcolor: UIColor, underlineColor: UIColor)
    {
        self.layer.backgroundColor  = bkcolor.cgColor
        self.layer.masksToBounds    = false
        self.layer.shadowColor      = underlineColor.cgColor
        self.layer.shadowOffset     = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity    = 1.0
        self.layer.shadowRadius     = 0.0
    }
    
    
    
    enum ViewSide
    {
        case Left, Right, Top, Bottom
    }
    
    func addBorder(toSide side: ViewSide , withColor color: CGColor, andThickness thickness: CGFloat)
    {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side
        {
        case .Left: border.frame    = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame   = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame     = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame  = CGRect(x: frame.minX, y: frame.maxY - thickness, width: frame.width, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
    
    func startShimmering()
    {
        //let light = UIColor.init(white: 0, alpha: 0.1).cgColor
        let light   = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        let dark    = UIColor.black.cgColor
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors     = [dark, light, dark]
        gradient.frame      = CGRect(x: -self.bounds.size.width, y: 0, width: 3*self.bounds.size.width, height: self.bounds.size.height)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint   = CGPoint(x: 1.0, y: 0.525)
        gradient.locations  = [0.4, 0.5, 0.6]
        self.layer.mask = gradient
        
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue   = [0.8, 0.9, 1.0]
        animation.duration  = 2.0
        animation.repeatCount = Float.infinity
        gradient.add(animation, forKey: "shimmer")
    }
    
    func stopShimmering()
    {
        self.layer.mask = nil
    }
    
}


extension Int
{
    var boolValue: Bool { return self != 0 }
}


extension String
{
    func toDateTimeWithZone() -> NSDate
    {
        let dateFormatter = DateFormatter()
        //2017-12-23T11:55:57.000Z
        //"yyyy-MM-dd'T'HH:mm:ssZZZ"
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        //Parse into NSDate
        let dateFromString : NSDate = dateFormatter.date(from: self)! as NSDate
        //Return Parsed Date
        return dateFromString
    }
    
    func toDateTime(format : String) -> NSDate
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        //Specify Format of String to Parse
        dateFormatter.dateFormat = format //"HH:mm:ss a"
        //Parse into NSDate
        let dateFromString : NSDate = dateFormatter.date(from: self)! as NSDate
        //Return Parsed Date
        return dateFromString
    }
    
    func to24DateTime() -> NSDate
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "HH:mm"
        //Parse into NSDate
        let dateFromString : NSDate = dateFormatter.date(from: self)! as NSDate
        //Return Parsed Date
        return dateFromString
    }
    
    
    func toYearDate() -> NSDate
    {
        let formatter = DateFormatter()
            formatter.dateFormat    = "yyyy-MM-dd"
        let dateFromString : NSDate = formatter.date(from: self)! as NSDate
        
        return dateFromString
    }
    
    func toYearDate1() -> NSDate
    {
        let formatter = DateFormatter()
            formatter.dateFormat    = "dd/MM/yyyy"
        let dateFromString : NSDate = formatter.date(from: self)! as NSDate
        
        return dateFromString
    }
    
    func smartContains(_ other: String) -> Bool
    {
        let array : [String] = other.lowercased().components(separatedBy: " ").filter { !$0.isEmpty }
        
        if(array.count != 0)
        {
            return array.reduce(true) { !$0 ? false : (self.lowercased().range(of: $1) != nil ) }
        } else {
            return false
        }
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func applyPatternOnNumbers(pattern: String, replacmentCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(encodedOffset: index)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
}

extension Date
{
    func toString24Set() -> String
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "HH:mm:ss"
        //Parse into NSDate
        let dateFromString = dateFormatter.string(from: self as Date)
        //Return Parsed Date
        return dateFromString
    }
}

extension NSDate
{
    
    func toStringDate() -> String
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "dd MMM yyyy" // "yyyy-MM-dd"
        //Parse into NSDate
        let dateFromString = dateFormatter.string(from: self as Date)
        //Return Parsed Date
        return dateFromString
    }
    
    func toStringDate1() -> String
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "yyyy-MM-dd" // "dd MMM yyyy"
        //Parse into NSDate
        let dateFromString = dateFormatter.string(from: self as Date)
        //Return Parsed Date
        return dateFromString
    }
    
    func toString24hourTime() -> String
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "HH:mm"
        //Parse into NSDate
        let dateFromString = dateFormatter.string(from: self as Date)
        //Return Parsed Date
        return dateFromString
    }
    
    func toString12hourTime() -> String
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "hh:mm a"
        //Parse into NSDate
        let dateFromString = dateFormatter.string(from: self as Date)
        //Return Parsed Date
        return dateFromString
    }
    
    func toString24hourwithSecond() -> String
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "HH:mm:ss"
        //Parse into NSDate
        let dateFromString = dateFormatter.string(from: self as Date)
        //Return Parsed Date
        return dateFromString
    }
    
    func toStringFullMnthDate() -> String
    {
        let dateFormatter = DateFormatter()
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "dd-MMMM-yyyy"
        //Parse into NSDate
        let dateFromString = dateFormatter.string(from: self as Date)
        //Return Parsed Date
        return dateFromString
    }
}

extension UIColor
{
    convenience init(red: Int, green: Int, blue: Int)
    {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int)
    {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    convenience init(hex:Int, alpha:CGFloat = 1.0)
    {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
}

extension UIButton
{
    func setBottomBorder(bkcolor: UIColor, underlineColor: UIColor, fontColor : UIColor)
    {
        self.layer.backgroundColor  = bkcolor.cgColor
        self.layer.masksToBounds    = false
        self.layer.shadowColor      = underlineColor.cgColor
        self.layer.shadowOffset     = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity    = 1.0
        self.layer.shadowRadius     = 0.0
        self.setTitleColor(fontColor, for: .normal)
    }
    
    func setButtonStyle(text_color: UIColor)
    {
        self.layer.cornerRadius     = self.frame.size.height/2
        self.layer.borderWidth      = 1
        self.layer.borderColor      = text_color.cgColor
        self.backgroundColor        = UIColor.clear
        self.setTitleColor(text_color, for: .normal)
    }
    
    func setCornerRadius(radius: CGFloat)
    {
        self.layer.cornerRadius  = radius
        self.layer.masksToBounds = true
    }
}

extension UIActivityIndicatorView
{
    convenience init(activityIndicatorStyle: UIActivityIndicatorView.Style, color: UIColor, placeInTheCenterOf parentView: UIView)
    {
        self.init(style: activityIndicatorStyle)
        center = parentView.center
        self.color = color
        self.hidesWhenStopped = true
        parentView.addSubview(self)
    }
}

extension UITableView
{
    func scrollToTop(animated: Bool)
    {
        setContentOffset(CGPoint.zero, animated: animated)
    }
}


extension UITableViewCell
{
    /// Search up the view hierarchy of the table view cell to find the containing table view
    var tableView: UITableView?
    {
        get {
            var table: UIView? = superview
            while !(table is UITableView) && table != nil {
                table = table?.superview
            }
            
            return table as? UITableView
        }
    }
}

extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
