// For MoPub Mediation Interstitial integration, simply just follow MoPub's documentation.
// MoPub HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import MoPubSDK

class Interstitial: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var showAdButton: UIButton!

    var moPubInterstitial : MPInterstitialAdController!
    let adUnitID = "a50d6ad8b2b84ea0af8049b8dfd32126"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MoPub Mediation Interstitial"
    }

    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        showAdButton.isHidden = true
        moPubInterstitial = MPInterstitialAdController (forAdUnitId: adUnitID)
        moPubInterstitial.delegate = self
        moPubInterstitial.loadAd()
    }
    
    @IBAction func showAdTouchUpInside(_ sender: UIButton) {
        if moPubInterstitial.ready {
            moPubInterstitial.show(from: self)
        } else {
            print("Ad wasn't ready")
        }
    }
}

extension Interstitial : MPInterstitialAdControllerDelegate {
    func interstitialDidLoadAd(_ interstitial: MPInterstitialAdController!) {
        activityIndicator.stopAnimating()
        showAdButton.isHidden = false
    }

    func interstitialDidFail(toLoadAd interstitial: MPInterstitialAdController!, withError error: Error!) {
        activityIndicator.stopAnimating()
    }
    
    func interstitialDidDismiss(_ interstitial: MPInterstitialAdController!) {
        showAdButton.isHidden = true
    }
}

