import ballerina/grpc;
import ballerina/protobuf;

public const string SIMPLE_DESC = "0A0C73696D706C652E70726F746F120873686F7070696E6722A6010A0750726F6475637412120A046E616D6518012001280952046E616D6512200A0B6465736372697074696F6E180220012809520B6465736372697074696F6E12140A0570726963651803200128015205707269636512250A0E73746F636B5F7175616E74697479180420012805520D73746F636B5175616E7469747912100A03736B751805200128095203736B7512160A06737461747573180620012809520673746174757322580A0F50726F64756374526573706F6E736512180A076D65737361676518012001280952076D657373616765122B0A0770726F6475637418022001280B32112E73686F7070696E672E50726F64756374520770726F64756374221D0A0950726F64756374496412100A03736B751801200128095203736B75223C0A0B50726F647563744C697374122D0A0870726F647563747318012003280B32112E73686F7070696E672E50726F64756374520870726F6475637473223C0A045573657212170A07757365725F69641801200128095206757365724964121B0A09757365725F747970651802200128095208757365725479706522280A0C55736572526573706F6E736512180A076D65737361676518012001280952076D65737361676522070A05456D70747922380A0B436172745265717565737412170A07757365725F6964180120012809520675736572496412100A03736B751802200128095203736B7522280A0C43617274526573706F6E736512180A076D65737361676518012001280952076D65737361676522210A0655736572496412170A07757365725F6964180120012809520675736572496422290A0D4F72646572526573706F6E736512180A076D65737361676518012001280952076D65737361676532F9030A0F53686F7070696E6753657276696365123A0A0A41646450726F6475637412112E73686F7070696E672E50726F647563741A192E73686F7070696E672E50726F64756374526573706F6E736512370A0B4372656174655573657273120E2E73686F7070696E672E557365721A162E73686F7070696E672E55736572526573706F6E73652801123D0A0D55706461746550726F6475637412112E73686F7070696E672E50726F647563741A192E73686F7070696E672E50726F64756374526573706F6E7365123B0A0D52656D6F766550726F6475637412132E73686F7070696E672E50726F6475637449641A152E73686F7070696E672E50726F647563744C697374123F0A154C697374417661696C61626C6550726F6475637473120F2E73686F7070696E672E456D7074791A152E73686F7070696E672E50726F647563744C697374123F0A0D53656172636850726F6475637412132E73686F7070696E672E50726F6475637449641A192E73686F7070696E672E50726F64756374526573706F6E7365123A0A09416464546F4361727412152E73686F7070696E672E43617274526571756573741A162E73686F7070696E672E43617274526573706F6E736512370A0A506C6163654F7264657212102E73686F7070696E672E5573657249641A172E73686F7070696E672E4F72646572526573706F6E7365620670726F746F33";

public isolated client class ShoppingServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, SIMPLE_DESC);
    }

    isolated remote function AddProduct(Product|ContextProduct req) returns ProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        Product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/AddProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductResponse>result;
    }

    isolated remote function AddProductContext(Product|ContextProduct req) returns ContextProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        Product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/AddProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductResponse>result, headers: respHeaders};
    }

    isolated remote function UpdateProduct(Product|ContextProduct req) returns ProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        Product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/UpdateProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductResponse>result;
    }

    isolated remote function UpdateProductContext(Product|ContextProduct req) returns ContextProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        Product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/UpdateProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductResponse>result, headers: respHeaders};
    }

    isolated remote function RemoveProduct(ProductId|ContextProductId req) returns ProductList|grpc:Error {
        map<string|string[]> headers = {};
        ProductId message;
        if req is ContextProductId {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/RemoveProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductList>result;
    }

    isolated remote function RemoveProductContext(ProductId|ContextProductId req) returns ContextProductList|grpc:Error {
        map<string|string[]> headers = {};
        ProductId message;
        if req is ContextProductId {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/RemoveProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductList>result, headers: respHeaders};
    }

    isolated remote function ListAvailableProducts(Empty|ContextEmpty req) returns ProductList|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/ListAvailableProducts", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductList>result;
    }

    isolated remote function ListAvailableProductsContext(Empty|ContextEmpty req) returns ContextProductList|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/ListAvailableProducts", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductList>result, headers: respHeaders};
    }

    isolated remote function SearchProduct(ProductId|ContextProductId req) returns ProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        ProductId message;
        if req is ContextProductId {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/SearchProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductResponse>result;
    }

    isolated remote function SearchProductContext(ProductId|ContextProductId req) returns ContextProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        ProductId message;
        if req is ContextProductId {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/SearchProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductResponse>result, headers: respHeaders};
    }

    isolated remote function AddToCart(CartRequest|ContextCartRequest req) returns CartResponse|grpc:Error {
        map<string|string[]> headers = {};
        CartRequest message;
        if req is ContextCartRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/AddToCart", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <CartResponse>result;
    }

    isolated remote function AddToCartContext(CartRequest|ContextCartRequest req) returns ContextCartResponse|grpc:Error {
        map<string|string[]> headers = {};
        CartRequest message;
        if req is ContextCartRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/AddToCart", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <CartResponse>result, headers: respHeaders};
    }

    isolated remote function PlaceOrder(UserId|ContextUserId req) returns OrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        UserId message;
        if req is ContextUserId {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/PlaceOrder", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <OrderResponse>result;
    }

    isolated remote function PlaceOrderContext(UserId|ContextUserId req) returns ContextOrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        UserId message;
        if req is ContextUserId {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/PlaceOrder", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <OrderResponse>result, headers: respHeaders};
    }

    isolated remote function CreateUsers() returns CreateUsersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("shopping.ShoppingService/CreateUsers");
        return new CreateUsersStreamingClient(sClient);
    }
}

