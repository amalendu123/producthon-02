import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();




export default async function handler(req, res) {
    console.log('Request body:', req.body);
    if (req.method === 'POST') {
        console.log('Adding or updating patient:', req.body.name);
        try {
            const existingLocation = await prisma.Location.findFirst({
                where: {
                    Name: req.body.name // Assuming name is provided in the request body
                }
            });
    
            if (existingLocation !== null) {
                // Patient exists, update their place and disease
                const Location = await prisma.Location.updateMany({
                    where: {
                        Name: req.body.name
                    },
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
    
                res.status(200).json({ result: 'Patient updated successfully' });
            } 
        } catch (error) {
            console.error('Error adding/updating patient:', error);
            res.status(500).json({ error: "An error occurred while adding/updating patient" });
        }
    }
    
}

