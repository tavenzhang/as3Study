set tools=E:/protobuf/as3/protocbuf/tools
set out=E:/protobuf/as3/protocbuf/src
set probuf=%tools%/protoc.exe
set plugin=%tools%/as_plugin/protoc-gen-as3.bat
set message=%tools%/message.proto

%probuf% -I %tools% --plugin=protoc-gen-as3=%plugin% --as3_out=%out% %message%
pause