require! { http, connect, ecstatic }

# Log with timestamp
log = (...args) !-> console.log.call console, ([new Date!] ++ args).join ' '

app = connect!

app.use ecstatic { root : __dirname, default-ext : \html, -handle-error }

app.use (req, res) !->
  res.end 'Hello, world!'

http.create-server app .listen 9985 !-> log 'Server started'
