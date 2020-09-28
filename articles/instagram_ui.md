#はじめに

コロナ！w、コロナ！wと言っていたら、光陰矢の如く時間が過ぎ去っていた昨今です

さて、今回はUICollectionViewでInstagramのプロフィールっぽいUIをコードだけで実装してみる。
という内容です

この記事が誰かの役に立てば幸いです

ただただSwift初心者がUIを真似して作っただけなので、何かと至らない点があるかと思いますが、
コードの書き方、間違い等、お気づきのところあれば是非アドバイスくださると助かります！！

##完成形

![last_qiita.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/532395/abfe0c7a-483f-0f90-950b-5a6058c7c2f6.gif)

[めっちゃ起業家に憧れるインスタグラマー]

##対象読者

・ iOSアプリ開発初心者の方
・ UICollectionViewの使い方を知りたい方
・ StoryBoardを使用せずに開発してみたい方
・ InstagramのUIが好きな方

##開発環境

・ Version 11.3 (11C29)
・ Swift 5

##完成版 Github

以下にソースコードを載せておきます

https://github.com/Isseymiyamoto/FamousAppUI/tree/master/Instagram_profile/Instagram_profile

##ファイル構成

今回、データの取得等の通信は行わないため`View`、`Controller`フォルダ内に新しいファイルを追加していきます
`Utils` > `Extensions.swift`ではLayout関連の処理を簡素化するための関数を入れていますが、
こちらの記事では詳細を記述しないので、Githubよりコピペしてくださると助かります

![スクリーンショット 2020-09-17 15.46.20.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/532395/fb519665-6ad8-1735-6301-69b493fc5d89.png)

さて、実装に移りましょう

#実装の手順

1、2に関しては、TabBarが必要なければスキップしてください

1. 利用するcontrollerファイルの作成
2. UITabBarControllerを用いて、TabBarと表示するControllerの決定
3. SceneDelegate.swiftにて、起動時に表示するControllerの決定
4. Viewフォルダにて、ProfileHeaderCellの作成
5. Viewフォルダにて、FilterViewの作成
6. Viewフォルダにて、投稿写真表示用のPostCellの作成
7. 合体 and 完成！！


## 1.利用するControllerファイルの作成

ここでは、2で実装するTabBarと連携するためのControllerファイルを作成しましょう
Instagramでは表示するタブアイコンが5つありますので、5つのファイルをControllerフォルダ直下に作成します

```swift:ProfileController.swift
import UIKit

class ProfileController: UICollectionViewController{

  override func viewDidLoad() {
    super.viewDidLoad()

  }

}
```

その他の4ファイルについては以下で結構です

```swift:FeedController.swift

import UIKit

class FeedController: UIViewController{

  override func viewDidLoad() {
    super.viewDidLoad()

    // navigationBarに表示したい文字列を入れましょう
    navigation.item = "投稿"
  }

}
```

## 2.UITabBarControllerを用いて、TabBarと表示するControllerの決定

1にて作成したファイルをTabBarと連携させるために、controllerフォルダ直下に`MainTabController.swift`を作成します

```swift:MainTabController.swift

import UIKit

class MainTabController: UITabBarController{
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewControllers()
    }
        
    // MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        tabBar.tintColor = .black
    }
    
    func configureViewControllers(){
        
        let feed = FeedController()
        let nav1 = templateNavigationController(image: UIImage(systemName: "house"), rootViewController: feed)
        
        let search = SearchController()
        let nav2 = templateNavigationController(image: UIImage(systemName: "magnifyingglass"), rootViewController: search)
        
        let upload = UploadPostController()
        let nav3 = templateNavigationController(image: UIImage(systemName: "plus.app"), rootViewController: upload)
        
        let notification = NotificationController()
        let nav4 = templateNavigationController(image: UIImage(systemName: "heart"), rootViewController: notification)
        // 2件通知きてるかのように表示
        nav4.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        nav4.tabBarItem.badgeValue = "2"
        
        let profile = ProfileController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav5 = templateNavigationController(image: UIImage(systemName: "person"), rootViewController: profile)
        
        // tabバーに配置するControllerを決定
        viewControllers = [nav1, nav2, nav3, nav4, nav5]
        
        // profileControllerを初期表示
        selectedIndex = 4
    }
    
    // 任意のrootViewController、tabIconイメージを設定する関数, configureViewControllers内で使用
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.tintColor = .white
        return nav
    }
}
```

## 3.SceneDelegate.swiftにて、起動時に表示するControllerの決定

さて、SceneDelegate.swiftを編集して、MainTabControllerを起動時に表示するように設定しましょう

```swift:SceneDelegate.swift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  // 省略
  
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = MainTabController()
        window?.makeKeyAndVisible()
    }

  // 省略
}
```

こちら設定後Simulatorを立ち上げると以下のように表示されれば完璧です
![スクリーンショット 2020-09-28 20.04.35.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/532395/1d2f3646-bd38-de06-b35f-303105fc80bd.png)
