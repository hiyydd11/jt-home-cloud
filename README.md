

```markdown
# 家庭云盘 / Family Cloud Drive

一个功能完整的家庭云盘应用，支持文件存储、管理、分享和预览，仅存储在本地设备硬盘中，不进行云端同步。
A fully functional family cloud drive application that supports file storage, management, sharing, and preview. All data is stored locally on the device's hard drive with no cloud synchronization.

## 功能特性 / Features

### 核心功能 / Core Features
- ✅ 文件存储与管理：上传、下载、删除、重命名 / File storage and management: upload, download, delete, rename
- ✅ 文件夹管理：创建、浏览、删除、重命名 / Folder management: create, browse, delete, rename
- ✅ 批量操作：批量上传、批量下载、批量删除 / Batch operations: batch upload, batch download, batch delete
- ✅ 文件夹下载：支持整个文件夹下载为ZIP压缩包 / Folder download: support downloading entire folders as ZIP archives
- ✅ 文件预览：支持图片、视频、音频、文本等常见格式预览 / File preview: support preview of common formats like images, videos, audio, and text

### 网络访问 / Network Access
- ✅ 同一局域网内设备可通过浏览器访问 / Accessible via browser on devices within the same LAN
- ✅ 设备发现功能：局域网内设备可自动识别并连接 / Device discovery: automatic detection and connection of devices in the LAN

### 安全要求 / Security Requirements
- ✅ 基本用户认证机制 / Basic user authentication mechanism
- ✅ JWT令牌授权 / JWT token authorization

### 性能与稳定性 / Performance & Stability
- ✅ 支持后台运行模式 / Support background running mode
- ✅ 优化文件传输速度 / Optimized file transfer speed
- ✅ 断点续传功能 / Resumable upload/download functionality

### 附加功能 / Additional Features
- ✅ 响应式设计：适配不同设备屏幕尺寸 / Responsive design: adapts to different device screen sizes
- ✅ 文件搜索功能 / File search functionality

## 技术栈 / Technology Stack

- **后端 / Backend**：Node.js + Express框架 / Node.js + Express framework
- **前端 / Frontend**：React.js + Ant Design组件库 / React.js + Ant Design component library
- **数据库 / Database**：SQLite（轻量级，无需额外安装） / SQLite (lightweight, no additional installation required)
- **文件存储 / File Storage**：本地文件系统 / Local file system
- **设备发现 / Device Discovery**：mDNS（Bonjour/ZeroConf协议） / mDNS (Bonjour/ZeroConf protocol)
- **认证 / Authentication**：JWT（JSON Web Token）

## 部署步骤 / Deployment Steps

### 1. 环境要求 / Environment Requirements
- Node.js 14.0 或更高版本 / Node.js 14.0 or higher
- npm 6.0 或更高版本 / npm 6.0 or higher

### 2. 安装与启动 / Installation & Startup

#### 方法一：使用启动脚本（推荐） / Method 1: Use startup script (Recommended)

```bash
# 1. 下载项目到本地 / Download the project to local machine
# 2. 进入项目目录 / Enter the project directory
cd 家庭云盘
# Or use English directory name if applicable: cd family-cloud-drive

# 3. 执行启动脚本 / Execute the startup script
./start.sh start
```

#### 方法二：手动安装与启动 / Method 2: Manual installation & startup

```bash
# 1. 安装后端依赖 / Install backend dependencies
npm install

# 2. 安装前端依赖 / Install frontend dependencies
cd frontend
npm install

# 3. 构建前端代码 / Build frontend code
npm run build

# 4. 返回项目根目录 / Return to project root directory
cd ..

# 5. 启动服务 / Start the service
npm start
```

### 3. 访问服务 / Access the Service

- **浏览器访问 / Browser Access**：在浏览器中输入 `http://服务器IP:3000` / Enter `http://[Server IP]:3000` in the browser
- **设备发现 / Device Discovery**：在支持mDNS的设备上，可直接访问 `http://familyclouddrive.local:3000` / On mDNS-supported devices, access directly via `http://familyclouddrive.local:3000`

## 使用说明 / User Guide

### 1. 用户注册与登录 / User Registration & Login

1. 第一次使用时，点击"立即注册"创建新用户 / On first use, click "Register Now" to create a new user
2. 注册成功后，使用用户名和密码登录 / After successful registration, log in with username and password
3. 登录后进入文件管理界面 / After login, enter the file management interface

### 2. 文件管理 / File Management

#### 上传文件 / Upload Files
1. 点击"上传文件"按钮 / Click the "Upload Files" button
2. 选择要上传的文件，支持多选 / Select files to upload (multiple selection supported)
3. 等待上传完成 / Wait for upload completion

#### 下载文件 / Download Files
1. 点击文件右侧的"下载"按钮 / Click the "Download" button next to the file
2. 选择保存位置 / Choose save location

#### 批量下载 / Batch Download
1. 勾选多个文件 / Check multiple files
2. 点击"批量下载"按钮 / Click the "Batch Download" button
3. 系统会将选中的文件打包为ZIP格式下载 / The system will package selected files into ZIP format for download

#### 下载整个文件夹 / Download Entire Folder
1. 进入要下载的文件夹 / Enter the folder to be downloaded
2. 点击"下载当前文件夹"按钮 / Click the "Download Current Folder" button
3. 系统会将整个文件夹打包为ZIP格式下载 / The system will package the entire folder into ZIP format for download

#### 创建文件夹 / Create Folder
1. 点击"创建文件夹"按钮 / Click the "Create Folder" button
2. 输入文件夹名称 / Enter folder name
3. 点击"创建" / Click "Create"

#### 删除文件或文件夹 / Delete Files or Folders
1. 点击文件或文件夹右侧的"删除"按钮 / Click the "Delete" button next to the file/folder
2. 确认删除操作 / Confirm deletion

