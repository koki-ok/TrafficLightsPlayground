import UIKit
import PlaygroundSupport

// 「PlaygroundPage」:PlaygroundPageとライブビューの状態を構成するために使用するオブジェクト
// 「needsIndefiniteExecution」：無期限実行が有効化どうかをBool値で示す
// デフォルトだとPlaygroundではTimerクラスを継続的に処理させることができないため、できるように記述
PlaygroundPage.current.needsIndefiniteExecution = true

// 特定の時間が経過後に起動し、指定されたメッセージをターゲットに送信するタイマー
   var timer: Timer?
   var count: Int = 0
   var limit: Int = 60


    func start() {
        // 任意の箇所でTimerクラスを使用して1秒ごとにcountup()メソッドを実行させるタイマーをセット
        timer = Timer.scheduledTimer(      // 以下タイマー設定デフォルト
            timeInterval: 1,               // タイマーの実行間隔を指定（単位はn秒）
            target: self,                  // selfでおk
            selector: #selector(signalChange),  // timeIntervalごとに実行するメソッドを指定
            userInfo: nil,                 //　nilでおk
            repeats: true                  // 繰り返し処理を実行する場合はtrue
        )
    }
