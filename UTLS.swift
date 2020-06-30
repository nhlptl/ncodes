//
//  Utils.swift
//  PropertyIcon
//
//  Created by TBI-iOS-02 on 07/03/19.
//  Copyright © 2019 TBI-iOS-02. All rights reserved.
//


import UIKit
import AVKit
import AVFoundation
import SVProgressHUD

class Utils: NSObject
{
    var objAJProgressView = AJProgressView()
    static var instance = Utils()
    
    class func getAppName() -> String
    {
        let infoDictionary: NSDictionary = (Bundle.main.infoDictionary as NSDictionary?)!
        let appName: NSString = infoDictionary.object(forKey: "CFBundleName") as! NSString
        return appName as String
    }
    
    class func getAppVersion() -> String
    {
        let infoDictionary: NSDictionary = (Bundle.main.infoDictionary as NSDictionary?)!
        let appName: NSString = infoDictionary.object(forKey: "CFBundleShortVersionString") as! NSString
        return appName as String
    }
    
    //===
    
    /*
    class func bannerAD (adBannerView: GADBannerView, VC : UIViewController, delegate: GADBannerViewDelegate)
    {
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        adBannerView.adUnitID = Constant.bannerAdUnitID
        adBannerView.rootViewController = VC
        adBannerView.delegate = delegate
        adBannerView.load(GADRequest())
    }
    
    class func createAndLoadInterstitial(delegate: GADInterstitialDelegate) -> GADInterstitial
    {
        let interstitial = GADInterstitial(adUnitID: Constant.interstitialAdUnitID)
        interstitial.delegate = delegate
        interstitial.load(GADRequest())
        return interstitial
    }
    
    class func createAndLoadRewardedAd() -> GADRewardedAd {
      let rewardedAd = GADRewardedAd(adUnitID: Constant.rewardedAdUnitID)
        rewardedAd.load(GADRequest()) { error in
        if let error = error {
          print("Loading failed: \(error)")
        } else {
          print("Loading Succeeded")
        }
      }
      return rewardedAd
    }
    */
    
    //===

    class func getCurrentTime() -> String
    {
        let date        = Date()
        let calender    = Calendar.current
        let components  = calender.dateComponents([.hour,.minute,.second], from: date)
        var hour        = String()
        var minutes     = String()
        
        if components.hour! < 10
        {
            hour = String("0\(components.hour!)")
        }
        else
        {
            hour = String("\(components.hour!)")
        }
        
        if components.minute! < 10
        {
            minutes = String("0\(components.minute!)")
        }
        else
        {
            minutes = String("\(components.minute!)")
        }
        
        let currentTime = "\(hour):\(minutes)"
        return currentTime
    }
    
    class func getcurrentDate() -> String
    {
        let date        = Date()
        let calender    = Calendar.current
        let components  = calender.dateComponents([.day,.month,.year], from: date)
        var day         = String()
        var month       = String()
        
        if components.day! < 10
        {
            day = String("0\(components.day!)")
        }
        else
        {
            day = String("\(components.day!)")
        }
        
        if components.month! < 10
        {
            month = String("0\(components.month!)")
        }
        else
        {
            month = String("\(components.month!)")
        }
        
        let todayDate = "\(components.year!)/\(month)/\(day)"
        return todayDate
    }
    
    class func getTodaysDay() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayName: String = dateFormatter.string(from: Date())
        
