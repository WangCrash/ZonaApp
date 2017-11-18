import UIKit

class MainViewController<DefaultMainPresenter>: StoryboardView, BaseViewController, UITextFieldDelegate {
	
	var lastSearchInput: SearchInputViewModel?

	@IBOutlet weak var inputArea: UIView!
	@IBOutlet weak var searchTextField: UITextField!
	@IBOutlet weak var searchButton: UIButton!
	@IBOutlet var gpsButton: UIButton!
	
	override func setupGUI() {
		searchTextField.rightView = gpsButton
		searchTextField.rightViewMode = .always
		searchTextField.returnKeyType = .search
		searchTextField.delegate = self
		
		searchButton.setTitleColor(.white, for: .normal)
		searchButton.backgroundColor = .black
		
		gpsButton.setTitle("", for: .normal)
		gpsButton.setImage(nil, for: .normal)
		gpsButton.backgroundColor = .black

	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {}
}

