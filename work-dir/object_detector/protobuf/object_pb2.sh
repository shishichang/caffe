python -m grpc.tools.protoc -I./ --python_out=. --grpc_python_out=. ./object.proto
python -m grpc.tools.protoc -I./ --python_out=. --grpc_python_out=. ./common.proto
