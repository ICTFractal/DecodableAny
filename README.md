# DecodableAny

次の条件を持つJSON読み込み処理実装で利用できるカスタム型です。

- Decodableプロトコルによる構造体への読み込み
- 1つの項目が場合により複数の型で渡される可能性がある

## 使用方法
DecodableAny.swiftをプロジェクトに追加してください。

## 使用例
次の2パターンでJSONが得られる場合を前提とします。

パターン1：
```
{
  "name": "pattern1",
  "value": "String Value"
}
```

パターン2：
```
{
  "name": "pattern2",
  "value": 12345
}
```

構造体定義
```
struct Sample: Decodable {
    var name: String
    var value: DecodableAny
}
```

読み込み
```
let sample = try! JSONDecoder().decode(Sample.self, from: jsonData)
print(sample.value.stringValue)
```

次の方法で値を参照できます。
- stringValue(String型)
- intValue(Int型)
- doubleValue(Double型)

変換不能な参照(文字列"A"で取得した項目をintValueで参照する等)を行った場合、nilが返ります。