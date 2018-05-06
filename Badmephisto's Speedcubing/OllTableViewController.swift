//
//  OllTableViewController.swift
//  Badmephisto's Speedcubing
//
//  Created by Martin Ivančo on 22.3.18.
//  Copyright © 2018 martinivanco. All rights reserved.
//

import UIKit

class OllTableViewController: UITableViewController {
    
    static let ollAlgorithmList = ["F (R U R\' U\') F\'",
        "F (R U R\' U\') (R U R\' U\') F\'",
        "y (R\' U\' R) U\' (R\' U R) U\' (R\' U2 R)",
        "f (R U R\' U\') f\'",
        "f (R U R\' U\') (R U R\' U\') f\'",
        "f\' (L\' U\' L U) f",
        "F\' (L\' U\' L U) (L\' U\' L U) F)",
        "[F (R U R\' U\') F\'] U [F (R U R\' U\') F\']",
        "[F\' (L\' U\' L U) F] y [F (R U R\' U\') F\']",
        "[f (R U R\' U\') f\'] U [F (R U R\' U\') F\']",
        "[f (R U R\' U\') f\'] U\' [F (R U R\' U\') F\']",
        "[F (R U R\' U\') F\' ] [f (R U R\' U\') f\']",
        "R U2\' R2\' U\' R2 U\' R2\' U2 R",
        "(r U r\') (R U R\' U\') (r U\' r\')",
        "(l\' U\' l) (L\' U\' L U) (l\' U l)",
        "R\' [F (R U R\' U\') F\'] U R",
        "(R U R\' U\') M\' (U R U\' r\')",
        "M U (R U R\' U\') M2 (U R U\' r\')",
        "F (R U R\' U\') R F\' (r U R\' U\') r\'",
        "(R U R\' U\') (R\' F R F\')",
        "(r U R\' U\') (r\' F R F\')",
        "F\' (r U R\' U\') (r\' F R )",
        "R\' U\' (R\' F R F\') U R",
        "(R U2 R\') (R\' F R F\') U2 (R\' F R F\')",
        "(R U2 R\') (R\' F R F\') (R U2 R\')",
        "M U (R U R\' U\') M\' (R\' F R F\')",
        "(R\' F R\' F\') R2 U2 y (R\' F R F\')",
        "(R U R\' U) (R U\' R\' U\') (R\' F R F\')",
        "(L\' U\' L U\') (L\' U L U) (L F\' L\' F)",
        "(R U R\' U) R d\' R U\' R\' F\'",
        "(R U R\' U) (R\' F R F\') U2 (R\' F R F\')",
        "[F (R U R\' U) F\'] y\' U2 (R\' F R F\')",
        "r\' U2 (R U R\' U) r",
        "(r U R\' U) R U2 r\'",
        "(R U R\' U) R U2 R\'",
        "R U2 R\' U\' R U\' R\'",
        "(R\' F R F\') (R\' F R F\') (R U R\' U\') (R U R\')",
        "[(R U R\' U) R U2 R\'] [F (R U R\' U\') F\']",
        "(r U R\' U) (R U\' R\' U) R U2\' r\'",
        "l\' U\' L U\' L\' U L U\' L\' U2 l",
        "r U2 R\' U\' R U\' r\'",
        "F R U\' R\' U\' R U R\' F\'",
        "r\' U\' R U\' R\' U2 r",
        "M\' U M U2 M\' U M",
        "(R U R2 U\') (R\' F) (R U) (R U\') F\'",
        "F U R U\' R2 F\' R (U R U\' R\')",
        "R\' F R U R\' F\' R y\' (R U\' R\')",
        "R2 [D (R\' U2) R] [D\' (R\' U2) R\']",
        "R\' U2 R2 U R\' U R U2 x\' U\' R\' U",
        "R d L\' d\' R\' U R B R\'",
        "R\' U\' F U R U\' R\' F\' R",
        "R B\' R\' U\' R U B U\' R\'",
        "R\' F R2 B\' R2\' F\' R2 B R\'",
        "(R U R\' U\') R U\' R\' F\' U\' F (R U R\')",
        "(R2 U R\' B\' R) U\' (R2 U R B R\')",
        "(R\' U\' R) y\' x\' (R U\') (R\' F) (R U R\')",
        "R U R\' y R\' F R U\' R\' F\' R"]
    
