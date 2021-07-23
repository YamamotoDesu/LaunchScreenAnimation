# LaunchScreenAnimation-Swift
Launch Screen Animation in App (Swift 5)  
https://www.youtube.com/watch?v=kbGsI5O9rWY&t=605s

## Requirement
- Xcode Version 12.4 (12D4e)
- Swift 5

## Image
![demo](https://github.com/YamamotoDesu/LaunchScreenAnimation-Swift/blob/main/RocketSim%20Recording%20-%20iPhone%2012%20-%202021-07-23%2000.34.32.gif)  
<br><br>

#### Sample Code
```swift
private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        imageView.center = view.center
        
        // アニメーションが開始するまでの秒数
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.animate()
        }
    }
    
    //画像サイズ変更
    private func animate() {
    　　 // アニメーションの秒数
        UIView.animate(withDuration: 1) {
            //画像サイズ設定
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
            x: -(diffX/2),
            y: diffY/2,
            width: size,
            height: size
            )

        }

        UIView.animate(withDuration: 1.5, animations: {
            self.imageView.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                    let viewControlller = HomeViewController()
                    viewControlller.modalTransitionStyle = .crossDissolve
                    viewControlller.modalPresentationStyle = .fullScreen
                    self.present(viewControlller, animated: true)
                }
            }
        })
    }
```
