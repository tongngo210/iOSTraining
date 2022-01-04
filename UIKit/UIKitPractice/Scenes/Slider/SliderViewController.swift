import UIKit

final class SliderViewController: UIViewController {

    @IBOutlet private weak var faceImageView: UIImageView!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        let value = Int(sender.value)
        faceImageView.image = RatingCases(rateValue: value)?.emojiImage
        ratingLabel.text = RatingCases(rateValue: value)?.rawValue
    }
}
