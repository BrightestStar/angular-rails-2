angular.module('flapperNews')
.controller('PostsCtrl', [
  '$scope',
  'posts',
  'post',
  'Auth',
  function($scope, posts, post, Auth){
    $scope.post = post;
    $scope.addComment = function(){
      if (!$scope.body || $scope.body === '') { return; }
      posts.addComment(post, {
        body: $scope.body,
        upvotes: 0
      });
      $scope.body = '';
    }
    $scope.incrementUpvotes = function(comment){
      if (comment.upvote_user.includes(Auth._currentUser.id)) { return; }
      posts.upvoteComment(post, comment);
    }
    $scope.downVotes = function(comment){
      if (comment.downvote_user.includes(Auth._currentUser.id)) { return; }
      posts.downvoteComment(post, comment);
    }
  }
])
