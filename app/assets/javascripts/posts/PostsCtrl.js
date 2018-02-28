angular.module('flapperNews')
.controller('PostsCtrl', [
  '$scope',
  'posts',
  'post',
  function($scope, posts, post){
    $scope.post = post;
    $scope.addComment = function(){
      if ($scope.body === '') { return; }
      posts.addComment(post, {
        body: $scope.body,
        upvotes: 0
      });
      $scope.body = '';
    }
    $scope.incrementUpvotes = function(comment){
      posts.upvoteComment(post, comment);
    }
  }
])
