angular.module('flapperNews')
.controller('MainCtrl', [
  '$scope', 'posts', 'Auth',
  function($scope, posts, Auth){
    $scope.posts = posts.posts;
    $scope.addPost = function(){
      if (!$scope.title || $scope.title === '') { return; }
      posts.create({
        title: $scope.title,
        link: $scope.link,
      });
      $scope.title = '';
      $scope.link = '';
    }
    $scope.incrementUpvotes = function(post) {
      if (post.upvote_user.includes(Auth._currentUser.id)) { return; }
      posts.upvote(post);
    }
    $scope.downVotes = function(post) {
      if (post.downvote_user.includes(Auth._currentUser.id)) { return; }
      posts.downvote(post);
    }
  }
])
