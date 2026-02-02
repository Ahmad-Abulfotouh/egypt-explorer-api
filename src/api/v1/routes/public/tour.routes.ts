import { Router } from "express";
const router = Router();

router.get('/', (req, res) => res.status(200).json({message: "welcome from get all tours"}));
router.get('/:id', (req, res) => res.status(200).json({message: "welcome from get tour by id", id: req.params.id}));

export default router;