//

import UIKit

class PostsListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func goTo(_ sender: Any) {
        let vc = SignupViewController()
        show(vc, sender: nil)
    }
    
}
