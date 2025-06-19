#!/bin/bash

# LinkDev Intelligence Hub - Development Setup Script
set -e

echo "🚀 Setting up LinkDev Intelligence Hub..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check Docker installation
if ! command -v docker &> /dev/null; then
    print_error "Docker is not installed. Please install Docker first."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    print_error "Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Create directories
print_status "Creating project directories..."
mkdir -p logs database/backups

# Setup environment files
print_status "Setting up environment files..."
if [ ! -f frontend/.env.local ]; then
    cat > frontend/.env.local << EOF
NEXT_PUBLIC_API_URL=http://localhost:5000/api
NEXT_PUBLIC_APP_ENV=development
NEXT_PUBLIC_APP_NAME=LinkDev Intelligence Hub
EOF
    print_success "Created frontend/.env.local"
fi

# Build and start services
print_status "Building and starting services..."
docker-compose down --remove-orphans
docker-compose up --build -d

# Wait for services
print_status "Waiting for services to start..."
sleep 30

# Check services
if docker-compose ps | grep -q "Up"; then
    print_success "Services are running!"
    echo ""
    echo "🌐 Application URLs:"
    echo "   Frontend: http://localhost:3000"
    echo "   Backend API: http://localhost:5000"
    echo "   API Documentation: http://localhost:5000/swagger"
    echo ""
    echo "📊 Default Login:"
    echo "   Email: admin@linkdev.com"
    echo "   Password: LinkDev123!"
    echo ""
    print_success "Setup complete! Happy coding! 🎉"
else
    print_error "Some services failed to start. Check logs with: docker-compose logs"
    exit 1
fi