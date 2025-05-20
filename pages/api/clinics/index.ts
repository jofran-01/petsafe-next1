import type { NextApiRequest, NextApiResponse } from 'next'
import prisma from '../../../lib/prisma'

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  if (req.method === 'GET') {
    try {
      const clinics = await prisma.clinic.findMany()
      res.status(200).json(clinics)
    } catch (error) {
      res.status(500).json({ error: 'Erro ao buscar clínicas' })
    }
  } else {
    res.setHeader('Allow', ['GET'])
    res.status(405).end(`Method ${req.method} Not Allowed`)
  }
}
