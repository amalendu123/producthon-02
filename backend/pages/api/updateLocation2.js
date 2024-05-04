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
    
            if (existingLocation !== null && req.body.availableSlots > 0) {
                // Patient exists, update their place and disease
                const Location = await prisma.Location.updateMany({
                    where: {
                        Name: req.body.name
                    },
                    data: {
                        available : req.body.availableSlots - 1,
                        bookedvechicle : req.body.number,
                    }
                });
    
                res.status(200).json({ result: 'User updated successfully' });
            } 
        } catch (error) {
            console.error('Error adding/updating user', error);
            res.status(500).json({ error: "An error occurred while adding/updating user" });
        }
    }
    
}

