USE LinkDevIntelligence;
GO

-- Insert Categories
INSERT INTO Categories (NameAr, NameEn, SlugAr, SlugEn, DescriptionAr, DescriptionEn, IconName, SortOrder) VALUES
(N'التحول الرقمي الحكومي', 'Government Digital Transformation', 'government-digital', 'government-digital', N'تقارير وتحليلات حول التحول الرقمي في القطاع الحكومي', 'Reports and analysis on digital transformation in government sector', 'government', 1),
(N'تقنيات مايكروسوفت', 'Microsoft Technologies', 'microsoft-tech', 'microsoft-tech', N'رؤى حول منصات وحلول مايكروسوفت في المنطقة', 'Insights on Microsoft platforms and solutions in the region', 'microsoft', 2),
(N'الذكاء الاصطناعي', 'Artificial Intelligence', 'ai-trends', 'ai-trends', N'اتجاهات وتطبيقات الذكاء الاصطناعي في المنطقة', 'AI trends and applications in the region', 'brain', 3),
(N'الأمن السيبراني', 'Cybersecurity', 'cybersecurity', 'cybersecurity', N'تقارير الأمن والحماية الرقمية', 'Security and digital protection reports', 'shield', 4),
(N'الحوسبة السحابية', 'Cloud Computing', 'cloud-computing', 'cloud-computing', N'تحليلات واتجاهات الحوسبة السحابية', 'Cloud computing analysis and trends', 'cloud', 5),
(N'البيانات والتحليلات', 'Data & Analytics', 'data-analytics', 'data-analytics', N'رؤى حول البيانات الضخمة والتحليلات', 'Big data and analytics insights', 'chart', 6);

-- Insert sample admin user
INSERT INTO Users (Email, PasswordHash, FirstName, LastName, Company, JobTitle, PreferredLanguage, SubscriptionTier) VALUES
('admin@linkdev.com', '$2a$11$1234567890123456789012345678901234567890123456789012', 'LinkDev', 'Admin', 'LinkDev', 'System Administrator', 'ar', 'Enterprise');

DECLARE @AdminId UNIQUEIDENTIFIER = (SELECT Id FROM Users WHERE Email = 'admin@linkdev.com');

-- Insert sample reports
INSERT INTO Reports (CategoryId, TitleAr, TitleEn, SlugAr, SlugEn, ExcerptAr, ExcerptEn, ContentAr, ContentEn, RequiredTier, IsPublished, IsFeatured, PublishedAt, AuthorId) VALUES
(1, N'حالة التحول الرقمي في مصر 2025', 'State of Digital Transformation in Egypt 2025', 'digital-transformation-egypt-2025', 'digital-transformation-egypt-2025', 
 N'تحليل شامل لمبادرات التحول الرقمي الحكومية والخاصة في مصر، مع توقعات للسنوات القادمة وأهم التحديات والفرص المتاحة في السوق المصري.',
 'Comprehensive analysis of government and private digital transformation initiatives in Egypt, with forecasts for the coming years and key challenges and opportunities in the Egyptian market.',
 N'<h2>نظرة عامة</h2><p>يشهد القطاع الحكومي في مصر تطوراً ملحوظاً في مجال التحول الرقمي...</p>',
 '<h2>Overview</h2><p>The government sector in Egypt is witnessing remarkable development in digital transformation...</p>',
 'Free', 1, 1, GETUTCDATE(), @AdminId),

(2, N'مقارنة منصات الحوسبة السحابية في دول الخليج', 'Cloud Platform Comparison in GCC Countries', 'cloud-platforms-gcc-comparison', 'cloud-platforms-gcc-comparison',
 N'دراسة مقارنة شاملة بين AWS وAzure وGoogle Cloud في السوق الخليجي من حيث التكلفة والأداء والامتثال.',
 'Comprehensive comparative study between AWS, Azure, and Google Cloud in the Gulf market in terms of cost, performance, and compliance.',
 N'<h2>المقدمة</h2><p>تعتبر منطقة الخليج من أسرع الأسواق نمواً في مجال الحوسبة السحابية...</p>',
 '<h2>Introduction</h2><p>The Gulf region is one of the fastest-growing markets in cloud computing...</p>',
 'Pro', 1, 1, DATEADD(day, -5, GETUTCDATE()), @AdminId),

(3, N'اتجاهات الذكاء الاصطناعي في القطاع المصرفي العربي', 'AI Trends in Arab Banking Sector', 'ai-trends-arab-banking', 'ai-trends-arab-banking',
 N'استطلاع شامل لتطبيقات الذكاء الاصطناعي في البنوك العربية ومستقبل الخدمات المصرفية الذكية.',
 'Comprehensive survey of AI applications in Arab banks and the future of smart banking services.',
 N'<h2>الذكاء الاصطناعي في البنوك</h2><p>تسعى البنوك العربية لتبني تقنيات الذكاء الاصطناعي...</p>',
 '<h2>AI in Banking</h2><p>Arab banks are striving to adopt artificial intelligence technologies...</p>',
 'Pro', 1, 0, DATEADD(day, -10, GETUTCDATE()), @AdminId);

-- Insert sample vendors
INSERT INTO Vendors (NameAr, NameEn, WebsiteUrl, DescriptionAr, DescriptionEn) VALUES
(N'مايكروسوفت', 'Microsoft', 'https://www.microsoft.com', N'شركة رائدة في تقنيات الحوسبة والبرمجيات', 'Leading company in computing and software technologies'),
(N'أمازون ويب سيرفيسز', 'Amazon Web Services', 'https://aws.amazon.com', N'منصة الحوسبة السحابية الرائدة عالمياً', 'Leading global cloud computing platform'),
(N'جوجل كلاود', 'Google Cloud', 'https://cloud.google.com', N'منصة الحوسبة السحابية من جوجل', 'Google cloud computing platform'),
(N'أوراكل', 'Oracle', 'https://www.oracle.com', N'شركة عالمية متخصصة في قواعد البيانات والتطبيقات المؤسسية', 'Global company specialized in databases and enterprise applications');

-- Insert sample market insights
INSERT INTO MarketInsights (TitleAr, TitleEn, MetricValue, MetricUnit, TrendDirection, SourceAr, SourceEn, DateRecorded, CategoryId) VALUES
(N'نمو سوق الحوسبة السحابية في دول الخليج', 'Cloud Computing Market Growth in Gulf Countries', 25.5, '%', 'up', N'تقرير جارتنر 2025', 'Gartner Report 2025', '2025-01-15', 5),
(N'استثمارات الذكاء الاصطناعي في المنطقة', 'AI Investments in the Region', 2.8, 'مليار دولار', 'up', N'تقرير IDC', 'IDC Report', '2025-01-10', 3),
(N'معدل تبني التحول الرقمي في القطاع الحكومي', 'Digital Transformation Adoption Rate in Government Sector', 68, '%', 'up', N'دراسة ديلويت', 'Deloitte Study', '2025-01-05', 1);

-- Update view counts for demo purposes
UPDATE Reports SET ViewCount = FLOOR(RAND() * 2000) + 100;
UPDATE Reports SET DownloadCount = FLOOR(RAND() * 500) + 50;

GO