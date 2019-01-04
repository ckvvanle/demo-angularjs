"use strict";

angular.module("ecommerceApp")
    .controller("OrderController", OrderController);

function OrderController($scope) {
  var vm = this;
  var test = 123;

  vm.click = function(){
    $scope.btn = test;
  };
  $scope.test = 456;
};
