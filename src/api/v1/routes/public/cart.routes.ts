import { Router } from "express";
const router = Router();

router.get('/', (req, res) => res.status(200).json({message: "welcome from get all cart items"}));
router.post('/', (req, res) => res.status(200).json({message: "welcome from add cart item", itemType: req.body.itemType, itemId: req.body.itemId}));
router.delete('/:id', (req, res) => res.status(200).json({message: "welcome from delete cart item", cartItemId: req.params.id}));

export default router;