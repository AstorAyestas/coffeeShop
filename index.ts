
import { PrismaClient, Client } from '@prisma/client';

const prisma = new PrismaClient({
    log: ['query', 'info', `warn`, `error`],
})

const createClient = async () => {
    const client = await prisma.client.create({
        data: {
            name: 'Astor',
            email: 'astor@gmail.com'
        }
    })
    console.log('client', client)
}
const getClients = async () => {
    const clients = await prisma.client.findMany()
    console.log('clients', clients)
}

const createIngredient = async () => {
    const ingredient = await prisma.ingredient.create({
        data: {
            name: 'tomato',
            description: 'The tomato is the edible berry of the plant Solanum lycopersicum, commonly known as a tomato plant.'
        }
    })
}

const createFood = async () => {
    const food = await prisma.food.create({
        data: {
            name: 'salad',
            description: 'Smoky roasted nuts take its place, adding delectable savory bites.',
            nutritionFacts: 'A lightly creamy, sweet & tangy dressing takes the whole thing over the top.',
            price: 19.99,
            images: {
                create: [
                    { url: 'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260' },
                    { url: 'https://images.pexels.com/photos/3987343/pexels-photo-3987343.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260' }
                ],
            },
            ingredients: {
                create: [
                    { name: 'tomato', description: 'The tomato is the edible berry of the plant Solanum lycopersicum, commonly known as a tomato plant.' },
                    { name: 'potato', description: 'The potato is a root vegetable native to the Americas, a starchy tuber of the plant Solanum tuberosum.' },
                    { name: 'carrot', description: 'The carrot is a biennial plant in the umbellifer family, Apiaceae. At first, it grows a rosette of leaves while building up the enlarged taproot.' }
                ]
            }
        }
    })
}

console.log("hola mundo Dev team 504")
//createClient()
//getClients()
//createIngredient()
//createFood()