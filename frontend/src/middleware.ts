import createMiddleware from 'next-intl/middleware';
import { NextRequest, NextResponse } from 'next/server';

const intlMiddleware = createMiddleware({
  locales: ['ar', 'en'],
  defaultLocale: 'ar',
  localePrefix: 'as-needed'
});

export default function middleware(request: NextRequest) {
  // Apply internationalization middleware
  const response = intlMiddleware(request);

  // Add security headers
  const requestHeaders = new Headers(response.headers);
  
  // Security headers
  requestHeaders.set('X-DNS-Prefetch-Control', 'on');
  requestHeaders.set('Strict-Transport-Security', 'max-age=63072000; includeSubDomains; preload');
  requestHeaders.set('X-Frame-Options', 'DENY');
  requestHeaders.set('X-Content-Type-Options', 'nosniff');
  requestHeaders.set('Referrer-Policy', 'strict-origin-when-cross-origin');

  return NextResponse.next({
    request: {
      headers: requestHeaders,
    },
  });
}

export const config = {
  matcher: [
    '/((?!api|_next/static|_next/image|favicon.ico|sitemap.xml|robots.txt).*)'
  ],
};