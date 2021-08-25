// For MoPub Mediation Native integration, simply just follow MoPub's documentation.
// MoPub HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import MoPubSDK

class Native: UIViewController {
    
    @IBOutlet weak var nativeAdContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var nativeView: UIView?
    private var nativeAd: MPNativeAd?
    
    let adUnitID = "90d49ff63eb44313886d745617f28c4e"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MoPub Mediation Native"
    }
    
    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        nativeAdContainer.isHidden = true
        activityIndicator.startAnimating()
        
        let settings = MPStaticNativeAdRendererSettings()
        settings.renderingViewClass = NativeAdView.self
        let config = MPStaticNativeAdRenderer.rendererConfiguration(with: settings)
        config?.supportedCustomEvents = ["HyBidMoPubMediationNativeAdCustomEvent"]
        let adRequest = MPNativeAdRequest(adUnitIdentifier: adUnitID, rendererConfigurations: [config!])
        let targeting = MPNativeAdRequestTargeting()
        targeting?.desiredAssets = Set<AnyHashable>([kAdTitleKey, kAdTextKey, kAdCTATextKey, kAdIconImageKey, kAdMainImageKey, kAdStarRatingKey])
        adRequest?.targeting = targeting
        adRequest?.start(completionHandler: { request, response, error in
            if error != nil {
                print(error.debugDescription)
            } else {
                if let response = response {
                    self.processResponse(ad: response)
                }
            }
            self.activityIndicator.stopAnimating()
        })
    }
    
    func processResponse(ad: MPNativeAd) {
        nativeAd = ad
        nativeAd?.delegate = self
        nativeView?.removeFromSuperview()
        do {
            try nativeView = ad.retrieveAdView()
            nativeView?.frame = nativeAdContainer.bounds
            nativeAdContainer.addSubview(nativeView!)
            nativeAdContainer.isHidden = false
        } catch let retrieveError {
            print("Retrieve Error: \(retrieveError)")
        }
        
    }
}

extension Native : MPNativeAdDelegate {
    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }
    
    func willPresentModal(for nativeAd: MPNativeAd!) {
    }
    
    func didDismissModal(for nativeAd: MPNativeAd!) {
    }
    
    func willLeaveApplication(from nativeAd: MPNativeAd!) {
    }
}
