import UIKit

final class MainViewController: UIViewController  {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var chooseButton: UIButton!
    
    private let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapChooseImageButton(_ sender: UIButton) {
        
        let libAction = UIAlertAction(title: "Choose From Library",
                                      style: .default) { [weak self] _ in
            self?.showImagePicker(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Take From Camera",
                                         style: .default) { [weak self] _ in
            self?.showImagePicker(sourceType: .camera)
        }
        showActionSheet(title: "Choose your image", message: nil,
                        alertActions: [libAction, cameraAction])
    }
}

extension MainViewController: UIImagePickerControllerDelegate,
                              UINavigationControllerDelegate {
    func showImagePicker(sourceType: UIImagePickerController.SourceType) {
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        navigationController?.present(imagePickerController,
                                      animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = originalImage
        }
        
        dismiss(animated: true, completion: nil)
    }
}
