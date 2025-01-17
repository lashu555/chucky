//
//  MusicViewController.swift
//  chucky
//
//  Created by Lasha Tavberidze on 16.01.25.
//

import UIKit

class MusicViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet private weak var categoryTitleLabel: UILabel!
    @IBOutlet private weak var jokeLabel: UILabel!
    //MARK: Properties
    let jokeNetwork = JokeNetwork()
    var currentJoke: Joke?
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTitleLabel.text = "🎶Music🎶"
        updateUI()
        // Do any additional setup after loading the view.
    }
    //MARK: IBActions
    @IBAction private func didTapFunFactButton(_ sender: UIButton) {
        jokeNetwork.fetchAJoke(category: .music) { result in
            switch result{
                case .success(let joke):
                self.currentJoke = joke
            case .failure(let error):
                print("Error: \(error)")
            }
            DispatchQueue.main.async{
                self.updateUI()
            }
        }
    }
    
    //MARK: Private Methods
    private func updateUI(){
        if let joke = currentJoke{
            jokeLabel.text = joke.value
        } else {
            jokeLabel.text = "press the button to fetch"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
