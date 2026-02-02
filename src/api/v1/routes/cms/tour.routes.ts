import { Router } from "express";
const router = Router();

router.get('/', (req, res) => res.status(200).json({message: "welcome from get all tours"}));
router.get('/:id', (req, res) => res.status(200).json({message: "welcome from get tour by id", id: req.params.id}));
router.post('/', (req, res) => res.status(200).json({message: "welcome from add tour"}));
router.put('/:id', (req, res) => res.status(200).json({message: "welcome from update tour", id: req.params.id}));
router.delete('/:id', (req, res) => res.status(200).json({message: "welcome from delete tour", id: req.params.id}));

export default router;