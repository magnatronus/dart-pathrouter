import 'package:pathrouter/pathrouter.dart';
import 'package:shelf/shelf.dart';

/// Define an example User Route Handler
/// This should handle requests from the {server}/user route
/// this routingTable has data passed to it so we need to invoke super() on the extended class
class UserRoute extends PathRouterTable {
  // As we are passing in data to the routing table
  UserRoute(Map data) : super(data: data);

  @override
  defineTable() {
    app.get('/hello', (Request request) {
      return Response.ok('hello-world-user : ${data['name']}');
    });

    app.get('/bye', (Request request) {
      return Response.ok('bye-for-now-user');
    });
  }
}
