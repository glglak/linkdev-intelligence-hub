# LinkDev Intelligence Hub 🧠

> Arabic-first technology intelligence platform for the MENA region

[![CI/CD Pipeline](https://github.com/glglak/linkdev-intelligence-hub/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/glglak/linkdev-intelligence-hub/actions/workflows/ci-cd.yml)
[![Security Scan](https://github.com/glglak/linkdev-intelligence-hub/actions/workflows/security-scan.yml/badge.svg)](https://github.com/glglak/linkdev-intelligence-hub/actions/workflows/security-scan.yml)

## 🌟 Features

- **🌍 Arabic-first design** with RTL support and English localization
- **📊 Comprehensive reports** on technology trends in MENA region
- **🔍 Market insights** and vendor comparisons
- **🎯 Subscription tiers** (Free, Pro, Enterprise)
- **📱 Responsive design** optimized for mobile and desktop
- **🔒 Secure authentication** with JWT tokens
- **⚡ Modern tech stack** with Next.js 14 and .NET Core 8

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │   Backend       │    │   Database      │
│   Next.js 14    │◄──►│   .NET Core 8   │◄──►│   SQL Server    │
│   React 18      │    │   Web API       │    │   2022          │
│   TypeScript    │    │   Entity FW     │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 🚀 Quick Start

### Prerequisites

- Node.js 18+ 
- .NET 8 SDK
- SQL Server 2022 (or Docker)
- Git

### Option 1: Docker (Recommended)

```bash
# Clone repository
git clone https://github.com/glglak/linkdev-intelligence-hub.git
cd linkdev-intelligence-hub

# Start all services
chmod +x start.sh
./start.sh

# Access the application
# Frontend: http://localhost:3000
# Backend API: http://localhost:5000
# Swagger: http://localhost:5000/swagger
```

### Option 2: Manual Setup

```bash
# 1. Clone and setup
git clone https://github.com/glglak/linkdev-intelligence-hub.git
cd linkdev-intelligence-hub

# 2. Backend setup
cd backend/LinkDevIntelligence.API
dotnet restore
dotnet ef database update
dotnet run

# 3. Frontend setup (new terminal)
cd ../../frontend
npm install
npm run dev

# 4. Access application
# Frontend: http://localhost:3000
# Backend: http://localhost:5000
```

## 📁 Project Structure

```
linkdev-intelligence-hub/
├── 📂 frontend/                 # Next.js 14 + React 18
│   ├── 📂 src/
│   │   ├── 📂 app/             # App Router (Next.js 14)
│   │   ├── 📂 components/      # Reusable components
│   │   ├── 📂 lib/            # Utilities and configurations
│   │   └── 📂 messages/       # i18n translations
│   ├── 📄 package.json
│   └── 📄 next.config.js
├── 📂 backend/                  # .NET Core 8 Web API
│   └── 📂 LinkDevIntelligence.API/
│       ├── 📂 Controllers/     # API endpoints
│       ├── 📂 Models/         # Data models and DTOs
│       ├── 📂 Services/       # Business logic
│       ├── 📂 Data/           # Database context
│       └── 📄 Program.cs
├── 📂 database/                 # SQL scripts and migrations
├── 📂 docs/                     # Documentation
├── 📄 docker-compose.yml       # Development environment
└── 📄 README.md
```

## 🌐 Internationalization

The platform supports Arabic (default) and English with:

- **RTL/LTR layout switching**
- **Localized date/number formatting**
- **Arabic-optimized fonts** (Tajawal)
- **Content translation** for all UI elements

## 🔧 Development

### Environment Variables

Create `.env.local` files:

**Frontend (.env.local):**
```env
NEXT_PUBLIC_API_URL=http://localhost:5000/api
NEXT_PUBLIC_APP_ENV=development
```

**Backend (appsettings.Development.json):**
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost;Database=LinkDevIntelligence;Trusted_Connection=true;TrustServerCertificate=true"
  },
  "Jwt": {
    "Key": "YourSecretKeyHere",
    "Issuer": "LinkDevIntelligence"
  }
}
```

## 📊 API Documentation

The API is documented with Swagger/OpenAPI:

- **Development:** http://localhost:5000/swagger
- **Production:** https://api.intelligence.linkdev.com/swagger

## 🚀 Deployment

### GitHub Actions

The project includes automated CI/CD with:

- ✅ **Automated testing** for frontend and backend
- 🔒 **Security scanning** with Trivy
- 🐳 **Docker image building** and pushing to GHCR
- 📦 **Deployment pipeline** (configurable)

## 📈 Content Management

### Adding New Reports

1. **Via API:** Use the `/api/reports` endpoint
2. **Database direct:** Insert into `Reports` table
3. **Admin panel:** (Future feature)

## 🔐 Security

- **JWT authentication** with configurable expiration
- **Input validation** on all endpoints
- **SQL injection protection** via Entity Framework
- **CORS policy** configuration
- **Rate limiting** (recommended for production)

## 🤝 Contributing

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

## 📋 Roadmap

### Phase 1 (Current)
- ✅ Basic platform with reports and insights
- ✅ Arabic/English internationalization
- ✅ User authentication and subscription tiers

### Phase 2 (Q2 2025)
- 🔄 Advanced search and filtering
- 🔄 Admin dashboard for content management
- 🔄 Email notifications and newsletters
- 🔄 Vendor comparison tools

### Phase 3 (Q3 2025)
- 📅 Interactive dashboards and analytics
- 📅 API access for enterprise clients
- 📅 Mobile applications (iOS/Android)
- 📅 AI-powered content recommendations

## 📞 Support

- **Email:** intelligence@linkdev.com
- **Issues:** [GitHub Issues](https://github.com/glglak/linkdev-intelligence-hub/issues)

## 📄 License

This project is proprietary software owned by LinkDev. All rights reserved.

---

<div dir="rtl">

## بالعربية

### نظرة عامة
منصة LinkDev Intelligence Hub هي أول منصة عربية متخصصة في تقارير وتحليلات التكنولوجيا لمنطقة الشرق الأوسط وشمال أفريقيا.

### المميزات الرئيسية
- تصميم عربي أولاً مع دعم كامل للغة العربية
- تقارير شاملة عن اتجاهات التكنولوجيا في المنطقة
- رؤى السوق ومقارنات المورّدين
- نظام اشتراكات متدرج (مجاني، احترافي، مؤسسي)

### التقنيات المستخدمة
- الواجهة الأمامية: Next.js 14 مع React 18
- الواجهة الخلفية: .NET Core 8
- قاعدة البيانات: SQL Server 2022
- الاستضافة: Docker مع إمكانية النشر السحابي

</div>

---

**Built with ❤️ by LinkDev Team**
