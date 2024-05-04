import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export default async function handler(req, res) {
    console.log('Request body:', req.body);
    if (req.method === 'POST') {
        console.log('Adding or updating patient:', req.body.name);
        try {
            const Location = await prisma.Location.create({
                data: {
                    Name: req.body.name,
                    Location: req.body.location,
                    distance: req.body.distance,
                    price: req.body.price,
                    totalSlots  : req.body.totalSlots,
                    available : req.body.availableSlots,
                    image : req.body.image,
                    isPaid: req.body.isPaid,
                }
            });

            res.status(200).json({ result: 'New patient added successfully' });
        
                // Patient doesn't exist, create a new one
                
        } catch (error) {
            console.error('Error adding/updating patient:', error);
            res.status(500).json({ error: "An error occurred while adding/updating patient" });
        }
    }
    
}
