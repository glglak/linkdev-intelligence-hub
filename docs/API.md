# LinkDev Intelligence Hub - API Documentation

## 🌐 Base URL

- **Development**: `http://localhost:5000/api`
- **Production**: `https://api.intelligence.linkdev.com/api`
- **Swagger UI**: `http://localhost:5000/swagger`

## 🔐 Authentication

The API uses JWT Bearer token authentication.

### Login
```http
POST /api/auth/login
Content-Type: application/json

{
  "email": "admin@linkdev.com",
  "password": "LinkDev123!"
}
```

### Response
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "guid",
    "email": "admin@linkdev.com",
    "firstName": "LinkDev",
    "lastName": "Admin",
    "subscriptionTier": "Enterprise"
  }
}
```

### Using the Token
```http
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

## 📊 Reports API

### Get Reports (Paginated)
```http
GET /api/reports?language=ar&page=1&pageSize=10&categoryId=1&requiredTier=Free&featuredOnly=false
```

**Parameters:**
- `language` (string): 'ar' or 'en' (default: 'ar')
- `page` (int): Page number (default: 1)
- `pageSize` (int): Items per page (default: 10, max: 50)
- `categoryId` (int, optional): Filter by category
- `requiredTier` (string, optional): 'Free', 'Pro', 'Enterprise'
- `featuredOnly` (bool): Show only featured reports
- `searchTerm` (string, optional): Search in title and excerpt

**Response:**
```json
{
  "items": [
    {
      "id": "guid",
      "titleAr": "حالة التحول الرقمي في مصر 2025",
      "titleEn": "State of Digital Transformation in Egypt 2025",
      "excerptAr": "تحليل شامل...",
      "excerptEn": "Comprehensive analysis...",
      "coverImageUrl": "https://example.com/image.jpg",
      "requiredTier": "Free",
      "viewCount": 1250,
      "downloadCount": 340,
      "publishedAt": "2025-01-15T10:00:00Z",
      "isFeatured": true,
      "categoryNameAr": "التحول الرقمي",
      "categoryNameEn": "Digital Transformation",
      "authorName": "LinkDev Admin"
    }
  ],
  "totalCount": 25,
  "pageNumber": 1,
  "pageSize": 10,
  "totalPages": 3,
  "hasPreviousPage": false,
  "hasNextPage": true
}
```

### Get Report by Slug
```http
GET /api/reports/{slug}?language=ar
```

**Response:**
```json
{
  "id": "guid",
  "titleAr": "حالة التحول الرقمي في مصر 2025",
  "titleEn": "State of Digital Transformation in Egypt 2025",
  "contentAr": "<h2>نظرة عامة</h2><p>يشهد القطاع الحكومي...</p>",
  "contentEn": "<h2>Overview</h2><p>The government sector...</p>",
  "createdAt": "2025-01-15T10:00:00Z",
  "updatedAt": "2025-01-15T10:00:00Z"
}
```

### Get Featured Reports
```http
GET /api/reports/featured?language=ar&count=6
```

### Get Related Reports
```http
GET /api/reports/{id}/related?language=ar&count=3
```

### Increment Download Count
```http
POST /api/reports/{id}/download
```

## 📂 Categories API

### Get All Categories
```http
GET /api/categories?language=ar
```

**Response:**
```json
[
  {
    "id": 1,
    "nameAr": "التحول الرقمي الحكومي",
    "nameEn": "Government Digital Transformation",
    "descriptionAr": "تقارير وتحليلات...",
    "descriptionEn": "Reports and analysis...",
    "iconName": "government",
    "reportCount": 5
  }
]
```

## 📈 Market Insights API

### Get Market Insights
```http
GET /api/insights?language=ar&categoryId=1&count=10
```

