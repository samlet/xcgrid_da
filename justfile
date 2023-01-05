gen_proto file:
    protoc --dart_out=grpc:lib/src/generated \
                -I{{env_var('PROTOBUF')}}/src \
                -I/opt/app/apiset/entity/src/main/proto \
                -I/opt/app/apiset/proto/src/main/proto \
                -I/opt/app/apiset/mesh/src/main/proto \
                -I/opt/app/apiset/mods/src/main/proto \
                -I/opt/app/apiset/tokenspec/src/main/proto \
                -I/opt/app/apiset/facade/src/main/proto {{file}}

gen_base_proto file:
    protoc --dart_out=grpc:lib/src/generated \
                -I{{env_var('PROTOBUF')}}/src \
                -I/opt/app/apiset/proto/src/main/proto \
                -I/opt/app/apiset/tokenspec/src/main/proto \
                -I/opt/app/apiset/domain/src/main/proto \
                -I/opt/app/apiset/mods/src/main/proto \
                -I/opt/app/apiset/facade/src/main/proto {{file}}

fund:
    just gen_proto {{env_var('PROTOBUF')}}/src/google/protobuf/empty.proto
    just gen_proto {{env_var('PROTOBUF')}}/src/google/protobuf/timestamp.proto
    just gen_proto {{env_var('PROTOBUF')}}/src/google/protobuf/any.proto
    just gen_proto {{env_var('PROTOBUF')}}/src/google/protobuf/struct.proto
    just gen_proto {{env_var('PROTOBUF')}}/src/google/protobuf/wrappers.proto
    just gen_proto {{env_var('PROTOBUF')}}/src/google/protobuf/duration.proto

proto:
    just gen_proto "/opt/app/apiset/proto/src/main/proto/*.proto"

mods:
    just gen_proto "/opt/app/apiset/mods/src/main/proto/extra/*.proto"

tokens:
    just gen_base_proto "/opt/app/apiset/tokenspec/src/main/proto/*.proto"

domain:
    just gen_base_proto "/opt/app/apiset/domain/src/main/proto/*.proto"

