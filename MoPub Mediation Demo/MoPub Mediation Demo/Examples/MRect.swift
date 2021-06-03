// For MoPub Mediation MRect integration, simply just follow MoPub's documentation.
// MoPub HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import MoPubSDK

class MRect: UIViewController {

    @IBOutlet weak var mRectAdContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var moPubMRect : MPAdView!
    let adUnitID = "038dfd33ec4d4391aee61557ffd3ed8b"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MoPub Mediation MRect"
        moPubMRect = MPAdView(adUnitId: adUnitID)
        moPubMRect.frame = CGRect(x: 0, y: 0, width: mRectAdContainer.frame.size.width, height: mRectAdContainer.frame.size.height)
        moPubMRect.delegate = self
        moPubMRect.stopAutomaticallyRefreshingContents()
        mRectAdContainer.addSubview(moPubMRect)
    }

    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        mRectAdContainer.isHidden = true
        moPubMRect.loadAd()
    }
}

extension MRect : MPAdViewDelegate {
    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }

    func adViewDidLoadAd(_ view: MPAdView!, adSize: CGSize) {
        mRectAdContainer.isHidden = false
        activityIndicator.stopAnimating()
    }

    func adView(_ view: MPAdView!, didFailToLoadAdWithError error: Error!) {
        activityIndicator.stopAnimating()
    }
}



