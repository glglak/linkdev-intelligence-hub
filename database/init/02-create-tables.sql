USE LinkDevIntelligence;
GO

-- Users table
CREATE TABLE Users (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Email NVARCHAR(255) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(500) NOT NULL,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Company NVARCHAR(200),
    JobTitle NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    PreferredLanguage CHAR(2) DEFAULT 'ar',
    SubscriptionTier NVARCHAR(20) DEFAULT 'Free',
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME2 DEFAULT GETUTCDATE(),
    UpdatedAt DATETIME2 DEFAULT GETUTCDATE()
);

-- Categories table
CREATE TABLE Categories (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NameAr NVARCHAR(200) NOT NULL,
    NameEn NVARCHAR(200) NOT NULL,
    SlugAr NVARCHAR(200) NOT NULL UNIQUE,
    SlugEn NVARCHAR(200) NOT NULL UNIQUE,
    DescriptionAr NVARCHAR(1000),
    DescriptionEn NVARCHAR(1000),
    IconName NVARCHAR(50),
    SortOrder INT DEFAULT 0,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME2 DEFAULT GETUTCDATE()
);

-- Reports table
CREATE TABLE Reports (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    CategoryId INT NOT NULL,
    TitleAr NVARCHAR(500) NOT NULL,
    TitleEn NVARCHAR(500) NOT NULL,
    SlugAr NVARCHAR(500) NOT NULL UNIQUE,
    SlugEn NVARCHAR(500) NOT NULL UNIQUE,
    ExcerptAr NVARCHAR(1000),
    ExcerptEn NVARCHAR(1000),
    ContentAr NTEXT,
    ContentEn NTEXT,
    CoverImageUrl NVARCHAR(500),
    RequiredTier NVARCHAR(20) DEFAULT 'Free',
    ViewCount INT DEFAULT 0,
    DownloadCount INT DEFAULT 0,
    PublishedAt DATETIME2,
    CreatedAt DATETIME2 DEFAULT GETUTCDATE(),
    UpdatedAt DATETIME2 DEFAULT GETUTCDATE(),
    AuthorId UNIQUEIDENTIFIER NOT NULL,
    IsPublished BIT DEFAULT 0,
    IsFeatured BIT DEFAULT 0,
    
    CONSTRAINT FK_Reports_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
    CONSTRAINT FK_Reports_Users FOREIGN KEY (AuthorId) REFERENCES Users(Id)
);

-- Vendors table
CREATE TABLE Vendors (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NameAr NVARCHAR(200) NOT NULL,
    NameEn NVARCHAR(200) NOT NULL,
    LogoUrl NVARCHAR(500),
    WebsiteUrl NVARCHAR(500),
    DescriptionAr NVARCHAR(2000),
    DescriptionEn NVARCHAR(2000),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME2 DEFAULT GETUTCDATE()
);

-- Market Insights table
CREATE TABLE MarketInsights (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    TitleAr NVARCHAR(300) NOT NULL,
    TitleEn NVARCHAR(300) NOT NULL,
    MetricValue DECIMAL(18,2),
    MetricUnit NVARCHAR(50),
    TrendDirection NVARCHAR(20),
    SourceAr NVARCHAR(200),
    SourceEn NVARCHAR(200),
    DateRecorded DATE,
    CategoryId INT,
    CreatedAt DATETIME2 DEFAULT GETUTCDATE(),
    
    CONSTRAINT FK_MarketInsights_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);

-- Subscriptions table
CREATE TABLE Subscriptions (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    UserId UNIQUEIDENTIFIER NOT NULL,
    TierName NVARCHAR(50) NOT NULL,
    StartDate DATETIME2 NOT NULL,
    EndDate DATETIME2 NOT NULL,
    IsActive BIT DEFAULT 1,
    AutoRenew BIT DEFAULT 1,
    CreatedAt DATETIME2 DEFAULT GETUTCDATE(),
    
    CONSTRAINT FK_Subscriptions_Users FOREIGN KEY (UserId) REFERENCES Users(Id)
);

-- User Activity table
CREATE TABLE UserActivity (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    UserId UNIQUEIDENTIFIER,
    ActivityType NVARCHAR(50) NOT NULL,
    EntityType NVARCHAR(50) NOT NULL,
    EntityId UNIQUEIDENTIFIER NOT NULL,
    Timestamp DATETIME2 DEFAULT GETUTCDATE(),
    UserAgent NVARCHAR(500),
    IpAddress NVARCHAR(50),
    
    CONSTRAINT FK_UserActivity_Users FOREIGN KEY (UserId) REFERENCES Users(Id)
);

-- Create indexes for performance
CREATE INDEX IX_Reports_PublishedAt ON Reports(PublishedAt);
CREATE INDEX IX_Reports_IsFeatured ON Reports(IsFeatured);
CREATE INDEX IX_Reports_CategoryId ON Reports(CategoryId);
CREATE INDEX IX_Reports_RequiredTier ON Reports(RequiredTier);
CREATE INDEX IX_UserActivity_UserId ON UserActivity(UserId);
CREATE INDEX IX_UserActivity_Timestamp ON UserActivity(Timestamp);

GO