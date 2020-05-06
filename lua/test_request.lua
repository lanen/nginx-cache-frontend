local var = ngx.var
ngx.say("ngx.var.a", var.a, "<br/>")
ngx.say("ngx.var.b", var.b, "<br/>")

ngx.say("<br/>")

local headers = ngx.req.get_headers()
ngx.say("headers begin", "<br/>")
ngx.say("Host:", headers["host"],  "<br/>")
ngx.say("User-Agent:", headers["user-agent"],  "<br/>")
ngx.say("User-Agent:", headers.user_agent,  "<br/>")

for k,v in pairs(headers) do
    if type(v) == "table" then
        ngx.say(k, ":", table.concat(v, ","), "<br/>")
    else
        ngx.say(k, ":", v, "<br/>")
    end
end
ngx.say("headers end", "<br/>")

local uri_args = ngx.req.get_uri_args()
ngx.say("uri args begin", "<br/>")

for k,v in pairs(uri_args) do
    if type(v) == "table" then
        ngx.say(k, ":", table.concat(v, ","), "<br/>")
    else
        ngx.say(k, ":", v, "<br/>")
    end
end
ngx.say("uri_args end", "<br/>")

ngx.req.read_body()
local post_args = ngx.req.get_post_args()
if post_args then
    ngx.say("post args begin", "<br/>")

    for k,v in pairs(post_args) do
        if type(v) == "table" then
            ngx.say(k, ":", table.concat(v, ","), "<br/>")
        else
            ngx.say(k, ":", v, "<br/>")
        end
    end
    ngx.say("post_args end", "<br/>")
end
