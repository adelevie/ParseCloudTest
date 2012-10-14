Parse.Cloud.define('trivial', function(request, response) {
  response.success(request.params);
});