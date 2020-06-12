/// Copyright (c) 2020, SpiralArm Consulting Ltd. All Rights Reserved
/// Use of this source code is governed by an Apache License 2.0 that can be found in the LICENSE file.
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

/// PathRouter is a middleware handler component that is designed for use with [shelf]
/// It provides a means of adding a specific set of routes to be handled by a path prefix
class PathRouter {
  /// This defines the [handler] that is associated with the specified [path]
  /// when used as middleware any requests for the specified [path] prefix will be directed to the specified [handler]
  /// If the specified route is not defined then if the [errorHandler] is set then this will be used, otherwise the inner handler is used.
  Middleware router(String path, Handler handler, {Handler errorHandler}) =>
      (innerHandler) {
        return (request) {
          if ("/${request.url.pathSegments.first}" == path) {
            request = request.change(path: path.replaceFirst("/", ""));
            return Future.sync(() async {
              Response response = await handler(request);
              if (response == null) {
                return (errorHandler != null)
                    ? await errorHandler(request)
                    : await innerHandler(request);
              }
              return response;
            });
          }
          return Future.sync(() => innerHandler(request)).then((response) {
            return response;
          });
        };
      };
}

/// Simple class to act as a named routing table - use this to derive your named routing tables
/// just override the [defineTable()] method and add your own app routes
/// The Map [data] is optional and can be used to pass data into the routing table
class PathRouterTable {
  Map data = {};
  Router app = Router();
  PathRouterTable({this.data}) {
    defineTable();
  }
  defineTable() {}
  get handler {
    return app.handler;
  }
}
