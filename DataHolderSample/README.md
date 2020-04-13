#  Excercise 2:

## Sự khác biệt giữa các folder Document, Library, Tmp:
### Document: thư mục này để lưu trữ dữ liệu của user. Nội dung của thư mục này có thể được chia sẻ thông qua file sharing và back up data bởi iTunes và iCloud. Vì vậy folder này chỉ nên chứa các file mà bạn muốn user thấy.
### Library: thư mục này dùng để lưu trữ các nội dung mà ko phải là dữ liệu của user. Nội dung của thư mục Thư viện (ngoại trừ các Caches subdirector) được iTunes và iCloud sao lưu.
### Tmp: thư mục này để lưu các file ko cần thiết phải tồn tại giữa các lần khởi chạy app. App sẽ xóa các file này khi chúng ko còn cần thiết hoặc system cũng có thể xóa chúng khi app ko chạy. Dữ liệu trong file này sẽ ko được backup qua iTunes và iCloud.

## Các loại data được lưu trong các thư mục trên và mục đích của chúng:
### Document: bất cứ thứ gì bạn muốn user có thể đọc, ghi, sửa, xóa. Có thể là file text, mp3, mp4, jpeg, ...
### Library:  bao gồm các file mà app sử dụng để chạy nhưng vẫn bị ẩn khỏi user. Thư mục này cũng có thể bao gồm các file data, file configure, file template,... được load lên từ app bundle.
### Tmp: bao gồm bất kỳ dữ liệu nào ko cần phải tồn tại trong một khoảng thời gian dài. Hãy nhớ xóa các file đó khi đã hoàn thành chúng để chúng không tiếp tục tiêu tốn dung lượng trên device. System sẽ định kỳ lọc các file này khi app của bạn không chạy.

## Sample tạo folder: xem file FileManagerViewController.swift

