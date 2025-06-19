# Contributing to LinkDev Intelligence Hub

We welcome contributions to the LinkDev Intelligence Hub! This document provides guidelines for contributing to the project.

## 🤝 How to Contribute

### 1. Fork the Repository

```bash
# Fork the repository on GitHub
# Clone your fork
git clone https://github.com/YOUR-USERNAME/linkdev-intelligence-hub.git
cd linkdev-intelligence-hub

# Add upstream remote
git remote add upstream https://github.com/glglak/linkdev-intelligence-hub.git
```

### 2. Create a Feature Branch

```bash
# Create and switch to a new branch
git checkout -b feature/your-feature-name

# Or for bug fixes
git checkout -b fix/issue-description
```

### 3. Make Your Changes

- Follow the existing code style and conventions
- Add tests for new functionality
- Update documentation as needed
- Ensure your code works with both Arabic and English content

### 4. Test Your Changes

```bash
# Frontend tests
cd frontend
npm run lint
npm run type-check
npm run build

# Backend tests
cd backend/LinkDevIntelligence.API
dotnet test
dotnet build

# Integration tests with Docker
docker-compose up --build
```

### 5. Commit Your Changes

Use clear, descriptive commit messages following the convention:

```bash
git commit -m "feat(reports): add Arabic content search functionality"
git commit -m "fix(auth): resolve JWT token expiration issue"
git commit -m "docs(api): update authentication documentation"
```

**Commit Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or modifying tests
- `chore`: Maintenance tasks

### 6. Push and Create Pull Request

```bash
# Push your branch
git push origin feature/your-feature-name

# Create a Pull Request on GitHub
```

## 📋 Development Guidelines

### Code Style

#### Frontend (TypeScript/React)
- Use TypeScript for all new code
- Follow React hooks patterns
- Use functional components
- Implement proper error boundaries
- Support both RTL and LTR layouts

```typescript
// Good example
interface ReportCardProps {
  report: {
    titleAr: string;
    titleEn: string;
    // ... other properties
  };
  locale: string;
}

export function ReportCard({ report, locale }: ReportCardProps) {
  const title = locale === 'ar' ? report.titleAr : report.titleEn;
  
  return (
    <Card className="hover:shadow-lg transition-shadow">
      <CardTitle>{title}</CardTitle>
    </Card>
  );
}
```

#### Backend (C#/.NET)
- Follow C# naming conventions
- Use async/await patterns
- Implement proper error handling
- Add XML documentation for public APIs
- Support both Arabic and English content

```csharp
/// <summary>
/// Gets paginated reports with language support
/// </summary>
/// <param name="language">Language code (ar/en)</param>
/// <param name="page">Page number</param>
/// <param name="pageSize">Items per page</param>
/// <returns>Paginated report results</returns>
public async Task<PagedResult<ReportDto>> GetReportsAsync(
    string language,
    int page = 1,
    int pageSize = 10)
{
    // Implementation
}
```

### Arabic Content Guidelines

1. **Always provide both Arabic and English versions**
2. **Use proper Arabic typography** (Tajawal font)
3. **Test RTL layout** functionality
4. **Validate Arabic text rendering** in all components
5. **Use appropriate Arabic date/number formatting**

### Database Guidelines

1. **Use Arabic collation** for Arabic text fields
2. **Always have both AR and EN columns** for user-facing content
3. **Index frequently queried fields**
4. **Use proper foreign key relationships**

### Testing

#### Frontend Testing
```typescript
// Component testing example
import { render, screen } from '@testing-library/react';
import { ReportCard } from './ReportCard';

test('renders Arabic title when locale is ar', () => {
  const mockReport = {
    titleAr: 'تقرير تقني',
    titleEn: 'Technical Report'
  };
  
  render(<ReportCard report={mockReport} locale="ar" />);
  expect(screen.getByText('تقرير تقني')).toBeInTheDocument();
});
```

#### Backend Testing
```csharp
[Test]
public async Task GetReportsAsync_WithArabicLanguage_ReturnsArabicContent()
{
    // Arrange
    var service = new ReportService(_context, _mapper, _logger);
    
    // Act
    var result = await service.GetReportsAsync("ar", 1, 10);
    
    // Assert
    Assert.That(result.Items.First().TitleAr, Is.Not.Null);
}
```

## 🐛 Bug Reports

When reporting bugs, please include:

1. **Clear description** of the issue
2. **Steps to reproduce** the problem
3. **Expected vs actual behavior**
4. **Environment details** (browser, OS, etc.)
5. **Screenshots** if applicable
6. **Language context** (Arabic/English specific issues)

### Bug Report Template

```markdown
## Bug Description
Brief description of the issue

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- Browser: [e.g. Chrome 91.0]
- OS: [e.g. macOS 11.4]
- Language: [Arabic/English]
- Screen size: [Desktop/Mobile]

## Additional Context
Any other context about the problem here.
```

## 💡 Feature Requests

For new features, please:

1. **Check existing issues** to avoid duplicates
2. **Describe the use case** clearly
3. **Consider Arabic/English implications**
4. **Provide mockups** if applicable
5. **Discuss implementation approach**

### Feature Request Template

```markdown
## Feature Description
Clear description of the proposed feature

## Use Case
Why is this feature needed?

## Proposed Solution
How should this feature work?

## Alternatives Considered
What other approaches did you consider?

## Arabic/English Considerations
How should this feature work in both languages?

## Additional Context
Screenshots, mockups, or other relevant information
```

## 📚 Documentation

When contributing documentation:

1. **Update both English and Arabic** versions when applicable
2. **Use clear, concise language**
3. **Include code examples**
4. **Add screenshots** for UI changes
5. **Update API documentation** for backend changes

## 🔍 Code Review Process

1. **All submissions require review** before merging
2. **Address reviewer feedback** promptly
3. **Update your branch** with latest changes if needed
4. **Ensure CI/CD pipeline passes**
5. **Maintain backward compatibility**

### Review Checklist

- [ ] Code follows project conventions
- [ ] Tests are included and passing
- [ ] Documentation is updated
- [ ] Arabic and English support is maintained
- [ ] No breaking changes (or properly documented)
- [ ] Performance considerations addressed
- [ ] Security implications reviewed

## 🚀 Release Process

1. **Features are merged** to `develop` branch
2. **Release candidates** are created from `develop`
3. **Stable releases** are merged to `main`
4. **Semantic versioning** is used (MAJOR.MINOR.PATCH)

## 📞 Getting Help

- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For questions and general discussion
- **Email**: intelligence@linkdev.com for private matters

## 📄 License

By contributing to LinkDev Intelligence Hub, you agree that your contributions will be licensed under the same license as the project.

## 🙏 Recognition

Contributors will be recognized in:
- Project README
- Release notes
- Contributors page

Thank you for contributing to LinkDev Intelligence Hub! 🎉