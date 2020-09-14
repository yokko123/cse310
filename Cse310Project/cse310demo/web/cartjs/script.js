/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function add_to_cart(pid, pname, price) {

    let cart = localStorage.getItem("cart");

    if (cart == null) {
        //no cart yet
        let products = [];
        let product = {productId: pid, ProductName: pname, ProductQuantity: 1, ProductPrice: price};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("product is added for the first time");
    } else {
        //cart is already present
        let pcart = JSON.parse(cart);

        let oldProduct = pcart.find((item) => item.productId == pid);
//            product matched
        if (oldProduct) {
            //increase quantity
            oldProduct.ProductQuantity = oldProduct.ProductQuantity + 1;
            pcart.map((item) => {
                if (item.productId == oldProduct.productId) {
                    item.ProductQuantity = oldProduct.ProductQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product quatity is increased");
        } else {
            //add new product
            let product = {productId: pid, ProductName: pname, ProductQuantity: 1, ProductPrice: price};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("new product added");
        }

        updateCart();
    }

}

//update cart
function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        console.log("Cart is empty!");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart does not have any items </h3>");
        //$(".checkout-btn").addClass('disabled');
         $(".checkout-btn").attr('disabled',true);
    } else {
        //have items in cart
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        let table = `
            <table class='table'>
            <thead class='thead-light'>
                 <tr>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price </th>
                    <th>Action</th>
                </tr>
        
            </thead>
        

        `;

        let totalPrice = 0;
        cart.map((item) => {

            table += `
                <tr>
                    <td>${item.ProductName}</td>
                    <td>${item.ProductPrice}</td>
                    <td>${item.ProductQuantity}</td>
                    <td>${item.ProductQuantity*item.ProductPrice}</td>
                    <td><button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm">Remove</button></td>
                </tr>
            

            `;
            totalPrice += item.ProductPrice*item.ProductQuantity;
        });

        table = table + `
        
        <tr>
            <td colspan='5' class='text-right font-weight-bold m-5'>Total Price : ${totalPrice}</td>
        </tr>

        
        </table>`;
        $(".cart-body").html(table);
        
        $(".checkout-btn").attr('disabled',false);
    }
}

function deleteItemFromCart(pId){
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item)=>item.productId!=pId);
    
    localStorage.setItem('cart',JSON.stringify(newcart));
    
    updateCart();
}

$(document).ready(function () {
    updateCart();
});

function goToCheckout(){
    window.location="/cse310demo/checkout/checkout.jsp";
}

function reset(){
    window.location = "/cse310demo/homepage/homepage.jsp";
    localStorage.clear();
}
function logout(){
    localStorage.clear();
}
