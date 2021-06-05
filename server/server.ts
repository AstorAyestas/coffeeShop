import express, { Application } from 'express';
import routerMenu, { pathMenu } from '../routes/menu.route'

class Server {
    private application: Application
    private port: string
    constructor() {
        this.port = '8080'
        this.application = express()
        this.config()
        this.routes()
    }
    private config() {
        this.application.use(express.json())
    }
    public run() {
        const serverMessage = () => console.log(`Server running on port ${this.port}`)
        this.application.listen(this.port, serverMessage)
    }
    private routes() {
        this.application.use(pathMenu, routerMenu)
    }

}

export default Server