        return dayName
    }
    
    class func getCurrentDateTimeInIST() -> String
    {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let defaultTimeZoneStr = formatter.string(from: date as Date)
        formatter.timeZone = NSTimeZone(abbreviation: "IST")! as TimeZone
        let cstTimeZoneStr = formatter.string(from: date as Date)
        return cstTimeZoneStr
    }
    
    class func getDateInLOCALFormat(_ strDate: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        var gmt = NSTimeZone(abbreviation: "IST")
        dateFormatter.timeZone = gmt! as TimeZone
        
        let date: Date? = dateFormatter.date(from: strDate)
        gmt = NSTimeZone.system as NSTimeZone
        dateFormatter.timeZone = gmt! as TimeZone
        dateFormatter.dateFormat = "d MMM, yyyy"
        var timeStamp: String = dateFormatter.string(from: date!)
        
        if (timeStamp.count) <= 0 {
            timeStamp = ""
        }
        
        return timeStamp
    }
    
    class func getTimeInLOCALFormat(_ strDate: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        var gmt = NSTimeZone(abbreviation: "IST")
        dateFormatter.timeZone = gmt! as TimeZone
        
        let date: Date? = dateFormatter.date(from: strDate)
        gmt = NSTimeZone.system as NSTimeZone
        dateFormatter.timeZone   = gmt! as TimeZone
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.amSymbol   = "am"
        dateFormatter.pmSymbol   = "pm"
        var timeStamp: String    = dateFormatter.string(from: date!)
        
        if (timeStamp.count) <= 0 {
            timeStamp = ""
        }
        
        return timeStamp
    }
    
    
    func getFormatedDOB(_ strDate: String, originalFormat: String, responseFormat: String) -> String
    {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = originalFormat
        
        let date: Date? = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = responseFormat
        
        var timeStamp: String = dateFormatter.string(from: date!)
        if (timeStamp.count) <= 0 {
            timeStamp = ""
        }
        return timeStamp
    }
    
    // --
    
    class func showToastMessage(message: String)
    {
        var toast: MBProgressHUD = MBProgressHUD()
        toast            = MBProgressHUD.showAdded(to: UIApplication.shared.windows[0], animated: true)
        toast.label.text = message
        toast.mode       = MBProgressHUDMode.text
        toast.offset.y   = CGFloat((Float(UIApplication.shared.windows[0].frame.size.height) / 2) - 50)
        
        toast.removeFromSuperViewOnHide = true
        toast.hide(animated: true, afterDelay: 1.5) //0.5
    }
    
    // To display message uialertController
    class func displayMessage(viewController: UIViewController , userMessage:String) -> Void
    {
        DispatchQueue.main.async
            {
                let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    
                    // Code in this block will trigger when OK button tapped.
                    print("Ok button tapped")
                    DispatchQueue.main.async
                        {
                            //viewController.dismiss(animated: true, completion: nil)
                        }
                }
                
                alertController.addAction(OKAction)
                
                viewController.present(alertController, animated: true, completion:nil)
            }
    }
    
    class func Show(message:String = "Please Wait")
    {
        var load : MBProgressHUD = MBProgressHUD()
        
        load = MBProgressHUD.showAdded(to: UIApplication.shared.windows[0], animated: true)
        //        load.mode = MBProgressHUDMode.Indeterminate
        load.label.text = message
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        UIApplication.shared.windows[0].addSubview(load)
    }
    
    class func HideHud()
    {
        MBProgressHUD.hide(for: UIApplication.shared.windows[0], animated: true)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    // For Show SVProgressHUD
    class func showSVProgressHUD()
    {
        SVProgressHUD.setBackgroundColor(UIColor.clear)
        SVProgressHUD.setRingThickness(4)
        SVProgressHUD.setForegroundColor(#colorLiteral(red: 0.04463874549, green: 0.0871329084, blue: 0.1960492134, alpha: 1))
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
    }
    
    class func dismissSVProgressHUD()
    {
        SVProgressHUD.dismiss()
    }
    
    class func showAlert(controller: UIViewController, title:String, message:String)
    {
        let alertView = UIAlertController(title: title, message: message, preferredStyle:.alert)
        let btnOK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertView.addAction(btnOK)
        controller.present(alertView, animated: true, completion: nil)
    }
    
    class func showSCAlertWarning(viewcontroller: UIViewController, title: String, message: String)
    {
        let alert:SCLAlertView = SCLAlertView()
        
        alert.showAnimationType = .SlideInToCenter
        
        alert.addButton("Ok", actionBlock: {
            
        })
        
        alert.showWarning(viewcontroller, title: message, subTitle: title, closeButtonTitle: nil, duration: 0)
    }
    
    
    class func showSCAlert(viewController: UIViewController, message: String)
    {
        let alert:SCLAlertView = SCLAlertView()
        
        alert.showAnimationType = .SlideInToCenter
        alert.addButton("Ok", actionBlock: {
            
        })
        
        alert.showCustom(viewController, image: UIImage(named: "popup_logo"), color: Constant.theme_color, title: Utils.getAppName(), subTitle: message, closeButtonTitle: nil, duration: 0)
        
    }
    
    class func showSCSuccessAlert(viewController: UIViewController, message: String)
    {
        
        //        let appearance = SCLAlertView.SCLAppearance(kCircleIconHeight:60 ,showCloseButton: false, showCircularIcon: true)
        //        let alert = SCLAlertView(appearance: appearance)
        //        _ = alert.addButton("OK", action: {
        //
        //            alert.dismiss(animated: true, completion: nil)
        //
        //        })
        //        alert.showSuccess(Utils.getAppName(), subTitle: message)
        
        let alert:SCLAlertView = SCLAlertView()
        
        alert.showAnimationType = .SlideInFromTop
        alert.addButton("Ok", actionBlock: {
            
        })
        
        alert.showSuccess(viewController, title: Utils.getAppName(), subTitle: message, closeButtonTitle: nil, duration: 0)
        
    }
    
    func handleCancel(alertView: UIAlertAction!)
    {
        
    }
    
    class func showHud(in view : UIView, borderColor: UIColor, image: UIImage)
    {
        instance.objAJProgressView.imgLogo = image
        
        // Pass the color for the layer of progressView
        instance.objAJProgressView.firstColor = borderColor
        
        // If you  want to have layer of animated colors you can also add second and third color
        //        instance.objAJProgressView.secondColor = StructId.theme_pink
        //        instance.objAJProgressView.thirdColor = #colorLiteral(red: 0.001609396073, green: 0.6759747267, blue: 0.9307156205, alpha: 1)
        
        // Set duration to control the speed of progressView
        instance.objAJProgressView.duration = 2.0
        
        // Set width of layer of progressView
        instance.objAJProgressView.lineWidth = 2.0
        
        //Set backgroundColor of progressView
        instance.objAJProgressView.bgColor =  UIColor.lightGray.withAlphaComponent(0.1)
        
        //Get the status of progressView, if view is animating it will return true.
        _ = instance.objAJProgressView.isAnimating
        
        view.isUserInteractionEnabled = false
        
        instance.objAJProgressView.show()
    }
    
    class func hideHud(in view : UIView)
    {
        view.isUserInteractionEnabled = true
        instance.objAJProgressView.hide()
    }
    
    class func showAlertIN(controller: UIViewController, title:String, message:String)
    {
        let alertView = UIAlertController(title: title, message: message, preferredStyle:.alert)
        
        let btnOK = UIAlertAction(title: "ok", style: .default, handler: nil)
       
        let btnCancel = UIAlertAction(title: "cancel", style: .cancel) { (action) in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)
            {
                UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4)
                {
                    exit(0)
                }
            }
        }
        
        alertView.addAction(btnCancel)
        alertView.addAction(btnOK)
        controller.present(alertView, animated: true, completion: nil)
    }
    
    class func checkIfAlertViewHasPresented() -> UIAlertController?
    {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            if topController is UIAlertController {
                return (topController as! UIAlertController)
            } else {
                return nil
            }
        }
        return nil
    }
    
    // --
    
    
    
    // --
    
    //MARK:- No data in tableview show this label
    class func showNoDataLabel(width:CGFloat,height:CGFloat) -> UILabel
    {
        let msglbl               = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        msglbl.text          = "No data available";
        msglbl.textAlignment = NSTextAlignment.center;
        msglbl.font          = UIFont(name: "overpass-regular", size: 16)
        msglbl.textColor     = UIColor.black
        msglbl.sizeToFit()
        return msglbl
    }
    
    class func showNoDataLabel(width:CGFloat,height:CGFloat, strAltMsg: String) -> UIView
    {
        
        let noDataView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        let msglbl               = UILabel(frame: CGRect(x: 12, y: 25, width: noDataView.frame.size.width-24, height: height-50))
        msglbl.text          = strAltMsg
        msglbl.textAlignment = .center
        msglbl.font          = UIFont(name: "overpass-regular", size: 16.0)
        msglbl.numberOfLines = 0
        msglbl.textColor     = UIColor.lightGray //UIColor(white: 0.9, alpha: 1.0)
        
        noDataView.addSubview(msglbl)
        return noDataView
    }
    
    class func getSectionWithnoDataLabel(_ arrTemp:[AnyObject], tableView tblTemp: UITableView, noDataLabelMessage strTemp: String) -> Int
    {
        var numOfSections: Int = 0
        
        if arrTemp.count != 0
        {
            numOfSections = 1
            tblTemp.backgroundView  = nil
            tblTemp.tableFooterView = UIView.init()
        }
        else
        {
            let noDataLabel               = UILabel(frame: CGRect(x: 0, y: 0, width: tblTemp.bounds.size.width, height: tblTemp.bounds.size.height))
            noDataLabel.text          = strTemp
            noDataLabel.numberOfLines = 0
            noDataLabel.font          = UIFont(name: "overpass-regular", size: 16)!
            noDataLabel.textColor     = UIColor(red: 181.0/255.0, green: 181.0/255.0, blue: 181.0/255.0, alpha: 1.0)    //UIColor(hexString: "696969")
            noDataLabel.textAlignment = .center
            noDataLabel.lineBreakMode = .byWordWrapping
            
            let backView  = UIView(frame: CGRect(x: 0, y: 0, width: tblTemp.bounds.size.width, height: tblTemp.bounds.size.height))
            backView.backgroundColor  = Constant.backgoundColor
            backView.addSubview(noDataLabel)
            
            tblTemp.backgroundView    = backView
            tblTemp.separatorStyle    = .none
            tblTemp.tableFooterView   = nil
        }
        
        return numOfSections
    }
    
    
    // --
    
    
    // --
    
    class func trimString(_ text: String) -> String
    {
        let trimmedString: String = text.trimmingCharacters(in: CharacterSet.whitespaces)
        return trimmedString
    }
    
    class func validateEmail(_ emailStr: String) -> Bool
    {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest  = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: emailStr)
    }
    
    class func validatePhoneNumber(_ phoneNoStr: String) -> Bool
    {
        let phoneNoRegex = "^(\\+?)(\\d{10})$"
        let phoneNoTest  = NSPredicate(format: "SELF MATCHES %@", phoneNoRegex)
        return phoneNoTest.evaluate(with: phoneNoStr)
    }
    
    class func getAddressString(addressInfo: NSDictionary) -> String
    {
        var addressString     = ""
        let strAdd1           = addressInfo["address1"] as! String
        let strAdd2           = addressInfo["address2"] as! String
        let strAdd3           = addressInfo["address3"] as! String
        let strCity           = addressInfo["city"] as! String
        let strState          = addressInfo["state"] as! String
        let strPincode        = addressInfo["pincode"] as! String
        
        addressString         = "\(strAdd1), \(strAdd2), \(strAdd3), \(strCity), \(strState)-\(strPincode)"
        
        return addressString
    }
    
    // --
    
}
