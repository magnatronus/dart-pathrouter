import 'package:pathrouter/pathrouter.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

import './routes/staff.dart';
import './routes/user.dart';

/// This is a simple example that create a web server using [shelf] and adds 2 named routes for '/staff'  and '/user'
/// with the [pathrouter] middleware plugin
main() async {
  // define our main handler and add any specific routes using PathRouter
  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(PathRouter()
          .router("/staff", StaffRoute().handler, errorHandler: _echoError))
      .addMiddleware(PathRouter()
          .router("/user", UserRoute({"name": "Fred Flintstone"}).handler))
      .addHandler(_echoRequest);

  await io.serve(handler, 'localhost', 8080).then((server) {
    print('Serving at http://${server.address.host}:${server.port}');
  });
}

/// This is our defualt handler
Response _echoRequest(Request request) {
  return new Response.ok('Request for "${request.url}"');
}

/// This is an example error handler
Response _echoError(Request request) {
  return new Response.ok('Error for "${request.url}"');
}
