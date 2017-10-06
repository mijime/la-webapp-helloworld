import asynchttpserver, asyncdispatch, osproc, posix

const port = 5000

proc handler(req: Request) {.async.} =
  await req.respond(Http200, "Hello world\n")

proc main =
  var server = newAsyncHttpServer(true, true)
  asyncCheck server.serve(Port(port), handler)
  runForever()

main()
