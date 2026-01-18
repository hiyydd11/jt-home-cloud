#!/bin/bash

# 家庭云盘启动脚本

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查Node.js环境
check_node() {
    echo -e "${YELLOW}检查Node.js环境...${NC}"
    if command -v node >/dev/null 2>&1; then
        NODE_VERSION=$(node -v)
        echo -e "${GREEN}Node.js已安装: $NODE_VERSION${NC}"
        return 0
    else
        echo -e "${RED}错误: 未安装Node.js，请先安装Node.js 14+${NC}"
        return 1
    fi
}

# 安装依赖
install_dependencies() {
    echo -e "${YELLOW}安装后端依赖...${NC}"
    npm install
    if [ $? -ne 0 ]; then
        echo -e "${RED}错误: 后端依赖安装失败${NC}"
        return 1
    fi
    
    echo -e "${YELLOW}安装前端依赖...${NC}"
    cd frontend
    npm install
    if [ $? -ne 0 ]; then
        echo -e "${RED}错误: 前端依赖安装失败${NC}"
        return 1
    fi
    cd ..
    
    return 0
}

# 构建前端代码
build_frontend() {
    echo -e "${YELLOW}构建前端代码...${NC}"
    cd frontend
    npm run build
    if [ $? -ne 0 ]; then
        echo -e "${RED}错误: 前端构建失败${NC}"
        return 1
    fi
    cd ..
    return 0
}

# 启动服务
start_service() {
    echo -e "${YELLOW}启动家庭云盘服务...${NC}"
    
    # 使用PM2启动服务
    if command -v pm2 >/dev/null 2>&1; then
        echo -e "${YELLOW}使用PM2启动服务...${NC}"
        pm2 start npm --name "family-cloud-drive" -- start
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}服务启动成功!${NC}"
            echo -e "${GREEN}服务名称: family-cloud-drive${NC}"
            echo -e "${GREEN}访问地址: http://localhost:3000${NC}"
            echo -e "${GREEN}LAN访问地址: http://$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'):3000${NC}"
            echo -e "${GREEN}查看服务状态: pm2 status${NC}"
            echo -e "${GREEN}停止服务: pm2 stop family-cloud-drive${NC}"
            echo -e "${GREEN}重启服务: pm2 restart family-cloud-drive${NC}"
        else
            echo -e "${RED}错误: PM2启动失败${NC}"
            return 1
        fi
    else
        # 如果没有PM2，直接使用node启动
        echo -e "${YELLOW}PM2未安装，使用node直接启动...${NC}"
        echo -e "${YELLOW}注意: 直接启动将在当前终端运行，关闭终端会停止服务${NC}"
        echo -e "${YELLOW}推荐安装PM2实现后台运行: npm install -g pm2${NC}"
        echo -e "${GREEN}访问地址: http://localhost:3000${NC}"
        echo -e "${GREEN}LAN访问地址: http://$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'):3000${NC}"
        node backend/app.js
        return $?
    fi
}

# 停止服务
stop_service() {
    echo -e "${YELLOW}停止家庭云盘服务...${NC}"
    
    if command -v pm2 >/dev/null 2>&1; then
        pm2 stop family-cloud-drive
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}服务停止成功!${NC}"
        else
            echo -e "${RED}错误: PM2停止失败${NC}"
            return 1
        fi
    else
        echo -e "${RED}错误: PM2未安装，无法停止服务${NC}"
        return 1
    fi
}

# 查看服务状态
status_service() {
    echo -e "${YELLOW}查看家庭云盘服务状态...${NC}"
    
    if command -v pm2 >/dev/null 2>&1; then
        pm2 status family-cloud-drive
    else
        echo -e "${RED}错误: PM2未安装，无法查看服务状态${NC}"
        return 1
    fi
}

# 主函数
main() {
    case "$1" in
        start)
            check_node && install_dependencies && build_frontend && start_service
            ;;
        stop)
            stop_service
            ;;
        status)
            status_service
            ;;
        restart)
            stop_service && start_service
            ;;
        install)
            check_node && install_dependencies && build_frontend
            ;;
        *)
            echo -e "${YELLOW}家庭云盘启动脚本${NC}"
            echo -e "${GREEN}用法: $0 [命令]${NC}"
            echo -e "${GREEN}命令:${NC}"
            echo -e "${GREEN}  start    启动服务${NC}"
            echo -e "${GREEN}  stop     停止服务${NC}"
            echo -e "${GREEN}  restart  重启服务${NC}"
            echo -e "${GREEN}  status   查看服务状态${NC}"
            echo -e "${GREEN}  install  安装依赖并构建前端${NC}"
            echo -e "${GREEN}  help     显示帮助信息${NC}"
            return 1
            ;;
    esac
}

# 执行主函数
main "$@"