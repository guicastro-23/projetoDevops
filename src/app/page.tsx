import { Metadata } from "next";


export const metadata: Metadata ={
  title: 'Home - Aula Next.js',
  description: "Home page of the application",
  openGraph: {
    title: 'Home - Aula Next.js',
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

export const revalidate = 60;
export default function Home() {

  const randomNumber = Math.random() * 10;
  return (
    <div>
      <h1>Welcome to the Home Page</h1>
      <h2>Numero gerado: {randomNumber}</h2>
    </div>
  )
}