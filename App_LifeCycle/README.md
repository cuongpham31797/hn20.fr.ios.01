#  Exercise 2: Application's Life Cycle

## Khi mới run app:
### WillFinishLaunchingWithOptions -> DidFinishLaunchingWithOptions -> DidBecomeActive

## Khi quit app từ multi task:
### WillResignActive -> DidEnterBackground -> WillTerminate

## App bị crash do source code:
### Ko gọi vào hàm nào

## App bị suspended:
### Ko gọi vào hàm nào

## Khi user mở app khác (bằng cách tap vào notification của app đó hoặc mở app đó từ app hiện tại):
### WillResignActive -> DidEnterBackground

