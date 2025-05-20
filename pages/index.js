import React from 'react'

export async function getServerSideProps() {
  const res = await fetch('http://localhost:3000/api/clinics')
  const clinics = await res.json()

  return {
    props: {
      clinics,
    },
  }
}

export default function Home({ clinics }) {
  return (
    <div>
      <h1>Lista de Clínicas</h1>
      {clinics.length === 0 && <p>Nenhuma clínica cadastrada.</p>}
      <ul>
        {clinics.map((clinic) => (
          <li key={clinic.id}>
            <strong>{clinic.name}</strong> - {clinic.email}
          </li>
        ))}
      </ul>
    </div>
  )
}
