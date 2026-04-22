import "./globals.css";

import { Header } from '../components/header';
import { Metadata } from "next";

export const metadata: Metadata ={
  title: 'Aula Next.js',
  description: "Home page of the application",
  openGraph: {
    title: 'Aula Next.js',
    description: "Home page of the application",
  },
  robots: {
    index: true,
    follow: true,
    nocache: true,
    googleBot: {
      index: true,
      follow: true,
    }
  }
}


export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en">
       
      <body className="min-h-full flex flex-col">
        <Header />
        {children}</body>
    </html>
  );
}
