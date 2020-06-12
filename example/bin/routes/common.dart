import 'package:pathrouter/pathrouter.dart';
import 'package:shelf/shelf.dart';

/// Define an example Common Route Handler
/// This should handle any requests that are not handled specifically by other routes
/// in the example it will handle / and /about
class CommonRoute extends PathRouterTable {
  @override
  defineTable() {
    app.get('/', (Request request) {
      return Response.ok('This is the home page');
    });

    app.get('/about', (Request request) {
      return Response.ok('This is the about page');
    });
  }
}
