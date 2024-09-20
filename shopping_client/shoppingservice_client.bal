import ballerina/io;

ShoppingServiceClient ep = check new ("http://localhost:9090");

public function main() returns error? {

boolean repeat = true;
    while repeat {
    io:println("Select an option:");
    io:println("1. Add product");
    io:println("2. Update product");
    io:println("3. Remove product");
    io:println("4. List available products");
    io:println("5. Search product");
    io:println("6. Add to cart");
    io:println("7. Place order");
    io:println("8. Create users");
    io:println("9. Exit");

    string option = io:readln("Enter a choice to perform: ");

    if option == "1" {
        error? product = addProduct();
        if product is error {
            // Handle error
        }
    } else if option == "2" {
        error? updateProductResult = updateProduct();
        if updateProductResult is error {
            // Handle error
        }
    } else if option == "3" {
        error? removeProductResult = removeProduct();
        if removeProductResult is error {
            // Handle error
        }
    } else if option == "4" {
        error? listAvailableProductsResult = listAvailableProducts();
        if listAvailableProductsResult is error {
            // Handle error
        }
    } else if option == "5" {
        error? searchProductResult = searchProduct();
        if searchProductResult is error {
            // Handle error
        }
    } else if option == "6" {
        error? toCart = addToCart();
        if toCart is error {
            // Handle error
        }
    } else if option == "7" {
        error? placeOrderResult = placeOrder();
        if placeOrderResult is error {
            // Handle error
        }
    } else if option == "8" {
        error? users = createUsers();
        if users is error {
            // Handle error
        }
    } else if option == "9" {
        io:println("Exiting...");
        break; // Break out of the loop
    } else {
        io:println("Invalid option. Please try again.");
    }

    // Ask if the user wants to perform another operation
    if repeat {
        io:println("Do you want to perform another operation? (Yes/No)");
        string response = io:readln();
        if response.toUpperAscii() == "NO" {
            repeat = false;
        }
    }
}
}

    function addProduct() returns error? {
    io:println("Enter product name: ");
    string name =  io:readln();
    io:println("Enter product description: ");
    string description =  io:readln();
    io:println("Enter product price: ");
    float price =  check readFloat();
    io:println("Enter product stock quantity: ");
    int stockQuantity = check readInt();
    io:println("Enter product SKU: ");
    string sku =  io:readln();
    io:println("Enter product status: ");
    string status = io:readln();
    Product addProductRequest = {name: name, description: description, price: price, stock_quantity: stockQuantity, sku: sku, status: status};
    ProductResponse addProductResponse = check ep->AddProduct(addProductRequest);
    io:println(addProductResponse);
    }
    

    function updateProduct() returns error? {
    io:println("Enter product SKU to update: ");
    string updateSku =  io:readln();
    io:println("Enter new product name: ");
    string updateName =  io:readln();
    io:println("Enter new product description: ");
    string updateDescription = io:readln();
    io:println("Enter new product price: ");
    float updatePrice =  check readFloat();
    io:println("Enter new product stock quantity: ");
    int updateStockQuantity = check readInt();
    io:println("Enter new product status: ");
    string updateStatus = io:readln();



    Product updateProductRequest = {name: updateName, description: updateDescription, price: updatePrice, stock_quantity: updateStockQuantity, sku: updateSku, status:updateStatus };
    ProductResponse updateProductResponse = check ep->UpdateProduct(updateProductRequest);
    io:println(updateProductResponse);
    }

    // Function to read and convert input to float
function readFloat() returns float|error {
    string input = io:readln();
    return float:fromString(input);
}

// Function to read and convert input to int
function readInt() returns int|error {
    string input = io:readln();
    return int:fromString(input);
}

    function removeProduct() returns error? {
    io:println("Enter product SKU to remove: ");
    string removeSku =  io:readln();

    ProductId removeProductRequest = {sku: removeSku};
    ProductList removeProductResponse = check ep->RemoveProduct(removeProductRequest);
    io:println(removeProductResponse);
    }

    function listAvailableProducts() returns error? {
    Empty listAvailableProductsRequest = {};
    ProductList listAvailableProductsResponse = check ep->ListAvailableProducts(listAvailableProductsRequest);
    io:println(listAvailableProductsResponse);
    }

    function searchProduct() returns error? {
    io:println("Enter product SKU to search: ");
    string searchSku = io:readln();

    ProductId searchProductRequest = {sku: searchSku};
    ProductResponse searchProductResponse = check ep->SearchProduct(searchProductRequest);
    io:println(searchProductResponse);
    }

    function addToCart() returns error? {
    io:println("Enter user ID: ");
    string userId =  io:readln();
    io:println("Enter product SKU to add to cart: ");
    string cartSku =  io:readln();
    CartRequest addToCartRequest = {user_id: userId, sku: cartSku};
    CartResponse addToCartResponse = check ep->AddToCart(addToCartRequest);
    io:println(addToCartResponse);
    }

    function placeOrder() returns error? {
    io:println("Enter user ID: ");
    string placeOrderUserId = io:readln();
    UserId placeOrderRequest = {user_id: placeOrderUserId};
    OrderResponse placeOrderResponse = check ep->PlaceOrder(placeOrderRequest);
    io:println(placeOrderResponse);
    }

    function createUsers() returns error? {
    io:println("Enter user ID: ");
    string userId = io:readln();
    io:println("Enter user type: ");
    string userType = io:readln();

    User createUsersRequest = {user_id: userId, user_type: userType};
    CreateUsersStreamingClient createUsersStreamingClient = check ep->CreateUsers();
    check createUsersStreamingClient->sendUser(createUsersRequest);
    check createUsersStreamingClient->complete();
    UserResponse? createUsersResponse = check createUsersStreamingClient->receiveUserResponse();
    io:println(createUsersResponse);
}

