//
//  ViewController.swift
//  coredata database
//
//  Created by Syed.Reshma Ruksana on 21/12/19.
//  Copyright © 2019 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageStackView: UIStackView!
    

    
    @IBOutlet weak var detailsButtonStackView: UIStackView!
    
    
    
    @IBOutlet weak var deleteButtonStackView: UIStackView!
    
    var allImageView = [UIImageView]()
    var allDetailsButton = [UIButton]()
    var allDeleteButton = [UIButton]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true))
        CRUD.deleteAll(entityName: "PersonalDetail")
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        let data = CRUD.fetchData(entityName: "PersonalDetail")


        detailsButtonStackView.spacing = 20
        deleteButtonStackView.spacing = 20
        imageStackView.spacing = 20

        for (i,x) in data.enumerated()
        {
            let imageView = UIImageView()
            imageView.image =  UIImage(data: (x.value(forKey: "image") as! Data))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
            imageView.layer.cornerRadius = 15
            imageView.clipsToBounds = true
            imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
            imageStackView.addArrangedSubview(imageView)
            allImageView.append(imageView)


            let detailsButton = UIButton()
            detailsButton.layer.cornerRadius = 15
            detailsButton.titleLabel?.numberOfLines = 0
            detailsButton.backgroundColor = .red
            detailsButton.setTitle((x.value(forKey: "name") as! String) + "  " + (String(x.value(forKey:"age") as! Int16)) + "\n" + (x.value(forKey: "mail") as! String), for: UIControl.State.normal)
            detailsButtonStackView.addArrangedSubview(detailsButton)
            detailsButton.translatesAutoresizingMaskIntoConstraints = false
            detailsButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
            allDetailsButton.append(detailsButton)


            let deleteButton = UIButton()
            deleteButton.layer.cornerRadius = 15
            deleteButton.setTitle("Delete", for: UIControl.State.normal)
            deleteButton.backgroundColor = .black
            deleteButtonStackView.addArrangedSubview(deleteButton)
            deleteButton.translatesAutoresizingMaskIntoConstraints = false
            deleteButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
            deleteButton.tag = i
            allDeleteButton.append(deleteButton)


        }
    }

    @IBAction func addContact(_ sender: Any) {

        let targetVC = storyboard?.instantiateViewController(identifier: "secondVC") as! SecondViewController

            navigationController?.pushViewController(targetVC, animated: true)


            cleanUI()



        }


        func cleanUI()
        {
            for (x,y) in zip(allDeleteButton,allImageView)
            {
                x.removeFromSuperview()
                y.removeFromSuperview()
            }

            for z in allDetailsButton
            {
                z.removeFromSuperview()
            }

            resetObjectCollectors()

        }


        func resetObjectCollectors()
        {
            allImageView = [UIImageView]()
            allDetailsButton = [UIButton]()
            allDeleteButton = [UIButton]()
        }






}

