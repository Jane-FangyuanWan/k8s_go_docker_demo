# 第一阶段：构建
FROM golang:1.21 AS builder

WORKDIR /app
COPY . .

# ✨ 静态编译，避免运行时找不到库
RUN CGO_ENABLED=0 GOOS=linux go build -o app

# 第二阶段：运行（使用更轻的 alpine）
FROM alpine:latest

WORKDIR /root/
COPY --from=builder /app/app .

EXPOSE 8080
CMD ["./app"]
