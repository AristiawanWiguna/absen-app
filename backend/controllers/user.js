// Import function from user Model
import { getusers, getuserById, insertuser, updateuserById, deleteuserById, insertabsen, getabsens } from "../models/userModel.js";


// Get All users
export const showusers = (req, res) => {
    getusers((err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}
 
// Get Single user 
export const showuserById = (req, res) => {
    getuserById(req.params.email, (err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}
 
// Create New user
export const createuser = (req, res) => {
    const data = req.body;
    insertuser(data, (err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}
 
// Update user
export const updateuser = (req, res) => {
    const data  = req.body;
    const id    = req.params.id;
    updateuserById(data, id, (err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}
 
// Delete user
export const deleteuser = (req, res) => {
    const id = req.params.id;
    deleteuserById(id, (err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}

//Get All absen
export const showabsens= (req, res) => {
    getabsens((err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}

// Create New absen
export const createabsen = (req, res) => {
    const data = req.body.email;
    insertabsen(data, (err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}