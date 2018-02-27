angular.module('flapperNews')
.factory('posts', [
  '$http',
  function($http){
  var o = {
    posts: []
  };

  o.getAll = function() {
    return $http.get('/posts.json').then(function(res){
      angular.copy(res.data, o.posts);
    });
  }

  o.create = function(post) {
    return $http.post('/posts.json', post).then(function(res) {
      o.posts.push(res.data);
    })
  }

  o.upvote = function(post) {
    return $http.put('/posts/' + post.id + '/upvote.json').then(function(res) {
      post.upvotes += 1;
    })
  }

  o.get =function(id) {
    return $http.get('/posts/' + id + '.json').then(function(res) {
      return res.data;
    })
  }

  o.addComment = function(post, comment) {
    return $http.post('/posts/' + post.id + '/comments.json', comment).then(function(res) {
      post.comments.push(comment);
    })
  }

  o.upvoteComment = function(post, comment) {
    return $http.put('/posts/' + post.id + '/comments/' + comment.id + '/upvote.json').then(function(res){
      comment.upvotes += 1;
    })
  }

  return o;
}])
