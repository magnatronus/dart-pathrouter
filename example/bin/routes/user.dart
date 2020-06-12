import 'package:pathrouter/pathrouter.dart';
import 'package:shelf/shelf.dart';

/// Define an example User Route Handler
// This should handle requests from the {server}/user route
class UserRoute extends PathRouterTable {
  

  @override
  defineTable() {
    app.get('/hello', (Request request) {
      return Response.ok('hello-world-user');
    });

    app.get('/bye', (Request request) {
      return Response.ok('bye-for-now-user');
    });
  }

}