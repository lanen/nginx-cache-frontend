--
--
--
local function close_redis(redis)
    if not redis then
        return
    end
    local ok, err = redis:close()
    if not ok then
        ngx.say("close redis error", err)
    end
end

local redis = require("resty.redis")

local inst = redis:new()

inst:set_timeout(1000)

local ip = "10.16.18.152"
local port = 6379
local ok, err = inst:connect(ip, port)
if not ok then
    ngx.say("connect to redis error:", err)
    return close_redis(inst)
end
ok, err = inst:set("msg", "hello world")
if not ok then
    ngx.say("set redis key msg error:", err)
    return close_redis(inst)
end

local value, err = inst:get("msg")
if value == ngx.null then
    value = ''
end

ngx.say("msg:", value, "<br/>")

close_redis(inst)
