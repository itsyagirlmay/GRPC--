import ballerina/grpc;
import ballerina/log;

listener grpc:Listener ep = new (9091);

map<string> userCredentials = {
    "adminUser": "admin",
    "customerUser": "customer"
};

isolated table<Product> key(sku) products = table [
    {name: "Gloves", description: "They go on your hands", price: 1000.0, status: "AVAILABLE", stock_quantity: 10, sku: "1234"}
];

public table<User> key(user_type) users = table [
    {user_id: "1", user_type: "customer"}
];

public table<CartRequest> key(sku) cartRequests = table [
    {user_id: "1", sku: "1234-8728-2092"}
];

public table<UserId> key(user_id) user_id = table [
    {user_id: "1"}
];

public type LoginRequest record {
    string user_id;
    string user_type;
};

@grpc:Descriptor {value: SIMPLE_DESC}
service "ShoppingService" on ep {

    isolated remote function AddProduct(Product value) returns ProductResponse|error {
        lock {
            // Add product using keyed assignment
            products.put(value.clone());
        }
        ProductResponse response = {message: "Product added successfully", product: value};
        return response;
    }

    isolated remote function UpdateProduct(Product value) returns ProductResponse|error {
        lock {
            // Update product using keyed assignment
            products.put(value.clone());
        }
        ProductResponse response = {message: "Product updated successfully", product: value};
        return response;
    }

    isolated remote function RemoveProduct(ProductId value) returns ProductList|error {
        lock {
            _ = products.remove(value.sku);
        }
        ProductList productList;
        lock {
            productList = {products: products.clone().toArray()};
        }
        return productList;
    }

    remote function ListAvailableProducts(Empty value) returns ProductList|error {
        Product[] productsList = [];

        lock {
            Product[] allProducts = products.clone().toArray();
            // Iterate through the copied products
            foreach var item in allProducts {
                if item.status == "AVAILABLE" {
                    productsList.clone().push(item);
                }
            }
        }

        ProductList productList = {products: productsList};
        return productList;
    }

    remote function SearchProduct(ProductId value) returns ProductResponse|error {
        Product? foundProduct;

        lock {
            foundProduct = products.get(value.sku).clone();
        }

        if foundProduct is Product {
            ProductResponse response = {
                message: "Product found",
                product: foundProduct
            };
            return response;
        }
        return error("Product does not exist.");
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

