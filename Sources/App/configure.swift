import Vapor

import GRPC

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    

    var gRPCServerConfig = Server.Configuration(target: .hostAndPort("0.0.0.0", 9000), eventLoopGroup: PlatformSupport.makeEventLoopGroup(loopCount: 1), serviceProviders: [GreeterProvider()])
    
    let server = try Server.start(configuration: gRPCServerConfig).whenSuccess { address in
        print("GRPC Server started on port  \(address.channel.localAddress!.port!)")
    }
    
    // register routes
    
    
    try routes(app)
}


/*
 
 extension Request {
     public convenience init(
         application: Application, context: ServerCallContext) {
         self.init(application: application,
                   method: context.request.method,  // .POST
                   url: URI(path: context.request.uri),
                   version: context.request.version,  // HTTP2
                   headers: context.request.headers,
                   eventLoop: context.eventLoop)
     }
 }
 // In your gRPC provider’s handler, call:
 let request = Request(application: self.app, context: context)
 // Then use request as you usually would...

 
 
 */
