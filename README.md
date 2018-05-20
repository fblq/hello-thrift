
### Prepare
```bash
brew install glide
brew install thrift
glide install
glide mirror set https://golang.org/x/net https://github.com/golang/net --vcs git
glide get golang.org/x/net/context
```

### Generate Thrift files
```
thrift --gen go thrift/bill.thrift
```

NOTICE
> `go get git.apache.org/thrift.git/lib/go/thrift` may fail.
> thrift version: 0.11.0 or above

### Build
```bash
mkdir output
go build -o ./output/thrift-client github.com/lnhote/hello-thrift/client
go build -o ./output/thrift-server github.com/lnhote/hello-thrift/server

```

### Run
```bash
./output/server &
./output/client
```

### Thrift
#### Thrift Network Stack

Server - Single-threaded, event-driven etc.

Processor - Compiler generated.

Protocol - JSON, compact etc.

Transport - Raw TCP, HTTP etc.

#### Protocol Layer

The protocol layer provides serialization and deserialization.

Thrift supports the following protocols:

TBinaryProtocol - A straight-forward binary format encoding numeric values as binary, rather than converting to text.

TCompactProtocol - Very efficient, dense encoding of data (See details below).

TDenseProtocol - Similar to TCompactProtocol but strips off the meta information from what is transmitted, and adds it back in at the receiver. TDenseProtocol is still experimental and not yet available in the Java implementation.

TJSONProtocol - Uses JSON for encoding of data.

TSimpleJSONProtocol - A write-only protocol using JSON. Suitable for parsing by scripting languages.

TDebugProtocol - Uses a human-readable text format to aid in debugging.

#### Tranport Layer

The transport layer is responsible for reading from and writing to the wire. Thrift supports the following:

TSocket - Uses blocking socket I/O for transport.

TFramedTransport - Sends data in frames, where each frame is preceded by a length. This transport is required when using a non-blocking server.

TFileTransport - This transport writes to a file. While this transport is not included with the Java implementation, it should be simple enough to implement.

TMemoryTransport - Uses memory for I/O. The Java implementation uses a simple ByteArrayOutputStream internally.

TZlibTransport - Performs compression using zlib. Used in conjunction with another transport. Not available in the Java implementation.