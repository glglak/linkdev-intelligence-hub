# LinkDev Intelligence Hub - Setup Guide

## 🚀 Quick Start

### Prerequisites

- **Docker & Docker Compose** (Recommended)
- **Node.js 18+** (for local development)
- **.NET 8 SDK** (for local development)
- **SQL Server 2022** (or use Docker)
- **Git**

### Option 1: Docker Setup (Recommended)

```bash
# 1. Clone the repository
git clone https://github.com/glglak/linkdev-intelligence-hub.git
cd linkdev-intelligence-hub

# 2. Make setup script executable
chmod +x start.sh

# 3. Run the setup script
./start.sh

# 4. Access the application
# Frontend: http://localhost:3000
# Backend API: http://localhost:5000
# API Documentation: http://localhost:5000/swagger
```

### Option 2: Manual Setup

#### Backend Setup

```bash
# Navigate to backend directory
cd backend/LinkDevIntelligence.API

# Restore dependencies
dotnet restore

# Update database (ensure SQL Server is running)
dotnet ef database update

# Run the application
dotnet run
```

#### Frontend Setup

```bash
# Navigate to frontend directory
cd frontend

# Install dependencies
npm install

# Create environment file
cp .env.example .env.local

# Edit .env.local with your configuration
# NEXT_PUBLIC_API_URL=http://localhost:5000/api

# Start development server
npm run dev
```

## 🔧 Configuration

### Environment Variables

#### Frontend (.env.local)
```env
NEXT_PUBLIC_API_URL=http://localhost:5000/api
NEXT_PUBLIC_APP_ENV=development
NEXT_PUBLIC_APP_NAME=LinkDev Intelligence Hub
```

#### Backend (appsettings.Development.json)
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

### Database Configuration

The application uses SQL Server with Arabic collation support:

```sql
CREATE DATABASE LinkDevIntelligence
COLLATE Arabic_CI_AS;
```

## 🐳 Docker Commands

```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down

# Rebuild services
docker-compose up --build

# Reset everything (caution: deletes data)
docker-compose down -v
docker system prune -a
```

## 🧪 Testing

### Frontend Tests
```bash
cd frontend
npm run test
npm run lint
npm run type-check
```

### Backend Tests
```bash
cd backend/LinkDevIntelligence.API
dotnet test
```

## 🔍 Troubleshooting

### Common Issues

1. **Database Connection Issues**
   - Ensure SQL Server is running
   - Check connection string in appsettings.json
   - Verify database exists and migrations are applied

2. **Frontend Build Issues**
   - Clear node_modules: `rm -rf node_modules && npm install`
   - Clear Next.js cache: `rm -rf .next`
   - Check environment variables

3. **Docker Issues**
   - Ensure Docker is running
   - Check available ports (3000, 5000, 1433)
   - Review docker-compose logs

### Port Configuration

- **Frontend**: 3000
- **Backend**: 5000
- **Database**: 1433
- **Swagger**: 5000/swagger

## 📊 Default Login

For testing purposes, use:
- **Email**: admin@linkdev.com
- **Password**: LinkDev123!

## 🔐 Security Notes

- Change default passwords in production
- Update JWT secret keys
- Configure CORS policies for production domains
- Enable HTTPS in production

## 📖 Additional Resources

- [API Documentation](http://localhost:5000/swagger)
- [Next.js Documentation](https://nextjs.org/docs)
- [.NET Core Documentation](https://docs.microsoft.com/en-us/dotnet/)
- [SQL Server Documentation](https://docs.microsoft.com/en-us/sql/)