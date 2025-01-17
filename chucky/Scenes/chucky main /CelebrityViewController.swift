//
//  CelebrityViewController.swift
//  chucky
//
//  Created by Lasha Tavberidze on 14.01.25.
//

import UIKit

class CelebrityViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet private weak var categoryTitleLabel: UILabel!
    @IBOutlet private weak var jokeLabel: UILabel!
    //MARK: Properties
    let jokeNetwork = JokeNetwork()
    var currentJoke: Joke?
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    //MARK: IBActions
    @IBAction private func didTapFunFactButton(_ sender: UIButton) {
        jokeNetwork.fetchAJoke(category: Category.celebrity) { result in
            switch result{
                case .success(let joke):
                self.currentJoke = joke
                case .failure(let error):
                print(error)
            }
            DispatchQueue.main.async{
                self.updateUI()
            }
        }
    }
    
    //MARK: Private Methods
    private func updateUI(){
        categoryTitleLabel.text = "🌟Celebrity🌟"
        if let joke = currentJoke {
            jokeLabel.text = joke.value
        }else {
            jokeLabel.text = "Press Fun Fact Button To Fetch A Joke "
        }
    }
}
