import ballerina/grpc;
import ballerina/log;

listener grpc:Listener ep = new (9090);

public table<Product> key(sku) products = table [
    {name: "Gloves", description: "They go on your hands", price: 1000.0, status: "AVAILABLE", stock_quantity: 10, sku: "1234-8728-2092"}
];

public table<User> key(sku) products = table [
    {user_id:, user_type:}
];

public table<CartRequest> key(sku) products = table [
    {user_id:, sku:"1234-8728-2092"}
];

public table<UserId> key(sku) products = table [
    {user_id:}
];

@grpc:Descriptor {value: SIMPLE_DESC}
service "ShoppingService" on ep {

    remote function AddProduct(Product value) returns ProductResponse|error {
        products.add(value);
        ProductResponse response = {message: "Product added sucesfully", product: value};
        return response;
    }

    remote function UpdateProduct(Product value) returns ProductResponse|error {
        products.put(value);
        ProductResponse response = {message: "Product updated successfully", product: value};
        return response;
    }

    remote function RemoveProduct(ProductId value) returns ProductList|error {
        _ = products.remove(value.sku);
        ProductList productList = {products: products.toArray()};
        return productList;
    }

    remote function ListAvailableProducts(Empty value) returns ProductList|error {
        Product[] productslist = [];
        foreach var item in products {
            if item.status == "AVAILABLE" {
                productslist.push(item);
            }
        }
        ProductList productList = {products: productslist};
        return productList;
    }

    remote function SearchProduct(ProductId value) returns ProductResponse|error {
        ProductResponse response = {message: "Product found", product: {name: "Sample", description: "Sample product", price: 10.0, stock_quantity: 100, sku: value.sku, status: "available"}};
        return response;
    }

    remote function AddToCart(CartRequest value) returns CartResponse|error {
        log:printInfo("Product added to cart: " + value.sku);
        CartResponse response = {message: "Product added to cart successfully"};
        return response;
    }

    remote function PlaceOrder(UserId value) returns OrderResponse|error {
        log:printInfo("Order placed by user: " + value.user_id);
        OrderResponse response = {message: "Order placed successfully"};
        return response;
    }

    remote function CreateUsers(stream<User, grpc:Error?> clientStream) returns UserResponse|error {
        UserResponse response = {message: "Users created successfully"};
        return response;
    }
}

