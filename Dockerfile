# 使用官方的nginx基础镜像
FROM nginx:latest

# 复制本地静态网站文件到nginx的默认网站目录
COPY . /usr/share/nginx/html

# 暴露81端口，允许外部访问
EXPOSE 81

# 设置nginx的配置，将服务器名设置为Docker主机的IP地址，端口为81
RUN echo "server { listen 81; server_name _; location / { root /usr/share/nginx/html; index index.html; } }" > /etc/nginx/conf.d/default.conf

# 启动nginx服务
CMD ["nginx", "-g", "daemon off;"]
