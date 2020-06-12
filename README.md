# PathRouter
**PathRouter** is a middleware plugin that can be used with **shelf** to provide a means of assigning a handler, or a router as defined by **shelf_router**, to a **named** path.

For example you may want a set of handlers to deal with your **/api** route, or maybe a handler to  deal with your **/users** route. Using **PathRouter** you can create seperate routers/handlers and assign then to handle specific paths.


## Usage

### PathRouter Component
Use this to associate a middleware handler with a named route, for example if you want a handler (myHandler) to process all requests to the route **/api**  you would declare something similar to

```
  PathRouter().router("/api", myHandler);

```

**PathRouter** now also has a **catchAll** route that can be used to add a handler to any other routes not taken care of. This should always be the *last* middleware definition.

```
PathRouter().catchAll(myHandler);

```



Note that if a route to **/api** was requested and not handled by the defined *PathRouter* then it would be handled by any innerHandler set up,( *with .addhandler()* ) unless the optional error handler (myErrorHandler) was also defined.

```
  PathRouter().router("/api", myHandler, errorHandler: myErrorHandler);

```

### PathRouterTable
This is a just a **convienence** component to help you define a specific routing table to use with **PathRouter** that allows you to quickly create and manage multiple results to various path requests. From the examples above you could use it to define what happens to various paths below the */api* route. Note that the syntax for defining these routes is the same as when defining your own **shelf_router** handler as it is just a wrapper around this process. 

```
class APIRouter extends PathRouterTable {
  @override
  defineTable(){
    app.get('/user', (Request request) {
      return Response.ok('api user request');
    });

    app.get('/status', (Request request) {
      return Response.ok('api status request');
    });    
  }
}
```

All you need to do is put all your route handlers in the **overridden** *defineTable()* method. The PathRouter call would then become:

```
PathRouter().router("/api", APIRouter().handler, errorHandler: myErrorHandler);
```
This would then handle:

- /api/users
- /api/status



see the *example* directory for a simple but complete example of how to use **PathRouter** and **PathRouterTable**


## Info

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).