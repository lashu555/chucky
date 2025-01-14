//
//  ChuckyViewController.swift
//  chucky
//
//  Created by Lasha Tavberidze on 14.01.25.
//

import UIKit

class ChuckyViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var jokeLabel: UILabel!
    //MARK: Properties
    let jokeNetwork = JokeNetwork()
    var currentJoke: Joke?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    //MARK: IBActions
    @IBAction func didScrollPage(_ sender: UIPageControl) {
        switch sender.currentPage {
            case 0:
            updateUI()
            case 1:
            updateUI()
            case 2:
            updateUI()
            default:
            break
        }
        updateUI()
    }
    @IBAction func didTapFunFactButton(_ sender: UIButton) {
        categoryTitleLabel.text = "🌟Celebrity🌟"
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
        if let joke = currentJoke{
            jokeLabel.text = joke.value
            var categories = ""
            for category in joke.categories{
                if categories.count > 0{
                    categories += "\(category), "
                }else{
                    categories += "\(category)"
                }
            }
            categoryTitleLabel.text = categories
        } else {
            print("Joke is nil")
        }
    }
}

