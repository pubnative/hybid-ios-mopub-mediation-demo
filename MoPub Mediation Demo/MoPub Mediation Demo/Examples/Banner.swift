// For MoPub Mediation Banner integration, simply just follow MoPub's documentation.
// MoPub HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import MoPubSDK

class Banner: UIViewController {

    @IBOutlet weak var bannerAdContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var moPubBanner : MPAdView!
    let adUnitID = "8ba4f63a03da4c1ba84653c4bc66d11e"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MoPub Mediation Banner"
        moPubBanner = MPAdView(adUnitId: adUnitID)
        moPubBanner.frame = CGRect(x: 0, y: 0, width: bannerAdContainer.frame.size.width, height: bannerAdContainer.frame.size.height)
        moPubBanner.delegate = self
        moPubBanner.stopAutomaticallyRefreshingContents()
        bannerAdContainer.addSubview(moPubBanner)
    }

    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        bannerAdContainer.isHidden = true
        moPubBanner.loadAd()
    }
}

extension Banner : MPAdViewDelegate {
    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }

    func adViewDidLoadAd(_ view: MPAdView!, adSize: CGSize) {
        bannerAdContainer.isHidden = false
        activityIndicator.stopAnimating()
    }

    func adView(_ view: MPAdView!, didFailToLoadAdWithError error: Error!) {
        activityIndicator.stopAnimating()
    }
}



