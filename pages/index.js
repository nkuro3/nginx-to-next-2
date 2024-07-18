import { useEffect, useState } from 'react'

export default function Home() {
  const [currentTime, setCurrentTime] = useState('')

  useEffect(() => {
    setCurrentTime(new Date().toLocaleString())
  }, [])

  return (
    <div>
      <h1>{process.env.NEXT_PUBLIC_APP_NAME}</h1>
      <p>Current environment: {process.env.NODE_ENV}</p>
      <p>API URL: {process.env.NEXT_PUBLIC_API_URL}</p>
      <p>Current time: {currentTime}</p>
      <p>{process.env.NEXT_PUBLIC_COMMON}</p>
    </div>
  )
}