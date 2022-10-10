import UIKit
import PlaygroundSupport

// 「PlaygroundPage」:PlaygroundPageとライブビューの状態を構成するために使用するオブジェクト
// 「needsIndefiniteExecution」：無期限実行が有効化どうかをBool値で示す
// デフォルトだとPlaygroundではTimerクラスを継続的に処理させることができないため、できるように記述
PlaygroundPage.current.needsIndefiniteExecution = true

class TrafficLights {
    enum LightColor {  // 信号機の３色を構造体を表すenumで定義
        case red
        case blue
        case yellow
    }
    
    var currentColor = LightColor.red  // 初期値として赤からスタート
    
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
    
    func initTimer() {       // タイマー初期化をメソッド化
            timer?.invalidate()  // タイマーを止める
            count = 0            // タイマーカウントをクリア
        }
    
    // Timerクラスに設定するメソッドは「@objc」キーワードを忘れずに付与する
    @objc func signalChange() {
        count += 1                            // countを1ずつ増やす
        switch currentColor {                 // 現在の信号の色に応じての処理をswitch文で定義
        case .red:
            if count == 5 {                   // 信号は60秒をlimitとするが動作確認のため5秒で仮定義
                initTimer()                   // タイマーを初期化
                currentColor = .blue          // 時間経過後に色を変化
                print("信号が青になりました。")   // 信号の色の変化をprintで表記
                start()                       // 信号の色の変化後に再度タイマー起動
            }
        case .blue:
            if count == 5 {
                initTimer()
                currentColor = .yellow
                print("信号が黄色になりました。")
                start()
            }
        case .yellow:
            if count == 3 {
                initTimer()
                currentColor = .red
                print("信号が赤になりました。")
                start()
            }
        }
    }
}

let trafficLights = TrafficLights()
trafficLights.start()
