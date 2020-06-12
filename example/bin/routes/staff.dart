import 'package:pathrouter/pathrouter.dart';
import 'package:shelf/shelf.dart';

/// Define an example Staff Route Handler
// This should handle requests from the {server}/staff route
class StaffRoute extends PathRouterTable {
  @override
  defineTable() {
    app.get('/hello', (Request request) {
      return Response.ok('hello-world-staff');
    });

    app.get('/bye', (Request request) {
      return Response.ok('bye-for-now-staff');
    });
  }
}
