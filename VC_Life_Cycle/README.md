#  Excercise 3: View Controller's Life Cycle

## Push screen B từ screen A
### Khi mới run app: Screen A did load -> Screen A will appear -> Screen A did appear
### Khi tap button để push: Screen B did load -> Screen A will disappear -> Screen B will appear -> Screen A did disappear -> Screen B did appear

## Back lại screen A từ screen B
### Khi tap button để back: Screen B will disappear -> Screen A will appear -> Screen B did disappear -> Screen A did appear

## Khi tap nút home để app xuống background rồi vào lại app
### Ko có method nào được gọi
