var app = angular.module('app', []);

app.controller('neon', function($scope, $element){
    var _name = 'START';
    $scope.user = {
        name: function(newName) {
            return arguments.length ? (_name = newName) : _name;
        }
    };
    $scope.getColor = function(color){
        $scope.color = color;
    };
    $scope.getColor('blue');
});
