import { Router } from "express";
const router = Router();

router.get('/', (req, res) => res.status(200).json({message: "welcome from get all users", role: req.query.role }));
router.get('/:id', (req, res) => res.status(200).json({message: "welcome from get user by id", id: req.params.id}));
router.post('/', (req, res) => res.status(200).json({message: "welcome from add user"}));
router.put('/:id', (req, res) => res.status(200).json({message: "welcome from update user", id: req.params.id}));
router.delete('/:id', (req, res) => res.status(200).json({message: "welcome from delete user", id: req.params.id}));

export default router;