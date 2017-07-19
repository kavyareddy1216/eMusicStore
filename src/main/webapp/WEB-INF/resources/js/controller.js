/**
 * Created by Satheesh Reddy on 6/29/2017.
 */
var cartApp = angular.module("cartApp", []);
cartApp.controller("cartCtrl",function ($scope, $http) {

    $scope.refreshCart = function (cartId) {
        $http.get("/eMusicStore/rest/cart/"+$scope.cartId).success(function (data) {
                $scope.cart=data;
            });
    };
    $scope.clearCart = function (cartId) {
        $http.delete("/eMusicStore/rest/cart/"+$scope.cartId).success($scope.refreshCart($scope.cartId));
    };
    $scope.initCart = function (cartId) {

        $scope.cartId= cartId;
        $scope.refreshCart(cartId);
    };
    $scope.addToCart = function (productId) {
        alert('testing ');
        $http.put("/eMusicStore/rest/cart/add/"+productId).success(function (data) {
            $scope.refreshCart( $http.get("/eMusicStore/rest/cart/cartId"));
            alert("Product added to cart");

        });
    };
    $scope.removeFromCart = function (productId) {
        $http.put("/eMusicStore/rest/cart/remove/"+productId).success(function (data) {
            $scope.refreshCart($http.get("/eMusicStore/rest/cart/"+$scope.cartId));
        });
    };
});

