//
//  SlidesViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 24.07.2022.
//

import UIKit
import CoreData
import Firebase

class SlidesViewController: UIViewController,UIScrollViewDelegate {
    
    var currentHorizontalOffsett : Double?
    var maxHorizontalOffsett : Double?

    var kullanılanHorizontal : Double?
    var sayfaSayısı: Int?
    
    var myMutableString = NSMutableAttributedString()
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var starButton: UIBarButtonItem!
    
    @IBOutlet weak var bastaButton: UIButton!
    @IBOutlet weak var ortadaButton: UIButton!
    @IBOutlet weak var sondaButton: UIButton!
    
    
    
    
    var selectedSecenek : String!
    var selectedHarf : String!
    
    var slides:[slideUIView] = []
    
    var slideArray = [slideUIView]()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad görüntülendi")
        deneme()

        
        
        starButton.tintColor = .systemYellow
        scrollView.delegate = self
        setScrollView(slides: slides)
        
        //dikey kaymayı kapatmak için
        self.scrollView.contentSize.height = 1.0
        
        
    }

    
    let bTekText = Data().bTekText
    let bTwoText = Data().bTwoText
    let bMoreText = Data().bMoreText
    
    var cTekText = Data().cTekText
    var cTwoText = Data().cTwoText
    var cMoreText = Data().cMoreText
    
    var çTekText = Data().çTekText
    var çTwoText = Data().çTwoText
    var çMoreText = Data().çMoreText
    
    var dTekText = Data().dTekText
    var dTwoText = Data().dTwoText
    var dMoreText = Data().dMoreText
    
    var fTekText = Data().fTekText
    var fTwoText = Data().fTwoText
    var fMoreText = Data().fMoreText
    
    var gTekText = Data().gTekText
    var gTwoText = Data().gTwoText
    var gMoreText = Data().gMoreText
    
    var hTekText = Data().hTekText
    var hTwoText = Data().hTwoText
    var hMoreText = Data().hMoreText
    
    var jTekText = Data().jTekText
    var jTwoText = Data().jTwoText
    var jMoreText = Data().jMoreText
    
    var kTekText = Data().kTekText
    var kTwoText = Data().kTwoText
    var kMoreText = Data().kMoreText
    
    var lTekText = Data().lTekText
    var lTwoText = Data().lTwoText
    var lMoreText = Data().lMoreText
    
    var mTekText = Data().mTekText
    var mTwoText = Data().mTwoText
    var mMoreText = Data().mMoreText
    
    var nTekText = Data().nTekText
    var nTwoText = Data().nTwoText
    var nMoreText = Data().nMoreText
    
    var pTekText = Data().pTekText
    var pTwoText = Data().pTwoText
    var pMoreText = Data().pMoreText
    
    var rTekText = Data().rTekText
    var rTwoText = Data().rTwoText
    var rMoreText = Data().rMoreText
    
    var sTekText = Data().sTekText
    var sTwoText = Data().sTwoText
    var sMoreText = Data().sMoreText
    
    var şTekText = Data().şTekText
    var şTwoText = Data().şTwoText
    var şMoreText = Data().şMoreText
    
    var tTekText = Data().tTekText
    var tTwoText = Data().tTwoText
    var tMoreText = Data().tMoreText
    
    var vTekText = Data().vTekText
    var vTwoText = Data().vTwoText
    var vMoreText = Data().vMoreText
    
    var yTekText = Data().yTekText
    var yTwoText = Data().yTwoText
    var yMoreText = Data().yMoreText
    
    var zTekText = Data().zTekText
    var zTwoText = Data().zTwoText
    var zMoreText = Data().zMoreText

    
    
    
    func deneme() {
        print("deneme fonksyionu görüntülendi")
        if harfSecenek(harf: "B", secenek: "Tek") == true {
            let bTek = fonkOluştur(fonkismi: "bTek", data: bTekText, image: bTekText)
            slides = bTek
            sayfaSayısı = bTekText.count-1
                ortadaButton.isEnabled = false
                ortadaButton.backgroundColor = UIColor.systemGray6
                sondaButton.isEnabled = false
                sondaButton.backgroundColor = UIColor.systemGray6

            
        }
        
        
        if harfSecenek(harf: "B", secenek: "İki") == true {
            let bTwo = fonkOluştur(fonkismi: "bTwo", data: bTwoText, image: bTwoText)
            slides = bTwo
            sayfaSayısı = bTwoText.count-1
            
            
           
            sondaButton.isEnabled = false
            sondaButton.backgroundColor = UIColor.systemGray6
           
            
        }
        
        if harfSecenek(harf: "B", secenek: "Çok") == true {
            let bMore = fonkOluştur(fonkismi: "bMore", data: bMoreText, image: bMoreText)
            slides = bMore
            sayfaSayısı = bMoreText.count-1
         
            sondaButton.isEnabled = false
            sondaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "C", secenek: "Tek") == true {
            let cTek = fonkOluştur(fonkismi: "cTek", data: cTekText, image: cTekText)
            slides = cTek
            sayfaSayısı = cTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
            sondaButton.isEnabled = false
            sondaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "C", secenek: "İki") == true {
            let cTwo = fonkOluştur(fonkismi: "cTwo", data: cTwoText, image: cTwoText)
            slides = cTwo
            sayfaSayısı = cTwoText.count-1
            sondaButton.isEnabled = false
            sondaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "C", secenek: "Çok") == true {
            let cMore = fonkOluştur(fonkismi: "cMore", data: cMoreText, image: cMoreText)
            slides = cMore
            sayfaSayısı = cMoreText.count-1
            sondaButton.isEnabled = false
            sondaButton.backgroundColor = UIColor.systemGray6
        }
        
        
        
        if harfSecenek(harf: "Ç", secenek: "Tek") == true {
            let çTek = fonkOluştur(fonkismi: "çTek", data: çTekText, image: çTekText)
            slides = çTek
            sayfaSayısı = çTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "Ç", secenek: "İki") == true {
            let çTwo = fonkOluştur(fonkismi: "çTwo", data: çTwoText, image: çTwoText)
            slides = çTwo
            sayfaSayısı = çTwoText.count-1
            
        }
        
        if harfSecenek(harf: "Ç", secenek: "Çok") == true {
            let çMore = fonkOluştur(fonkismi: "çMore", data: çMoreText, image: çMoreText)
            slides = çMore
            sayfaSayısı = çMoreText.count-1
           
        }
        
        
        if harfSecenek(harf: "D", secenek: "Tek") == true {
            let dTek = fonkOluştur(fonkismi: "dTek", data: dTekText, image: dTekText)
            slides = dTek
            sayfaSayısı = dTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
            sondaButton.isEnabled = false
            sondaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "D", secenek: "İki") == true {
            let dTwo = fonkOluştur(fonkismi: "dTwo", data: dTwoText, image: dTwoText)
            slides = dTwo
            sayfaSayısı = dTwoText.count-1
            sondaButton.isEnabled = false
            sondaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "D", secenek: "Çok") == true {
            let dMore = fonkOluştur(fonkismi: "dMore", data: dMoreText, image: dMoreText)
            slides = dMore
            sayfaSayısı = dMoreText.count-1
            sondaButton.isEnabled = false
            sondaButton.backgroundColor = UIColor.systemGray6
        }
        
        
        
        
        
        if harfSecenek(harf: "F", secenek: "Tek") == true {
            let fTek = fonkOluştur(fonkismi: "fTek", data: fTekText, image: fTekText)
            slides = fTek
            sayfaSayısı = fTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "F", secenek: "İki") == true {
            let fTwo = fonkOluştur(fonkismi: "fTwo", data: fTwoText, image: fTwoText)
            slides = fTwo
            sayfaSayısı = fTwoText.count-1
            
        }
        
        if harfSecenek(harf: "F", secenek: "Çok") == true {
            let fMore = fonkOluştur(fonkismi: "fMore", data: fMoreText, image: fMoreText)
            slides = fMore
            sayfaSayısı = fMoreText.count-1
          
        }
        
        
        
        
        if harfSecenek(harf: "G", secenek: "Tek") == true {
            let gTek = fonkOluştur(fonkismi: "gTek", data: gTekText, image: gTekText)
            slides = gTek
            sayfaSayısı = gTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
            sondaButton.isEnabled = false
            sondaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "G", secenek: "İki") == true {
            let gTwo = fonkOluştur(fonkismi: "gTwo", data: gTwoText, image: gTwoText)
            slides = gTwo
            sayfaSayısı = gTwoText.count-1
        
        }
        
        if harfSecenek(harf: "G", secenek: "Çok") == true {
            let gMore = fonkOluştur(fonkismi: "gMore", data: gMoreText, image: gMoreText)
            slides = gMore
            sayfaSayısı = gMoreText.count-1
      
        }
        
        
        
        
        if harfSecenek(harf: "H", secenek: "Tek") == true {
            let hTek = fonkOluştur(fonkismi: "hTek", data: hTekText, image: hTekText)
            slides = hTek
            sayfaSayısı = hTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "H", secenek: "İki") == true {
            let hTwo = fonkOluştur(fonkismi: "hTwo", data: hTwoText, image: hTwoText)
            slides = hTwo
            sayfaSayısı = hTwoText.count-1
            
        }
        
        if harfSecenek(harf: "H", secenek: "Çok") == true {
            let hMore = fonkOluştur(fonkismi: "hMore", data: hMoreText, image: hMoreText)
            slides = hMore
            sayfaSayısı = hMoreText.count-1
            sondaButton.isEnabled = false
            sondaButton.backgroundColor = UIColor.systemGray6
        }
        
        
        if harfSecenek(harf: "J", secenek: "Tek") == true {
            let jTek = fonkOluştur(fonkismi: "jTek", data: jTekText, image: jTekText)
            slides = jTek
            sayfaSayısı = jTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "J", secenek: "İki") == true {
            let jTwo = fonkOluştur(fonkismi: "jTwo", data: jTwoText, image: jTwoText)
            slides = jTwo
            sayfaSayısı = jTwoText.count-1
      
        }
        
        if harfSecenek(harf: "J", secenek: "Çok") == true {
            let jMore = fonkOluştur(fonkismi: "jMore", data: jMoreText, image: jMoreText)
            slides = jMore
            sayfaSayısı = jMoreText.count-1
         
        }
        
        
        if harfSecenek(harf: "K", secenek: "Tek") == true {
            let kTek = fonkOluştur(fonkismi: "kTek", data: kTekText, image: kTekText)
            slides = kTek
            sayfaSayısı = kTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "K", secenek: "İki") == true {
            let kTwo = fonkOluştur(fonkismi: "kTwo", data: kTwoText, image: kTwoText)
            slides = kTwo
            sayfaSayısı = kTwoText.count-1
           
        }
        
        if harfSecenek(harf: "K", secenek: "Çok") == true {
            let kMore = fonkOluştur(fonkismi: "kMore", data: kMoreText, image: kMoreText)
            slides = kMore
            sayfaSayısı = kMoreText.count-1
      
        }
        
        if harfSecenek(harf: "L", secenek: "Tek") == true {
            let lTek = fonkOluştur(fonkismi: "lTek", data: lTekText, image: lTekText)
            slides = lTek
            sayfaSayısı = lTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "L", secenek: "İki") == true {
            let lTwo = fonkOluştur(fonkismi: "lTwo", data: lTwoText, image: lTwoText)
            slides = lTwo
            sayfaSayısı = lTwoText.count-1
       
        }
        
        if harfSecenek(harf: "L", secenek: "Çok") == true {
            let lMore = fonkOluştur(fonkismi: "lMore", data: lMoreText, image: lMoreText)
            slides = lMore
            sayfaSayısı = lMoreText.count-1
        
        }
        
        if harfSecenek(harf: "M", secenek: "Tek") == true {
            let mTek = fonkOluştur(fonkismi: "mTek", data: mTekText, image: mTekText)
            slides = mTek
            sayfaSayısı = mTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "M", secenek: "İki") == true {
            let mTwo = fonkOluştur(fonkismi: "mTwo", data: mTwoText, image: mTwoText)
            slides = mTwo
            sayfaSayısı = mTwoText.count-1

        }
        
        if harfSecenek(harf: "M", secenek: "Çok") == true {
            let mMore = fonkOluştur(fonkismi: "mMore", data: mMoreText, image: mMoreText)
            slides = mMore
            sayfaSayısı = mMoreText.count-1
       
        }
        
        if harfSecenek(harf: "N", secenek: "Tek") == true {
            let nTek = fonkOluştur(fonkismi: "nTek", data: nTekText, image: nTekText)
            slides = nTek
            sayfaSayısı = nTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "N", secenek: "İki") == true {
            let nTwo = fonkOluştur(fonkismi: "nTwo", data: nTwoText, image: nTwoText)
            slides = nTwo
            sayfaSayısı = nTwoText.count-1
    
        }
        
        if harfSecenek(harf: "N", secenek: "Çok") == true {
            let nMore = fonkOluştur(fonkismi: "nMore", data: nMoreText, image: nMoreText)
            slides = nMore
            sayfaSayısı = nMoreText.count-1
        
        }
        
        if harfSecenek(harf: "P", secenek: "Tek") == true {
            let pTek = fonkOluştur(fonkismi: "pTek", data: pTekText, image: pTekText)
            slides = pTek
            sayfaSayısı = pTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "P", secenek: "İki") == true {
            let pTwo = fonkOluştur(fonkismi: "pTwo", data: pTwoText, image: pTwoText)
            slides = pTwo
            sayfaSayısı = pTwoText.count-1
      
        }
        
        if harfSecenek(harf: "P", secenek: "Çok") == true {
            let pMore = fonkOluştur(fonkismi: "pMore", data: pMoreText, image: pMoreText)
            slides = pMore
            sayfaSayısı = pMoreText.count-1
      
        }
        
        if harfSecenek(harf: "R", secenek: "Tek") == true {
            let rTek = fonkOluştur(fonkismi: "rTek", data: rTekText, image: rTekText)
            slides = rTek
            sayfaSayısı = rTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "R", secenek: "İki") == true {
            let rTwo = fonkOluştur(fonkismi: "rTwo", data: rTwoText, image: rTwoText)
            slides = rTwo
            sayfaSayısı = rTwoText.count-1
          
        }
        
        if harfSecenek(harf: "R", secenek: "Çok") == true {
            let rMore = fonkOluştur(fonkismi: "rMore", data: rMoreText, image: rMoreText)
            slides = rMore
            sayfaSayısı = rMoreText.count-1
     
        }
        
        
        
        
        if harfSecenek(harf: "S", secenek: "Tek") == true {
            let sTek = fonkOluştur(fonkismi: "sTek", data: sTekText, image: sTekText)
            slides = sTek
            sayfaSayısı = sTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "S", secenek: "İki") == true {
            let sTwo = fonkOluştur(fonkismi: "sTwo", data: sTwoText, image: sTwoText)
            slides = sTwo
            sayfaSayısı = sTwoText.count-1
          
        }
        
        if harfSecenek(harf: "S", secenek: "Çok") == true {
            let sMore = fonkOluştur(fonkismi: "sMore", data: sMoreText, image: sMoreText)
            slides = sMore
            sayfaSayısı = sMoreText.count-1
            
        }
        
        if harfSecenek(harf: "Ş", secenek: "Tek") == true {
            let şTek = fonkOluştur(fonkismi: "şTek", data: şTekText, image: şTekText)
            slides = şTek
            sayfaSayısı = şTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "Ş", secenek: "İki") == true {
            let şTwo = fonkOluştur(fonkismi: "şTwo", data: şTwoText, image: şTwoText)
            slides = şTwo
            sayfaSayısı = şTwoText.count-1
        
        }
        
        if harfSecenek(harf: "Ş", secenek: "Çok") == true {
            let şMore = fonkOluştur(fonkismi: "şMore", data: şMoreText, image: şMoreText)
            slides = şMore
            sayfaSayısı = şMoreText.count-1
        
        }
        
        if harfSecenek(harf: "T", secenek: "Tek") == true {
            let tTek = fonkOluştur(fonkismi: "tTek", data: tTekText, image: tTekText)
            slides = tTek
            sayfaSayısı = tTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "T", secenek: "İki") == true {
            let tTwo = fonkOluştur(fonkismi: "tTwo", data: tTwoText, image: tTwoText)
            slides = tTwo
            sayfaSayısı = tTwoText.count-1
        
        }
        
        if harfSecenek(harf: "T", secenek: "Çok") == true {
            let tMore = fonkOluştur(fonkismi: "tMore", data: tMoreText, image: tMoreText)
            slides = tMore
            sayfaSayısı = tMoreText.count-1
        
        }
        
        if harfSecenek(harf: "V", secenek: "Tek") == true {
            let vTek = fonkOluştur(fonkismi: "vTek", data: vTekText, image: vTekText)
            slides = vTek
            sayfaSayısı = vTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "V", secenek: "İki") == true {
            let vTwo = fonkOluştur(fonkismi: "vTwo", data: vTwoText, image: vTwoText)
            slides = vTwo
            sayfaSayısı = vTwoText.count-1
          
        }
        
        if harfSecenek(harf: "V", secenek: "Çok") == true {
            let vMore = fonkOluştur(fonkismi: "vMore", data: vMoreText, image: vMoreText)
            slides = vMore
            sayfaSayısı = vMoreText.count-1
            sondaButton.isEnabled = false
            sondaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "Y", secenek: "Tek") == true {
            let yTek = fonkOluştur(fonkismi: "yTek", data: yTekText, image: yTekText)
            slides = yTek
            sayfaSayısı = yTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "Y", secenek: "İki") == true {
            let yTwo = fonkOluştur(fonkismi: "yTwo", data: yTwoText, image: yTwoText)
            slides = yTwo
            sayfaSayısı = yTwoText.count-1
        
        }
        
        if harfSecenek(harf: "Y", secenek: "Çok") == true {
            let yMore = fonkOluştur(fonkismi: "yMore", data: yMoreText, image: yMoreText)
            slides = yMore
            sayfaSayısı = yMoreText.count-1
            sondaButton.isEnabled = false
            sondaButton.backgroundColor = UIColor.systemGray6
        }
        
        
        if harfSecenek(harf: "Z", secenek: "Tek") == true {
            let zTek = fonkOluştur(fonkismi: "zTek", data: zTekText, image: zTekText)
            slides = zTek
            sayfaSayısı = zTekText.count-1
            ortadaButton.isEnabled = false
            ortadaButton.backgroundColor = UIColor.systemGray6
        }
        
        if harfSecenek(harf: "Z", secenek: "İki") == true {
            let zTwo = fonkOluştur(fonkismi: "zTwo", data: zTwoText, image: zTwoText)
            slides = zTwo
            sayfaSayısı = zTwoText.count-1
       
        }
        
        if harfSecenek(harf: "Z", secenek: "Çok") == true {
            let zMore = fonkOluştur(fonkismi: "zMore", data: zMoreText, image: zMoreText)
            slides = zMore
            sayfaSayısı = zMoreText.count-1
     
        }
        
        
      
        
        
        
        
    }
    
    
    
    // seçilen harf ve seçenek kontrolü yapıyor
    func harfSecenek(harf: String, secenek: String) -> Bool{
        
        let harf = "\(harf) Harfi"
        let secenek = "\(secenek) Heceli"
        
        var bool = true
        
        if selectedHarf == harf && selectedSecenek == secenek {bool = true}
        else {bool = false}
        
        return bool
    }
    
    
    
    /*
     
     
     
     func bTek() -> [slideUIView]{
     let slide1 :slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
     let slide2 :slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
     let slide3 :slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
     let slide4 :slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
     let slide5 :slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
     let slide6 :slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
     
     
     slide1.imageView.image = UIImage(named: "1")
     slide2.imageView.image = UIImage(named: "2")
     slide3.imageView.image = UIImage(named: "3")
     slide4.imageView.image = UIImage(named: "4")
     slide5.imageView.image = UIImage(named: "5")
     slide6.imageView.image = UIImage(named: "6")
     
     slide1.textLabel.text = "Baba1"
     slide2.textLabel.text = "Bababa2"
     slide3.textLabel.text = "AAAababa3"
     slide4.textLabel.text = "AAAbbaabb"
     slide5.textLabel.text = "ffbbsB"
     slide6.textLabel.text = "YuppikooBBBB"
     
     
     
     
     
     /*
      
      
      // tüm slaytları tek tek gezen FOR döngüsüne sokuyoruz.
      for slide in slideArray {
      
      //tüm slaytlarda text kısmını myMutable yapıyoruz
      myMutableString = NSMutableAttributedString(string: slide.textLabel.text!)
      
      //arrayOluşturma fonksiyonu sayesinde aldığımız tüm indexleri renklendiriyoruz
      //tabi fonksiyona önce ki for döngüsünden tüm slaytların textlerini veriyoruz
      
      for i in arrayOlusturma(a: slide.textLabel.text!){
      myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemOrange, range: NSRange(location: i as! Int, length: 1))
      slide.textLabel.attributedText = myMutableString
      }
      }
      */
     
     
     return slideArray
     }
     
     */
    
    func fonkOluştur(fonkismi: String, data: Array<String>, image: Array<String>) -> [slideUIView]{
        UserDefaults.standard.setValue(data.count, forKey: "\(data)")
        
        func fonkismi() -> [slideUIView]{
            
            var Data = data
            var Image = image
            
            
            for slide in 1...data.count{
                let slide : slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
                slideArray.append(slide)        }
            textVeImageEkleme(slideArray: slideArray, textArray: Data, imageArray: Image)
            
            return slideArray}
        return fonkismi()
    }
    
    
    
    
    
    
    
    
    
    /*
     
     
     func bTek() -> [slideUIView]{
     var bTekText = bTekText
     var bTekImage = bTekImage
     for slide in 1...bTekText.count{
     let slide : slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
     slideArray.append(slide)
     }
     
     textVeImageEkleme(slideArray: slideArray, textArray: bTekText, imageArray: bTekImage)
     return slideArray
     }
     
     var bCiftData = ["bCift1","bCift2","bCift3","bCift4"]
     
     func bCift() -> [slideUIView]{
     var bCiftData = bCiftData
     var dTekImage = ["1","2","3","4"]
     
     for i in 1...bCiftData.count{
     let i : slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
     slideArray.append(i)
     }
     
     textVeImageEkleme(slideArray: slideArray, textArray: bCiftData, imageArray: dTekImage)
     return slideArray
     
     }
     
     func bCok() -> [slideUIView]{
     var dTekData = ["d1 çalıştı","d2","d3"]
     var dTekImage = ["1","2","3"]
     
     for i in 1...dTekData.count{
     let i : slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
     slideArray.append(i)
     }
     textVeImageEkleme(slideArray: slideArray, textArray: dTekData, imageArray: dTekImage)
     return slideArray
     }
     */

    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
     
     
     func cCift() -> [slideUIView]{
     var cCiftData = ["c1","c2","c3"]
     var imageData = ["1","2","3"]
     for i in 1...cCiftData.count{
     let i : slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
     slideArray.append(i)
     }
     textVeImageEkleme(slideArray: slideArray, textArray: cCiftData, imageArray: imageData)
     return slideArray
     }
  
    
    
    func cCok() -> [slideUIView]{
        var cCokData = ["Caca1","Cacacaa2","AAAacba3","AAAbbccaaCc","aabbC-c-C-c"]
        var imageData = ["7","8","9","10","11"]
        
        for i in 1...cCokData.count{
            let i : slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
            slideArray.append(i)
        }
        textVeImageEkleme(slideArray: slideArray, textArray: cCokData, imageArray: imageData)
        return slideArray
    }
    
    
    func dTek() -> [slideUIView]{
        var dTekData = ["d1 çalıştı","d2","d3"]
        var dTekImage = ["1","2","3"]
        
        for i in 1...dTekData.count{
            let i : slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
            slideArray.append(i)
        }
        textVeImageEkleme(slideArray: slideArray, textArray: dTekData, imageArray: dTekImage)
        return slideArray
    }
    
    
    func dCift() -> [slideUIView]{
        var dTekData = ["d1 Cift çalıştı","d2","d3"]
        var dTekImage = ["1","2","3"]
        
        for i in 1...dTekData.count{
            let i : slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
            slideArray.append(i)
        }
        textVeImageEkleme(slideArray: slideArray, textArray: dTekData, imageArray: dTekImage)
        return slideArray
    }
    func dCok() -> [slideUIView]{
        var dTekData = ["d1Cok çalıştı","d2","d3"]
        var dTekImage = ["1","2","3"]
        
        for i in 1...dTekData.count{
            let i : slideUIView = Bundle.main.loadNibNamed("slideView", owner: self,options: nil)?.first as! slideUIView
            slideArray.append(i)
        }
        textVeImageEkleme(slideArray: slideArray, textArray: dTekData, imageArray: dTekImage)
        return slideArray
    }
    
    
    
    
     */
    
    
    
    
    
    
    //    Scrollview bilgileri ve kaydırılabbilir öğelerin eklenmesi
    func setScrollView(slides: [slideUIView])
    {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        
        
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        
        for i in 0 ..< slides.count
        {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        
        //        Dikey durum
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        //        Yatay durum tam tersi muhtemelen
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        //        Yatay ve dikey olarak kaçıncı scrollView'de olduğumuzu anlamak için bulunan view / maximum view
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        

        kullanılanHorizontal = maximumHorizontalOffset / Double(sayfaSayısı!)
        currentHorizontalOffsett = currentHorizontalOffset
        maxHorizontalOffsett = maximumHorizontalOffset

        getDataForStar()
        
    }
    
    
    
    //    her sayfa 414 pixel ileri atıyor. örneğin 5.sayfa = 5-1 = 4 x 414
    @IBAction func bastaButton(_ sender: Any) {
        scrollView.contentOffset.x = 0.0 //sayfa 1
        starButton.title = "başata"
       


        
    }
    @IBAction func ortadaButton(_ sender: Any) {
        sayfaBelirleme(buton: "ortada")
        
       
    }
    
    func sayfaBelirleme(buton: String) {
        var harfArray = ["B","C","Ç","D","F","G","H","J","K","L","M","N","P","R","S","Ş","T","V","Y","Z"]
        var secenekArray = ["Tek","İki","Çok"]
        
        var ortadaOlanSayfalar = [0,21,16, //b : Tek İki Çok seçeneklerinde Ortada olan sayfalar
                                  0,14,5,    //c : same
                                  0,19,10,  // ç: same
                                  0,31,20, //0,21,18,          // d
                                  0,18,8,          //F
                                  0,19,9,//  xG
                                  0,20,11,//H
                                  0,7,7,//J
                                  0,21,20,//K
                                  0,13,10,//L
                                  0,16,13,//M
                                  0,14,7,//"//N"
                                  0,20,21,//P
                                  0,14,4,//R
                                  0,21,21,//S
                                  0,14,10,//Ş
                                  0,20,14,// "//T"
                                  0,13,3,//V
                                  0,20,7,//Y
                                  0,11,4//Z
        ]
        
        var sondaOlanSayfalar =  [0,0,0, // b : same ama Sonda olan sayfalar
                                  0,0,0, // c : same
                                  19,38,19, // // ç: same
                                  32,42,39, //0,0,0,      // d
                                9,37,19, //F
                                  0,39,25,//  G
                                  10,31,0,//H
                                  3,9,11,//J
                                  32,41,39,//K
                                  5,33,30,//L
                                  8,33,33,//M
                                  5,33,26,//"//N"
                                  10,38,37,//P
                                  6,33,22,//R
                                  18,41,41,//S
                                  9,31,23,//Ş
                                  27,39,33,// "//T"
                                  4,33,0,//V
                                  12,39,0,//Y
                                  4,30,14//Z
                                  
                                  
                                  
                                  
        ]
        
        var pixelArray = [Double]()
        var ortadaPixelArray = [Double]()
        
        
        for i in sondaOlanSayfalar{
            let i = i - 1
            pixelArray.append(Double(i)*kullanılanHorizontal!)
        }
        
        for i in ortadaOlanSayfalar {
            let i = i - 1
            
            ortadaPixelArray.append(Double(i)*kullanılanHorizontal!)
        }
        
        var x = 0
        var y = 0
        
        for harf in harfArray{
            x = x + 1
            y = 0
            for secenek in secenekArray{
                y = y + 1
                
                if buton == "ortada"{
                    if harfSecenek(harf: harf, secenek: secenek) == true {scrollView.contentOffset.x = ortadaPixelArray[(x*y)-1]}
                }else if buton == "sonda"{
                    if harfSecenek(harf: harf, secenek: secenek) == true {scrollView.contentOffset.x = pixelArray[(x*y)-1]}
                }
                
                
            }
        }
    }
    
    
    
    @IBAction func sondaButton(_ sender: Any) {
        
        sayfaBelirleme(buton: "sonda")
        
    }
    
    /*
     fonksiyon bir string alıyor ve array veriyor
     denemeArray isimli boş bir array oluşturuyor
     Stringin karakterlerini gezerken her bir indexte X değeri artıyor
     sonra, aldığı stringin tüm karakterlerini gezip, b veya B olunca
     boş arraya mevcut index değerini ekliyor
     sonuç olarak tüm bB içeren indexler eklenmiş oluyor
     */
    
    func renklendirmeArrayiOlusturma(textLabel: String) -> Array<Any>{
        var harfIndexArray = [Int]()
        var x = -1
        for i in textLabel {
            x = x + 1
            if selectedHarf == "B Harfi"{
                if i == "b" {
                    harfIndexArray.append(x)
                }}
            if selectedHarf == "C Harfi"{
                if i == "c"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "Ç Harfi"{
                if i == "ç"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "D Harfi"{
                if i == "d"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "F Harfi"{
                if i == "f"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "G Harfi"{
                if i == "g"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "H Harfi"{
                if i == "h"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "J Harfi"{
                if i == "j"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "K Harfi"{
                if i == "k"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "L Harfi"{
                if i == "l"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "M Harfi"{
                if i == "m"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "N Harfi"{
                if i == "n"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "P Harfi"{
                if i == "p"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "R Harfi"{
                if i == "r"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "S Harfi"{
                if i == "s"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "Ş Harfi"{
                if i == "ş"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "T Harfi"{
                if i == "t"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "V Harfi"{
                if i == "v"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "Y Harfi"{
                if i == "y"{
                    harfIndexArray.append(x)
                }
            }
            if selectedHarf == "Z Harfi"{
                if i == "z"{
                    harfIndexArray.append(x)
                }
            }
            
        }
        return harfIndexArray
    }
    
    /*
     özel fonksiyonları oluştururken, slideArray ile text ve image dizilerini veriyoruz.
     direkt slayta işletiyoruz
     ayrıca harf renklendirmeyi ekliyoruz
     harf renklendirme kısmında ayrıca önceden oluşturduğumuz renklendirmeArrayiOluşturma fonksiyonunu kullanıyoruz
     */
    func textVeImageEkleme (slideArray :[slideUIView], textArray:Array<String>, imageArray:Array<String>) {
        pixelMeselesii()
        var x = 0
        for slide in slideArray{
            slide.textLabel.text = textArray[x]
            slide.imageView.image = UIImage(named: imageArray[x])
            x = x + 1
            
            //tüm slaytlarda text kısmını myMutable yapıyoruz
            myMutableString = NSMutableAttributedString(string: slide.textLabel.text!)
            
            //arrayOluşturma fonksiyonu sayesinde aldığımız tüm indexleri renklendiriyoruz
            //tabi fonksiyona önce ki for döngüsünden tüm slaytların textlerini veriyoruz
            
            for i in renklendirmeArrayiOlusturma(textLabel: slide.textLabel.text!){
                myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemOrange, range: NSRange(location: i as! Int, length: 1))
                slide.textLabel.attributedText = myMutableString
            }
        }
        
        
    }
    var T = 0.0
    var pixelMeselesi = [0.0]
    
    func pixelMeselesii() {
        for i in 0...slideArray.count-1{
            T = T+1.0
            pixelMeselesi.append(T)
        }
    }
    
    var data = [String : Any]()
    
    
    var array1 = ["B","C","Ç","D","F","G","H","J","K","L","M","N","P","R","S","Ş","T","V","Y","Z"]
    var array2 = ["Tek","İki","Çok"]
    func starDefault(_Data : Array<String>){
        var x = 0
        
        for i in _Data{
            
            
            
            if pixelMeselesi[x]*kullanılanHorizontal! <= scrollView.contentOffset.x && scrollView.contentOffset.x <= pixelMeselesi[x+1]*kullanılanHorizontal!-0.5
            {
                if starButton.image == UIImage(systemName: "star.fill") {
                    
                    starButton.image = UIImage(systemName: "star")
                    data["\(i)"] = "yıldızlı değil"
 
                }else { starButton.image = UIImage(systemName: "star.fill")
                    data["\(i)"] = "yıldızlı"
                      
                }
             }
            x = x+1
         }
        
        var dd = 0
        for harf in array1 {
            for sec in array2 {
                if self.harfSecenek(harf: harf, secenek: sec) == true {
                    
                    Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("\(harf)'nin \(sec) Heceli").updateData(self.data)
                 }
               }
            }
          }
        

      
        
        
  
    
    
    
    @IBAction func starButton(_ sender: Any) {
        
 
        
        if harfSecenek(harf: "B", secenek: "Tek") == true {starDefault(_Data: bTekText)}
        if harfSecenek(harf: "B", secenek: "İki") == true {starDefault(_Data: bTwoText)}
        if harfSecenek(harf: "B", secenek: "Çok") == true {starDefault(_Data: bMoreText)}
        
        if harfSecenek(harf: "C", secenek: "Tek") == true {starDefault(_Data: cTekText)}
        if harfSecenek(harf: "C", secenek: "İki") == true {starDefault(_Data: cTwoText)}
        if harfSecenek(harf: "C", secenek: "Çok") == true {starDefault(_Data: cMoreText)}
        
        if harfSecenek(harf: "Ç", secenek: "Tek") == true {starDefault(_Data: çTekText)}
        if harfSecenek(harf: "Ç", secenek: "İki") == true {starDefault(_Data: çTwoText)}
        if harfSecenek(harf: "Ç", secenek: "Çok") == true {starDefault(_Data: çMoreText)}
        
        if harfSecenek(harf: "D", secenek: "Tek") == true {starDefault(_Data: dTekText)}
        if harfSecenek(harf: "D", secenek: "İki") == true {starDefault(_Data: dTwoText)}
        if harfSecenek(harf: "D", secenek: "Çok") == true {starDefault(_Data: dMoreText)}
        
        if harfSecenek(harf: "F", secenek: "Tek") == true {starDefault(_Data: fTekText)}
        if harfSecenek(harf: "F", secenek: "İki") == true {starDefault(_Data: fTwoText)}
        if harfSecenek(harf: "F", secenek: "Çok") == true {starDefault(_Data: fMoreText)}
        
        if harfSecenek(harf: "G", secenek: "Tek") == true {starDefault(_Data: gTekText)}
        if harfSecenek(harf: "G", secenek: "İki") == true {starDefault(_Data: gTwoText)}
        if harfSecenek(harf: "G", secenek: "Çok") == true {starDefault(_Data: gMoreText)}
        
        if harfSecenek(harf: "H", secenek: "Tek") == true {starDefault(_Data: hTekText)}
        if harfSecenek(harf: "H", secenek: "İki") == true {starDefault(_Data: hTwoText)}
        if harfSecenek(harf: "H", secenek: "Çok") == true {starDefault(_Data: hMoreText)}
        
        if harfSecenek(harf: "J", secenek: "Tek") == true {starDefault(_Data: jTekText)}
        if harfSecenek(harf: "J", secenek: "İki") == true {starDefault(_Data: jTwoText)}
        if harfSecenek(harf: "J", secenek: "Çok") == true {starDefault(_Data: jMoreText)}
        
        if harfSecenek(harf: "K", secenek: "Tek") == true {starDefault(_Data: kTekText)}
        if harfSecenek(harf: "K", secenek: "İki") == true {starDefault(_Data: kTwoText)}
        if harfSecenek(harf: "K", secenek: "Çok") == true {starDefault(_Data: kMoreText)}
        
        if harfSecenek(harf: "L", secenek: "Tek") == true {starDefault(_Data: lTekText)}
        if harfSecenek(harf: "L", secenek: "İki") == true {starDefault(_Data: lTwoText)}
        if harfSecenek(harf: "L", secenek: "Çok") == true {starDefault(_Data: lMoreText)}
        
        if harfSecenek(harf: "M", secenek: "Tek") == true {starDefault(_Data: mTekText)}
        if harfSecenek(harf: "M", secenek: "İki") == true {starDefault(_Data: mTwoText)}
        if harfSecenek(harf: "M", secenek: "Çok") == true {starDefault(_Data: mMoreText)}
        
        if harfSecenek(harf: "N", secenek: "Tek") == true {starDefault(_Data: nTekText)}
        if harfSecenek(harf: "N", secenek: "İki") == true {starDefault(_Data: nTwoText)}
        if harfSecenek(harf: "N", secenek: "Çok") == true {starDefault(_Data: nMoreText)}
        
        if harfSecenek(harf: "P", secenek: "Tek") == true {starDefault(_Data: pTekText)}
        if harfSecenek(harf: "P", secenek: "İki") == true {starDefault(_Data: pTwoText)}
        if harfSecenek(harf: "P", secenek: "Çok") == true {starDefault(_Data: pMoreText)}
        
        if harfSecenek(harf: "R", secenek: "Tek") == true {starDefault(_Data: rTekText)}
        if harfSecenek(harf: "R", secenek: "İki") == true {starDefault(_Data: rTwoText)}
        if harfSecenek(harf: "R", secenek: "Çok") == true {starDefault(_Data: rMoreText)}
        
        if harfSecenek(harf: "S", secenek: "Tek") == true {starDefault(_Data: sTekText)}
        if harfSecenek(harf: "S", secenek: "İki") == true {starDefault(_Data: sTwoText)}
        if harfSecenek(harf: "S", secenek: "Çok") == true {starDefault(_Data: sMoreText)}
        
        if harfSecenek(harf: "Ş", secenek: "Tek") == true {starDefault(_Data: şTekText)}
        if harfSecenek(harf: "Ş", secenek: "İki") == true {starDefault(_Data: şTwoText)}
        if harfSecenek(harf: "Ş", secenek: "Çok") == true {starDefault(_Data: şMoreText)}
        
        if harfSecenek(harf: "T", secenek: "Tek") == true {starDefault(_Data: tTekText)}
        if harfSecenek(harf: "T", secenek: "İki") == true {starDefault(_Data: tTwoText)}
        if harfSecenek(harf: "T", secenek: "Çok") == true {starDefault(_Data: tMoreText)}
        
        if harfSecenek(harf: "V", secenek: "Tek") == true {starDefault(_Data: vTekText)}
        if harfSecenek(harf: "V", secenek: "İki") == true {starDefault(_Data: vTwoText)}
        if harfSecenek(harf: "V", secenek: "Çok") == true {starDefault(_Data: vMoreText)}
        
        if harfSecenek(harf: "Y", secenek: "Tek") == true {starDefault(_Data: yTekText)}
        if harfSecenek(harf: "Y", secenek: "İki") == true {starDefault(_Data: yTwoText)}
        if harfSecenek(harf: "Y", secenek: "Çok") == true {starDefault(_Data: yMoreText)}
        
        if harfSecenek(harf: "Z", secenek: "Tek") == true {starDefault(_Data: zTekText)}
        if harfSecenek(harf: "Z", secenek: "İki") == true {starDefault(_Data: zTwoText)}
        if harfSecenek(harf: "Z", secenek: "Çok") == true {starDefault(_Data: zMoreText)}
        
    }
    
    
    func getDataForStar() {

        if harfSecenek(harf: "B", secenek: "Tek") == true {starGetDataDefault(_Data: bTekText)}
        if harfSecenek(harf: "B", secenek: "İki") == true {starGetDataDefault(_Data: bTwoText)}
        if harfSecenek(harf: "B", secenek: "Çok") == true {starGetDataDefault(_Data: bMoreText)}
        
        if harfSecenek(harf: "C", secenek: "Tek") == true {starGetDataDefault(_Data: cTekText)}
        if harfSecenek(harf: "C", secenek: "İki") == true {starGetDataDefault(_Data: cTwoText)}
        if harfSecenek(harf: "C", secenek: "Çok") == true {starGetDataDefault(_Data: cMoreText)}
        
        if harfSecenek(harf: "Ç", secenek: "Tek") == true {starGetDataDefault(_Data: çTekText)}
        if harfSecenek(harf: "Ç", secenek: "İki") == true {starGetDataDefault(_Data: çTwoText)}
        if harfSecenek(harf: "Ç", secenek: "Çok") == true {starGetDataDefault(_Data: çMoreText)}
        
        if harfSecenek(harf: "D", secenek: "Tek") == true {starGetDataDefault(_Data: dTekText)}
        if harfSecenek(harf: "D", secenek: "İki") == true {starGetDataDefault(_Data: dTwoText)}
        if harfSecenek(harf: "D", secenek: "Çok") == true {starGetDataDefault(_Data: dMoreText)}
        
        if harfSecenek(harf: "F", secenek: "Tek") == true {starGetDataDefault(_Data: fTekText)}
        if harfSecenek(harf: "F", secenek: "İki") == true {starGetDataDefault(_Data: fTwoText)}
        if harfSecenek(harf: "F", secenek: "Çok") == true {starGetDataDefault(_Data: fMoreText)}
        
        if harfSecenek(harf: "G", secenek: "Tek") == true {starGetDataDefault(_Data: gTekText)}
        if harfSecenek(harf: "G", secenek: "İki") == true {starGetDataDefault(_Data: gTwoText)}
        if harfSecenek(harf: "G", secenek: "Çok") == true {starGetDataDefault(_Data: gMoreText)}
        
        if harfSecenek(harf: "H", secenek: "Tek") == true {starGetDataDefault(_Data: hTekText)}
        if harfSecenek(harf: "H", secenek: "İki") == true {starGetDataDefault(_Data: hTwoText)}
        if harfSecenek(harf: "H", secenek: "Çok") == true {starGetDataDefault(_Data: hMoreText)}
        
        if harfSecenek(harf: "J", secenek: "Tek") == true {starGetDataDefault(_Data: jTekText)}
        if harfSecenek(harf: "J", secenek: "İki") == true {starGetDataDefault(_Data: jTwoText)}
        if harfSecenek(harf: "J", secenek: "Çok") == true {starGetDataDefault(_Data: jMoreText)}
        
        if harfSecenek(harf: "K", secenek: "Tek") == true {starGetDataDefault(_Data: kTekText)}
        if harfSecenek(harf: "K", secenek: "İki") == true {starGetDataDefault(_Data: kTwoText)}
        if harfSecenek(harf: "K", secenek: "Çok") == true {starGetDataDefault(_Data: kMoreText)}
        
        if harfSecenek(harf: "L", secenek: "Tek") == true {starGetDataDefault(_Data: lTekText)}
        if harfSecenek(harf: "L", secenek: "İki") == true {starGetDataDefault(_Data: lTwoText)}
        if harfSecenek(harf: "L", secenek: "Çok") == true {starGetDataDefault(_Data: lMoreText)}
        
        if harfSecenek(harf: "M", secenek: "Tek") == true {starGetDataDefault(_Data: mTekText)}
        if harfSecenek(harf: "M", secenek: "İki") == true {starGetDataDefault(_Data: mTwoText)}
        if harfSecenek(harf: "M", secenek: "Çok") == true {starGetDataDefault(_Data: mMoreText)}
        
        if harfSecenek(harf: "N", secenek: "Tek") == true {starGetDataDefault(_Data: nTekText)}
        if harfSecenek(harf: "N", secenek: "İki") == true {starGetDataDefault(_Data: nTwoText)}
        if harfSecenek(harf: "N", secenek: "Çok") == true {starGetDataDefault(_Data: nMoreText)}
        
        if harfSecenek(harf: "P", secenek: "Tek") == true {starGetDataDefault(_Data: pTekText)}
        if harfSecenek(harf: "P", secenek: "İki") == true {starGetDataDefault(_Data: pTwoText)}
        if harfSecenek(harf: "P", secenek: "Çok") == true {starGetDataDefault(_Data: pMoreText)}
        
        if harfSecenek(harf: "R", secenek: "Tek") == true {starGetDataDefault(_Data: rTekText)}
        if harfSecenek(harf: "R", secenek: "İki") == true {starGetDataDefault(_Data: rTwoText)}
        if harfSecenek(harf: "R", secenek: "Çok") == true {starGetDataDefault(_Data: rMoreText)}
        
        if harfSecenek(harf: "S", secenek: "Tek") == true {starGetDataDefault(_Data: sTekText)}
        if harfSecenek(harf: "S", secenek: "İki") == true {starGetDataDefault(_Data: sTwoText)}
        if harfSecenek(harf: "S", secenek: "Çok") == true {starGetDataDefault(_Data: sMoreText)}
        
        if harfSecenek(harf: "Ş", secenek: "Tek") == true {starGetDataDefault(_Data: şTekText)}
        if harfSecenek(harf: "Ş", secenek: "İki") == true {starGetDataDefault(_Data: şTwoText)}
        if harfSecenek(harf: "Ş", secenek: "Çok") == true {starGetDataDefault(_Data: şMoreText)}
        
        if harfSecenek(harf: "T", secenek: "Tek") == true {starGetDataDefault(_Data: tTekText)}
        if harfSecenek(harf: "T", secenek: "İki") == true {starGetDataDefault(_Data: tTwoText)}
        if harfSecenek(harf: "T", secenek: "Çok") == true {starGetDataDefault(_Data: tMoreText)}
        
        if harfSecenek(harf: "V", secenek: "Tek") == true {starGetDataDefault(_Data: vTekText)}
        if harfSecenek(harf: "V", secenek: "İki") == true {starGetDataDefault(_Data: vTwoText)}
        if harfSecenek(harf: "V", secenek: "Çok") == true {starGetDataDefault(_Data: vMoreText)}
        
        if harfSecenek(harf: "Y", secenek: "Tek") == true {starGetDataDefault(_Data: yTekText)}
        if harfSecenek(harf: "Y", secenek: "İki") == true {starGetDataDefault(_Data: yTwoText)}
        if harfSecenek(harf: "Y", secenek: "Çok") == true {starGetDataDefault(_Data: yMoreText)}
        
        if harfSecenek(harf: "Z", secenek: "Tek") == true {starGetDataDefault(_Data: zTekText)}
        if harfSecenek(harf: "Z", secenek: "İki") == true {starGetDataDefault(_Data: zTwoText)}
        if harfSecenek(harf: "Z", secenek: "Çok") == true {starGetDataDefault(_Data: zMoreText)}
        
        
        
         
    }
    
    // bu fonksiyonda userDefoult'a kelime isimleri ile kayıt ettiğimiz keylerin valuelerini yani star mı star.fill mi, veri çekerek tekrar belirtiyorduk.
    
    func starGetDataDefault(_Data : Array<String>) {
        var documentName = ""
        
        var array3 = [bTekText,bTwoText,bMoreText,cTekText,cTwoText,cMoreText,çTekText,çTwoText,çMoreText,dTekText,dTwoText,dMoreText,fTekText,fTwoText,fMoreText,gTekText,gTwoText,gMoreText,hTekText,hTwoText,hMoreText,jTekText,jTwoText,jMoreText,kTekText,kTwoText,kMoreText,lTekText,lTwoText,lMoreText,mTekText,mTwoText,mMoreText,nTekText,nTwoText,nMoreText,pTekText,pTwoText,pMoreText,rTekText,rTwoText,rMoreText,sTekText,sTwoText,sMoreText,şTekText,şTwoText,şMoreText,tTekText,tTwoText,tMoreText,vTekText,vTwoText,vMoreText,yTekText,yTwoText,yMoreText,zTekText,zTwoText,zMoreText]
        var sayı = 0
        for arrayName in array3 {
            
            if _Data == arrayName {documentName = "\(array1[sayı/3])'nin \(array2[sayı%3]) Heceli"}
            sayı = sayı + 1
        }
   
        var abc = 0
        for kelime in _Data{
            
            if pixelMeselesi[abc]*kullanılanHorizontal! <= scrollView.contentOffset.x && scrollView.contentOffset.x <= pixelMeselesi[abc+1]*kullanılanHorizontal!-0.5 {

                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").addSnapshotListener { snapshot, error in
                            if error != nil {print("yıldız verisi çekerken error")}
                            else{
                                for document in snapshot!.documents {

                                    if document.documentID == documentName{

                                        for keys in document.data().keys {
                                           
                                            if keys == kelime {
                                             if document[keys] as! String == "yıldızlı" {
                                                 self.starButton.image = UIImage(systemName: "star.fill")
                                             }else {
                                                 self.starButton.image = UIImage(systemName: "star")
                                                   }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        abc = abc + 1
                    }
                }
    
    
    
}
        


        
        






