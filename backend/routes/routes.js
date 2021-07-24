// import express
import express from "express";
 
// import function from controller
import { showusers, showuserById, createuser, updateuser, deleteuser, showabsens, createabsen } from "../controllers/user.js";
 
// init express router
const router = express.Router();
 
// Get All user
router.get('/daftar', showusers);
 
// Get Single user
router.get('/daftar/:email', showuserById);
 
// Create New user
router.post('/buat', createuser);
 
// Update user
router.put('/ubah/:id', updateuser);
 
// Delete user
router.delete('/hapus/:id', deleteuser);

// Get All absen
router.get('/absen', showabsens);

// Create New absen
router.post('/buatabsen', createabsen);
 
// export default router
export default router;