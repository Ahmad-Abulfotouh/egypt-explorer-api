import { Router } from "express";
const router = Router();

router.get('/', (req, res) => res.status(200).json({message: "welcome from get all wishlist items"}));
router.post('/', (req, res) => res.status(200).json({message: "welcome from add wishlist item", itemType: req.body.itemType, itemId: req.body.itemId}));
router.delete('/:id', (req, res) => res.status(200).json({message: "welcome from delete wishlist item", wishlistItemId: req.params.id}));

export default router;