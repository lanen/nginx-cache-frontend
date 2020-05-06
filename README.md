# 配置


在 `nginx.conf` 的 http 部分增加以下配置：


```

    lua_package_path "/opt/nginx-cache-frontend/lualib/?.lua;;";
    lua_package_cpath "/opt/nginx-cache-frontend/lualib/?.so;;";
    include /opt/nginx-cache-frontend/nginx.conf; 
```
