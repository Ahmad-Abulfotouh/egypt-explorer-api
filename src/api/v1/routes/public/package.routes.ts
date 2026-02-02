import { Router } from "express";
const router = Router();

router.get('/', (req, res) => res.status(200).json({message: "welcome from get all packages"}));
router.get('/:id', (req, res) => res.status(200).json({message: "welcome from get package by id", id: req.params.id}));

export default router;