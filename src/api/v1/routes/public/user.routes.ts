import { Router } from "express";
const router = Router();

router.get('/', (req, res) => res.status(200).json({message: "welcome from get user by id" }));
router.put('/', (req, res) => res.status(200).json({message: "welcome from update user" }));

export default router;