// For MoPub Mediation Rewarded integration, simply just follow MoPub's documentation.
// MoPub HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import MoPubSDK

class Rewarded: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var showAdButton: UIButton!

    var moPubRewarded : MPRewardedAds!
    let adUnitID = "8dd9727a83da481881931243cf05b6a8"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MoPub Mediation Rewarded"
    }

    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        showAdButton.isHidden = true
        MPRewardedAds.setDelegate(self, forAdUnitId: adUnitID)
        MPRewardedAds.loadRewardedAd(withAdUnitID: adUnitID, withMediationSettings: nil)
    }

    @IBAction func showAdTouchUpInside(_ sender: UIButton) {
        if MPRewardedAds.hasAdAvailable(forAdUnitID: adUnitID) {
            MPRewardedAds.presentRewardedAd(forAdUnitID: adUnitID, from: self, with: nil)
        }
    }
}

extension Rewarded : MPRewardedAdsDelegate {
    func rewardedAdDidLoad(forAdUnitID adUnitID: String!) {
        activityIndicator.stopAnimating()
        showAdButton.isHidden = false
    }

    func rewardedAdDidFailToLoad(forAdUnitID adUnitID: String!, error: Error!) {
        activityIndicator.stopAnimating()
    }
    
    func rewardedAdDidDismiss(forAdUnitID adUnitID: String!) {
        showAdButton.isHidden = true
    }
}
