// For MoPub Mediation Native integration, simply just follow MoPub's documentation.
// MoPub HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import MoPubSDK

class NativeAdView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var callToActionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var privacyInformationIconImageView: UIImageView!
        
    static func nibForAd() -> UINib! {
        return UINib.init(nibName: "NativeAdView", bundle: Bundle.main)
    }
}

extension NativeAdView: MPNativeAdRendering {
    
    func nativeTitleTextLabel() -> UILabel! {
        return titleLabel
    }
    
    func nativeMainTextLabel() -> UILabel! {
        return mainTextLabel
    }
    
    func nativeCallToActionTextLabel() -> UILabel! {
        return callToActionLabel
    }
    
    func nativeIconImageView() -> UIImageView! {
        return iconImageView
    }
    
    func nativeMainImageView() -> UIImageView! {
        return mainImageView
    }
        
    func nativePrivacyInformationIconImageView() -> UIImageView! {
        return privacyInformationIconImageView
    }
}
