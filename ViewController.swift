import UIKit

class ViewController: UIViewController {
    
    //var
    var round = 1
    var score = 0
    var random = 0
    
    //Widgets
    @IBOutlet weak var mSlider: UISlider!
    @IBOutlet weak var TargetValue: UILabel!
    @IBOutlet weak var ScoreValue: UILabel!
    @IBOutlet weak var RoundValue: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        inilializeGame()
        
        print()
 
    }
    
    @IBAction func HitMeAction(_ sender: Any) {
        
        calculScore()
    }

    
    @IBAction func resetGameAction(_ sender: Any) {
        
        inilializeGame()
    }
    
    
    func calculScore(){
        
        
        let playedValue = mSlider.value.rounded()
        let difference = abs(random - Int(playedValue))
        
        if difference == 0 {
            
            score += 100
            round += 1
            random = generateRandomValue()
            
            updateLabels()
            
            promptAction(promptTitle: "Unbeleivable!", promptText: "Bull's Eye! You received 100 points.")
            
        } else if difference <= 5 {
            
            score += 50
            round += 1
            random = generateRandomValue()
            
            updateLabels()
            
            promptAction(promptTitle: "Nice!", promptText: "You were close! You received 50 points.")
            
        } else {
            
            score += 0
            round += 1
            random = generateRandomValue()
            
            updateLabels()
            
            promptAction(promptTitle: "Failed!", promptText: "you're not even close! Try again.")
        }
        
    }
    
    

    
    func generateRandomValue() -> Int {
        
        return Int.random(in: 1..<100)
        
    }
    

    
    
    func inilializeGame(){
        
        random = generateRandomValue()
        TargetValue.text = String(random)
        RoundValue.text = String(round)
        ScoreValue.text = String(score)
        
        let trackInsets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        mSlider.setThumbImage(UIImage(named: "SliderThumb-Normal"), for: .normal)
        
        let minTrackImage = UIImage(named: "SliderTrackLeft")
        let minTrackResizableImage = minTrackImage!.resizableImage(withCapInsets: trackInsets)
        mSlider.setMinimumTrackImage(minTrackResizableImage, for: .normal)
        
        let maxTrackImage = UIImage(named: "SliderTrackRight")
        let maxTrackResizableImage = maxTrackImage!.resizableImage(withCapInsets: trackInsets)
        mSlider.setMaximumTrackImage(maxTrackResizableImage, for: .normal)
        
        mSlider.value = 50
        
    }
    

    
    func promptAction(promptTitle: String, promptText: String){
        
        let alert = UIAlertController(title: promptTitle, message: promptText, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }


    
    func updateLabels(){
        
        TargetValue.text = String(random)
        RoundValue.text = String(round)
        ScoreValue.text = String(score)
        mSlider.value = 50
        
    }

}

