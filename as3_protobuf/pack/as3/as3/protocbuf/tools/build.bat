set tools=D:/research/protocbuf/tools
set out=D:/research/protocbuf/src
set probuf=%tools%/protoc.exe
set plugin=%tools%/as_plugin/protoc-gen-as3.bat
set message=%tools%/message.proto

%probuf% -I %tools% --plugin=protoc-gen-as3=%plugin% --as3_out=%out% %message%
pause