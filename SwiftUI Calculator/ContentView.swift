import SwiftUI
import AVFoundation

// 定義計算按鈕類型的枚舉
enum CalculationButton: String {
    case one = "1", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", zero = "0", dot = "."
    case multiply = "x", subtract = "-", addition = "+", equal = "=", divide = "÷"
    case ac = "AC", plusMinus = "±", c = "C"
    case none

    // 按鈕背景顏色
    var backgroundColor: Color {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .dot:
            return Color(.darkGray)
        case .multiply, .subtract, .addition, .equal, .divide:
            return .orange
        default:
            return Color(.lightGray)
        }
    }
}

// 定義計算器環境的 ObservableObject 類別
class GlobalEnvironment: ObservableObject {
    @Published var display = "0"
    var storeValue = ""
    var secondaryStoreValue = ""
    var storeOperator: CalculationButton = .none
    var secondaryStoreOperator: CalculationButton = .none

    // 計算邏輯
    func calculate(_ value: CalculationButton) {
        switch value {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero:
            if display != "0" {
                display += value.rawValue
            } else {
                display = value.rawValue
            }
        case .dot:
            if !display.contains(".") {
                display += "."
            }
        case .multiply, .subtract, .addition, .divide:
            storeValue = display
            storeOperator = value
            display = "0"
        case .equal:
            performCalculation()
        case .ac:
            resetCalculator()
        case .c:
            display = String(display.dropLast())
            if display.isEmpty {
                display = "0"
            }
        case .plusMinus:
            if display.starts(with: "-") {
                display.removeFirst()
            } else {
                display = "-" + display
            }
        default:
            display = ""
        }
    }

    // 執行計算
    private func performCalculation() {
        guard let firstValue = Float(storeValue), let secondValue = Float(display) else { return }
        var result: Float = 0

        switch storeOperator {
        case .multiply:
            result = firstValue * secondValue
        case .subtract:
            result = firstValue - secondValue
        case .addition:
            result = firstValue + secondValue
        case .divide:
            result = firstValue / secondValue
        default:
            break
        }

        display = String(result)
        secondaryStoreValue = String(secondValue)
        secondaryStoreOperator = storeOperator
        storeOperator = .none
    }

    // 重置計算器
    private func resetCalculator() {
        display = "0"
        storeValue = ""
        secondaryStoreValue = ""
        storeOperator = .none
        secondaryStoreOperator = .none
    }
}

// 定義主視圖
struct ContentView: View {
    @EnvironmentObject var env: GlobalEnvironment

    let buttons: [[CalculationButton]] = [
        [.ac, .plusMinus, .c, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .addition],
        [.zero, .dot, .equal]
    ]

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack(spacing: 12) {
                Spacer()

                HStack {
                    Spacer()
                    Text(env.display)
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                        .padding()
                }

                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            CalculatorButtonView(button: button)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

// 定義計算按鈕視圖
struct CalculatorButtonView: View {
    let button: CalculationButton
    @EnvironmentObject var env: GlobalEnvironment

    var body: some View {
        Button(action: {
            env.calculate(button)
            AudioServicesPlaySystemSound(1306)
        }) {
            Text(button.rawValue)
                .font(.system(size: 32))
                .frame(width: buttonWidth(button), height: buttonHeight)
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .cornerRadius(buttonWidth(button) / 2)
        }
    }

    // 計算按鈕寬度
    private func buttonWidth(_ button: CalculationButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }

    // 計算按鈕高度
    private var buttonHeight: CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

// 預覽視圖
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
