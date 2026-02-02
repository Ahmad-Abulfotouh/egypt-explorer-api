import { Router } from "express";
const router = Router();

router.post('/', (req, res) => res.status(200).json({message: "welcome from add rating"}));
router.put('/:id', (req, res) => res.status(200).json({message: "welcome from update rating", id: req.params.id}));

export default router;