import packageRoutes from './package.routes.js';
import productRoutes from './product.routes.js';
import tourRoutes from './tour.routes.js';
import userRoutes from './user.routes.js';

import { Router } from "express";

const router = Router();

router.use('/packages', packageRoutes);
router.use('/products', productRoutes);
router.use('/tours', tourRoutes);
router.use('/users', userRoutes);

export default router;