public isolated client class CreateUsersStreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUser(User message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUser(ContextUser message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveUserResponse() returns UserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <UserResponse>payload;
        }
    }

    isolated remote function receiveContextUserResponse() returns ContextUserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <UserResponse>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public isolated client class ShoppingServiceOrderResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendOrderResponse(OrderResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextOrderResponse(ContextOrderResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class ShoppingServiceProductListCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendProductList(ProductList response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextProductList(ContextProductList response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class ShoppingServiceProductResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendProductResponse(ProductResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextProductResponse(ContextProductResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class ShoppingServiceCartResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendCartResponse(CartResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextCartResponse(ContextCartResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class ShoppingServiceUserResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendUserResponse(UserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextUserResponse(ContextUserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextUserStream record {|
    stream<User, error?> content;
    map<string|string[]> headers;
|};

public type ContextUserResponse record {|
    UserResponse content;
    map<string|string[]> headers;
|};

public type ContextProductList record {|
    ProductList content;
    map<string|string[]> headers;
|};

public type ContextEmpty record {|
    Empty content;
    map<string|string[]> headers;
|};

public type ContextUser record {|
    User content;
    map<string|string[]> headers;
|};

public type ContextUserId record {|
    UserId content;
    map<string|string[]> headers;
|};

public type ContextCartRequest record {|
    CartRequest content;
    map<string|string[]> headers;
|};

public type ContextProduct record {|
    Product content;
    map<string|string[]> headers;
|};

public type ContextProductResponse record {|
    ProductResponse content;
    map<string|string[]> headers;
|};

public type ContextProductId record {|
    ProductId content;
    map<string|string[]> headers;
|};

public type ContextOrderResponse record {|
    OrderResponse content;
    map<string|string[]> headers;
|};

public type ContextCartResponse record {|
    CartResponse content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: SIMPLE_DESC}
public type ProductList record {|
    Product[] products = [];
|};

@protobuf:Descriptor {value: SIMPLE_DESC}
public type UserResponse record {|
    string message = "";
|};

@protobuf:Descriptor {value: SIMPLE_DESC}
public type Empty record {|
|};

@protobuf:Descriptor {value: SIMPLE_DESC}
public type User record {|
    string user_id = "";
    readonly string user_type = "";
|};

@protobuf:Descriptor {value: SIMPLE_DESC}
public type UserId record {|
    readonly string user_id = "";
|};

@protobuf:Descriptor {value: SIMPLE_DESC}
public type CartRequest record {|
    string user_id = "";
    readonly string sku = "";
|};

@protobuf:Descriptor {value: SIMPLE_DESC}
public type Product record {|
    string name;
    string description;
    float price;
    int stock_quantity;
    readonly string sku;
    string status;
|};

@protobuf:Descriptor {value: SIMPLE_DESC}
public type ProductResponse record {|
    string message = "";
    Product product;
|};

@protobuf:Descriptor {value: SIMPLE_DESC}
public type ProductId record {|
    string sku = "";
|};

@protobuf:Descriptor {value: SIMPLE_DESC}
public type OrderResponse record {|
    string message = "";
|};

@protobuf:Descriptor {value: SIMPLE_DESC}
public type CartResponse record {|
    string message = "";
|};

