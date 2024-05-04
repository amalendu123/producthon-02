import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export default async function handler(req, res) {
    if (req.method === 'GET') {
        try {
            const searchResults = await prisma.Location.findMany();
            res.status(200).json({ searchResults });
        } catch (error) {
            console.error('Error searching:', error);
            res.status(500).json({ error: "An error occurred while searching" });
        }
    } else {
        res.status(405).json({ error: "Method not allowed" });
    }
}
