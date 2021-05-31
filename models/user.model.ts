import { PrismaClient, User } from '@prisma/client';

// const prisma = new PrismaClient();

class UserModel {
    private prisma: PrismaClient
    constructor() {
        this.prisma = new PrismaClient()
    }

    public async getUser() {
        const user = await this.prisma.user.findMany()
        console.log(user)
    }
}

export default UserModel