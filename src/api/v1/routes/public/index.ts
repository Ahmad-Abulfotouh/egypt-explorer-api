import cartRoutes from './cart.routes.js';
import commentRoutes from './comment.routes.js';
import packageRoutes from './package.routes.js';
import productRoutes from './product.routes.js';
import ratingRoutes from './rating.routes.js';
import tourRoutes from './tour.routes.js';
import userRoutes from './user.routes.js';
import wishlistRoutes from './wishlist.routes.js';

import { Router } from "express";

const router = Router();

router.use('/cart', cartRoutes);
router.use('/comments', commentRoutes);
router.use('/packages', packageRoutes);
router.use('/products', productRoutes);
router.use('/rating', ratingRoutes);
router.use('/tours', tourRoutes);
router.use('/users', userRoutes);
router.use('/wishlist', wishlistRoutes);

export default router;