    static let ollCommentList = ["Simplest OLL of them all.",
        "Just repeat the trigger one more time.",
        "Just repeat the trigger 3 times. The second one is the one I use, its much faster.",
        "Instead of F F\' you now have f and f\'.",
        "Just repeat the RUR\'U\' trigger 2 times.",
        "This is the reflection of P. You are just doing the algorithm with your left hand. It should be quiet easy to transfer it with just a little bit of practice. I execute it more like f\' L\' U\' L U y\' r.",
        "This is reflection of Case 2. Just do the trigger twice.",
        "This is just T, twice, with a U in between.",
        "Reflection of case 1 followed by case 1, with a y rotation in between, and it comes very natural in that position I find.",
        "This is just case 4 followed by case 1, with a U in between.",
        "This is case 10 with a U\' instead of U.",
        "This is T (case 1) followed by P (case 4).This is T (case 1) followed by P (case 4).",
        "You should really learn this algorithm although there is an easier one, because it\'s much faster. It\'s the one everyone fast uses too.",
        "This algorithm is very easy to remember.",
        "Reflection of case 14.",
        "Look how neatly case 1 (T) is placed in middle there :)",
        "I find this one pretty easy to remember too and it flows very nicely. It doesn\'t come up too often though.",
        "This almost never comes up, so skip it if you want. But its not too bad. Note the last part is the same as in case 17.",
        "The second trigger in brackets is almost the RUR\'U\' trigger.",
        "Just the two triggers is all it takes :)",
        "Same as T2 (case 20) but the first R\'s are actually double layer R turn (r).",
        "Same as chameleon (case21) , with the last F\' moved to the front!",
        "There are some setup moves involved here. Note how U R \"undoes\" the R\' U\' you do in beginning.",
        "The R\' R\' is obviously made as a giant R2 in the actual execution.",
        "Incredibly easy to remember, and fast to execute. Again, the R\' R\' is made as a big R2. Note first part is the same as in case 24.",
        "Pretty easy to remember. Also note how similar this algorithm is to case 17.",
        "Be warned that the first trigger is not really R\'FRF\' trigger. But almost.. the second R turn in it is R\', not R.",
        "Very quick to perform. Second part is same as first, but with U\'s instead of Us.",
        "The reflection. Should be easy enough to mirror it.",
        "I use the first one, but both are very good, and its definitely a judgement call per individual.",
        "Easy to remember. Note similarity to case 24.",
        "Easy. This is ALMOST case 1, but with that modified trigger. I execute this by doing y\' R\' U2 instead of the F\' y\' U2. But that\'s a detail. ",
        "Easy.",
        "Slight variation of the trigger and then easy finish.",
        "Very quick OLL. Look what happens to one of the F2L pairs as you execute it. The whole algorithm is just: Take out a pair, move it over, insert it back. It\'s also very similar to case 34.",
        "This algorithm is the same as case 35 in philosophy. Track the F2L pair.",
        "This algorithm was suggested to me by someone, and I kinda like it! To do the R\'FRF\' parts, I actually make a cube rotation x and then execute them as R\'URU\'. ",
        "This is basically the Sune followed by the T(case 1).",
        "Incredibly quick to execute. I love this algorithm. When you execute it, it feels like the two fingers on right and left hand are in battle, flicking towards each other the top layer like crazy :)",
        "This is just reflection of previous case(39). It can be done also from the opposite side of the cube pretty fast.",
        "Quick algorithm. Note how similar it is to 36! Just replace R->r. Uncanny!",
        "Very quick. Note the Y permutation starts with this exactly.",
        "Quick, and very similar to sunes (cases 34-38).",
        "Easy. Look what happens to one of the cross edges. You take it out, do a U2, and put it back from the other side.",
        "Badmephisto couldn\'t decide which of two algorithms is better so I did it for you. This one is much faster.",
        "Note how the last part just inserts an F2L pair back.",
        "Pretty nice algorithm. Last part just inserts F2L pair.",
        "I don\'t like this alg too much. Note the repeating structure.",
        "I don\'t like this one too much either..",
        "There is another version but there is a clumsy B\', so this one is slightly better.",
        "I use another one, but I think this one may be a little better.",
        "Try to use the thumb for the B\'. Pretty clumsy, but after that, it\'s quick.",
        "Again, I do the B\' with my thumb. Awkward alg. Ew..",
        "Flows nicely, no regrips.",
        "Ok, the first R2 is executed in a weird way. You overgrip the R slice to do the R2 both times. After doing the R2\'s you have to be able to the U with a finger flick without a regrip. The alg is actually quite fast. ",
        "After the ugly y\'x\' the alg is incredibly fast. I love executing that part.",
        "I try to use this one. There is another, easy one, but I don\'t think it\'s as fast as this one."]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OllTableViewController.ollAlgorithmList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "oll_cell", for: indexPath) as! OllTableViewCell
        
        cell.OllAlgorithm.text = OllTableViewController.ollAlgorithmList[indexPath.row]
        cell.OllImage.image = UIImage(named: "oll" + String(format: "%02d", indexPath.row + 1))
        
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let detailViewController = segue.destination as? DetailViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedAlgCell = sender as? OllTableViewCell else {
            fatalError("Unexpected sender!")
        }
        
        guard let algIndex = tableView.indexPath(for: selectedAlgCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        detailViewController.algType = "oll"
        detailViewController.algIndex = algIndex.row
    }

}