#### 重命名文件或文件夹 / Rename Files or Folders
1. 点击文件或文件夹右侧的"重命名"按钮 / Click the "Rename" button next to the file/folder
2. 输入新名称 / Enter new name
3. 点击"确定" / Click "Confirm"

#### 文件预览 / File Preview
1. 点击图片、视频、音频等支持预览的文件右侧的"预览"按钮 / Click the "Preview" button next to preview-supported files (images, videos, audio, etc.)
2. 在弹出的预览窗口中查看文件内容 / View file content in the pop-up preview window

### 3. 文件夹导航 / Folder Navigation

- 在左侧文件夹树中点击文件夹名称进入对应文件夹 / Click folder names in the left folder tree to enter corresponding folders
- 文件夹树支持展开和折叠 / Folder tree supports expansion and collapse

## 命令说明 / Command Reference

### 启动脚本命令 / Startup Script Commands

```bash
# 启动服务 / Start service
./start.sh start

# 停止服务 / Stop service
./start.sh stop

# 重启服务 / Restart service
./start.sh restart

# 查看服务状态 / Check service status
./start.sh status

# 仅安装依赖和构建前端 / Only install dependencies and build frontend
./start.sh install
```

### PM2命令（如果使用PM2启动） / PM2 Commands (if using PM2 for startup)

```bash
# 查看服务状态 / Check service status
pm2 status

# 停止服务 / Stop service
pm2 stop family-cloud-drive

# 重启服务 / Restart service
pm2 restart family-cloud-drive

# 查看服务日志 / View service logs
pm2 logs family-cloud-drive
```

## 项目结构 / Project Structure

```
家庭云盘/ (FamilyCloudDrive/)
├── backend/              # 后端代码 / Backend code
├── frontend/             # 前端代码 / Frontend code
├── data/                 # 数据存储目录 / Data storage directory
│   ├── db/               # 数据库文件 / Database files
│   └── files/            # 用户上传文件 / User uploaded files
├── start.sh              # 启动脚本 / Startup script
├── package.json          # 后端依赖 / Backend dependencies
└── README.md             # 项目说明 / Project documentation
```

## 配置说明 / Configuration Guide

### 环境变量配置 / Environment Variable Configuration

可通过修改 `.env` 文件调整服务配置：
Service configuration can be adjusted by modifying the `.env` file:

```env
# 服务器配置 / Server Configuration
PORT=3000                # 服务端口 / Service port
HOST=0.0.0.0             # 服务地址 / Service address

# 数据库配置 / Database Configuration
DB_PATH=data/db/family_cloud.db  # 数据库文件路径 / Database file path

# 文件存储配置 / File Storage Configuration
FILE_STORAGE_PATH=data/files     # 文件存储路径 / File storage path

# JWT配置 / JWT Configuration
JWT_SECRET=your_jwt_secret_key   # JWT密钥 / JWT secret key
JWT_EXPIRES_IN=24h               # JWT过期时间 / JWT expiration time

# 设备发现配置 / Device Discovery Configuration
MDNS_NAME=FamilyCloudDrive       # mDNS服务名称 / mDNS service name
MDNS_TYPE=http                   # 服务类型 / Service type
MDNS_PROTOCOL=tcp                # 服务协议 / Service protocol
```

## 注意事项 / Notes

1. **数据安全 / Data Security**：请定期备份 `data` 目录，以防止数据丢失 / Regularly back up the `data` directory to prevent data loss
2. **性能建议 / Performance Suggestions**：对于大量文件或大文件存储，建议使用SSD硬盘 / For storing large numbers of files or large files, SSD hard drives are recommended
3. **网络环境 / Network Environment**：确保服务器和客户端在同一局域网内 / Ensure server and clients are within the same LAN
4. **端口占用 / Port Occupancy**：如果3000端口被占用，可在 `.env` 文件中修改 `PORT` 配置 / If port 3000 is occupied, modify the `PORT` configuration in the `.env` file
5. **后台运行 / Background Running**：推荐使用PM2实现服务的后台运行和自动重启 / PM2 is recommended for background running and automatic restart of the service

## 常见问题 / Frequently Asked Questions (FAQ)

### Q: 如何修改服务端口？ / How to modify the service port?
A: 修改 `.env` 文件中的 `PORT` 配置，然后重启服务。 / Modify the `PORT` configuration in the `.env` file and restart the service.

### Q: 如何查看服务日志？ / How to view service logs?
A: 如果使用PM2启动，可通过 `pm2 logs family-cloud-drive` 查看日志。 / If started with PM2, view logs via `pm2 logs family-cloud-drive`.

### Q: 忘记密码怎么办？ / What if I forget my password?
A: 目前不支持密码重置功能，可重新注册新用户。 / Password reset is not currently supported; please register a new user.

### Q: 支持哪些文件格式预览？ / What file formats are supported for preview?
A: 支持图片（JPG、PNG、GIF等）、视频（MP4、WebM等）、音频（MP3、WAV等）、文本（TXT、MD等）等常见格式。 / Common formats are supported including images (JPG, PNG, GIF, etc.), videos (MP4, WebM, etc.), audio (MP3, WAV, etc.), and text (TXT, MD, etc.).

## 更新日志 / Changelog

### v1.0.0 (2026-01-18)
- 初始版本发布 / Initial release
- 实现核心文件管理功能 / Implemented core file management functions
- 支持批量操作和文件夹下载 / Supported batch operations and folder downloads
- 实现设备发现功能 / Implemented device discovery functionality
- 支持文件预览 / Supported file preview

## 许可证 / License

MIT License

## 贡献 / Contribution

欢迎提交Issue和Pull Request！ / Issues and Pull Requests are welcome!
```
