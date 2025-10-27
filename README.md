# 💬 Chat App (Rails + Vue 3 + Action Cable)

A simple real-time chat application built with **Ruby on Rails** (API backend) and **Vue 3** (frontend).  
This project uses **Action Cable (WebSocket)** for real-time messaging and **Devise** for authentication.

---

## 🚀 Live Demo

- **Backend (API)** → [https://chat-app-production-5749.up.railway.app](https://chat-app-production-5749.up.railway.app)  
- **Frontend (Vue)** → [https://chat-app-vue-gamma.vercel.app](https://chat-app-vue-gamma.vercel.app)

---

## 🧑‍💻 Test Accounts

You can log in using these sample accounts:

| Email | Password |
|-------|-----------|
| `arya@example.com` | `password` |
| `tony@example.com` | `password` |

---

## 🧰 Tech Stack

- **Backend:** Ruby on Rails 8 (API mode)
- **Frontend:** Vue 3 + Vite
- **Database:** PostgreSQL
- **WebSocket:** Action Cable
- **Deployment:** Railway (backend), Vercel (frontend)

---

## ⚙️ Local Setup

### 1. Clone the repository
```bash
git clone https://github.com/your-username/chat-app.git
cd chat-app
```
### 2. Install dependencies

```bash
bundle install
```

### 3. Setup database

Make sure you have PostgreSQL running, then run:

```bash
bin/rails db:create db:migrate db:seed
```

### 4. Run the server

```bash
bin/rails s
```

### 5. Run the frontend
clone frontend app at:
https://github.com/fahmiaga/chat-app-vue

the run:

```bash
npm install
npm run dev
```

## ⚠️ Known Issues
Production Environment:
WebSocket connections may occasionally fail in production deployment, but still working in realtime chat room.

This demo video running on local environment