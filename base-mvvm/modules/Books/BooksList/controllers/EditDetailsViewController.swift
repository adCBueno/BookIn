import UIKit

class EditDetailsViewController: UIViewController {

    @IBOutlet weak var signoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title  = "Account Setting"
    }
    
    @IBAction func signoutTapped(_ sender: Any) {
        let logInViewcontroller = LoginViewController(nibName: "LoginViewController", bundle: nil)
         logInViewcontroller.modalPresentationStyle = .fullScreen
         self.navigationController?.present(logInViewcontroller, animated: true, completion: nil)
    }
}