**Response:**
```json
[
  {
    "id": "guid",
    "titleAr": "نمو سوق الحوسبة السحابية",
    "titleEn": "Cloud Computing Market Growth",
    "metricValue": 25.5,
    "metricUnit": "%",
    "trendDirection": "up",
    "sourceAr": "تقرير جارتنر 2025",
    "sourceEn": "Gartner Report 2025",
    "dateRecorded": "2025-01-15"
  }
]
```

## 🏢 Vendors API

### Get Vendors
```http
GET /api/vendors?language=ar
```

**Response:**
```json
[
  {
    "id": 1,
    "nameAr": "مايكروسوفت",
    "nameEn": "Microsoft",
    "logoUrl": "https://example.com/logo.png",
    "websiteUrl": "https://www.microsoft.com",
    "descriptionAr": "شركة رائدة...",
    "descriptionEn": "Leading company..."
  }
]
```

## 👤 User Management API

### Register User
```http
POST /api/auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "SecurePassword123!",
  "firstName": "Ahmed",
  "lastName": "Hassan",
  "company": "Tech Corp",
  "jobTitle": "CTO",
  "preferredLanguage": "ar"
}
```

### Get User Profile
```http
GET /api/users/profile
Authorization: Bearer {token}
```

### Update User Profile
```http
PUT /api/users/profile
Authorization: Bearer {token}
Content-Type: application/json

{
  "firstName": "Ahmed",
  "lastName": "Hassan",
  "company": "Updated Corp",
  "jobTitle": "Chief Technology Officer",
  "preferredLanguage": "en"
}
```

## 📊 Analytics API

### Get User Activity
```http
GET /api/analytics/activity?userId={guid}&startDate=2025-01-01&endDate=2025-01-31
Authorization: Bearer {token}
```

### Get Popular Reports
```http
GET /api/analytics/popular-reports?language=ar&period=month&count=10
```

## ❌ Error Responses

All API endpoints return consistent error formats:

```json
{
  "message": "خطأ في الخادم الداخلي",
  "details": "Detailed error information",
  "timestamp": "2025-01-15T10:00:00Z",
  "path": "/api/reports"
}
```

### HTTP Status Codes

- `200` - Success
- `201` - Created
- `400` - Bad Request
- `401` - Unauthorized
- `403` - Forbidden
- `404` - Not Found
- `409` - Conflict
- `422` - Validation Error
- `500` - Internal Server Error

## 🔄 Rate Limiting

- **Free Tier**: 100 requests/hour
- **Pro Tier**: 1,000 requests/hour
- **Enterprise Tier**: 10,000 requests/hour

## 📝 Request Examples

### cURL Examples

```bash
# Get reports in Arabic
curl -X GET "http://localhost:5000/api/reports?language=ar&page=1" \
  -H "Accept: application/json"

# Get report details with authentication
curl -X GET "http://localhost:5000/api/reports/digital-transformation-egypt-2025?language=ar" \
  -H "Authorization: Bearer {your-token}" \
  -H "Accept: application/json"

# Create new user
curl -X POST "http://localhost:5000/api/auth/register" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "SecurePassword123!",
    "firstName": "Ahmed",
    "lastName": "Hassan"
  }'
```

### JavaScript Examples

```javascript
// Fetch reports with axios
const response = await axios.get('/api/reports', {
  params: {
    language: 'ar',
    page: 1,
    pageSize: 10,
    featuredOnly: true
  }
});

// Login and get token
const loginResponse = await axios.post('/api/auth/login', {
  email: 'admin@linkdev.com',
  password: 'LinkDev123!'
});

const token = loginResponse.data.token;

// Use token for authenticated requests
const userProfile = await axios.get('/api/users/profile', {
  headers: {
    Authorization: `Bearer ${token}`
  }
});
```

## 🔧 Development Tools

### Swagger UI
Access the interactive API documentation at `http://localhost:5000/swagger`

### Postman Collection
Import the API endpoints into Postman for testing:
```
{API_BASE_URL}/swagger/v1/swagger.json
```