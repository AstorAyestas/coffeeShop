import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';

const prisma = new PrismaClient()

export const GETMenus = async (request: Request, response: Response) => {
    const menus = await prisma.menu.findMany()
    response.status(200).json(menus)
}
