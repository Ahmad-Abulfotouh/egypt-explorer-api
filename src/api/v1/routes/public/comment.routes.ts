import { Router } from "express";
const router = Router();

router.get('/', (req, res) => res.status(200).json({message: "welcome from get all comments"}));
router.post('/', (req, res) => res.status(200).json({message: "welcome from add cart item", itemType: req.body.itemType, itemId: req.body.itemId, content: req.body.content}));
router.put('/:id', (req, res) => res.status(200).json({message: "welcome from delete cart item" }));

export default router;