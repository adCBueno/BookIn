import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

    func setupNavigationBar() {
        navigationItem.title = "Settings"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = ColorConstants.headerColor
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .red
    }

    @IBAction func accountSettingButtonAction(_ sender: Any) {
        let editDetailsViewController = EditDetailsViewController(nibName: "EditDetailsViewController", bundle: nil)
        self.navigationController?.pushViewController(editDetailsViewController, animated: true)
    }
}
