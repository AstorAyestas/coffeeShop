import { Router } from 'express';
import { GETMenus } from '../controllers/menu.controller';

const routerMenu = Router()
export const pathMenu = '/menu'

routerMenu.get('/', GETMenus)

export default routerMenu;